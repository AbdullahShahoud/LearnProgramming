import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learn_programtion/core/helper/extention.dart';
import 'package:learn_programtion/core/theming/color.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/routing/router.dart';
import '../../../../../core/theming/font_style.dart';
import '../../logic/courses_cubit/cubit/courser_cubit_cubit.dart';
import '../../logic/courses_cubit/cubit/courser_cubit_state.dart';
import '../../logic/model/courses_response.dart';
import 'category_courses_teacher.dart';

// Example data for testing CoursesResponseTc with all nested classes
// List<CoursesResponseTc> getSampleCourses = [
//   CoursesResponseTc(
//     id: 1,
//     name: "Flutter Advanced",
//     descrip: "Complete Flutter development course with state management",
//     teacher: 101,
//     nameTeacher: "Ahmed Mohamed",
//     num_of_level: 3,
//     image: "assets/image/images.png",
//     type: "Programming",
//     time: 30,
//     finalTest: Tests(
//       questions: [
//         Quations(
//           question: "What is the difference between Provider and Bloc?",
//           a: "Provider uses InheritedWidget",
//           b: "Bloc uses Streams",
//           c: "Both use the same architecture",
//           correct_choice: "a",
//         ),
//         Quations(
//           question: "Which widget is used for navigation?",
//           a: "Navigator",
//           b: "Router",
//           c: "Both",
//           correct_choice: "c",
//         ),
//       ],
//     ),
//     level: [
//       Levels(
//         id: 1,
//         name: "Dart Fundamentals",
//         num_of_lesson: 4,
//         test: Tests(questions: [
//           Quations(
//             question: "What is Dart's null safety?",
//             a: "A way to prevent null errors",
//             b: "A design pattern",
//             c: "A state management solution",
//             correct_choice: "a",
//           ),
//         ]),
//         lessons: [
//           Lessons(
//             id: "1",
//             name: "Introduction to Dart",
//             description: "Basic syntax and features",
//             video: "https://example.com/videos/dart-intro.mp4",
//           ),
//         ],
//       ),
//       Levels(
//         id: 2,
//         name: "UI Development",
//         num_of_lesson: 5,
//         lessons: [
//           Lessons(
//             id: "2",
//             name: "Widgets Basics",
//             description: "Stateless vs Stateful widgets",
//             video: "https://example.com/videos/widgets-basics.mp4",
//           ),
//         ],
//       ),
//     ],
//   ),
//   CoursesResponseTc(
//     id: 2,
//     name: "Python Data Science",
//     descrip: "Data analysis with Python and Pandas",
//     teacher: 102,
//     nameTeacher: "Sarah Ali",
//     num_of_level: 2,
//     image: "assets/image/images.png",
//     type: "Data Science",
//     time: 20,
//     level: [
//       Levels(
//         id: 1,
//         name: "Python Basics",
//         num_of_lesson: 3,
//         lessons: [
//           Lessons(
//             id: "1",
//             name: "Variables and Data Types",
//             description: "Understanding Python variables",
//             video: "https://example.com/videos/python-vars.mp4",
//           ),
//         ],
//       ),
//     ],
//   ),
// ];

class CoursesBlocListenerCubit extends StatelessWidget {
  const CoursesBlocListenerCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourserCubitTeacher, CourserCubitTeacherState>(
        buildWhen: (previous, current) =>
            current is LoadingCourses ||
            current is SuccessCourses ||
            current is ErrorCourses,
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return SizedBox.shrink();
            },
            successCourses: (data) {
              return successCourse(data);
            },
            errorCourses: (error) {
              return Error();
            },
            loadinCourses: () {
              return loading(context);
            },
          );
        });
  }
}

Widget successCourse(List<CoursesResponseTc> CoursesData) {
  return CategoryCoursesTeacher(CoursesData);
}

Widget Error() {
  return Center(
    child: SvgPicture.asset(
      'assets/svg/404error.svg',
      width: 100.w,
      height: 100.h,
    ),
  );
}

Widget loading(BuildContext context) {
  return Container(
    height: 600.h,
    child: ListView.builder(
      itemBuilder: (context, index) => Shimmer.fromColors(
        baseColor: ColorManger.lightGray,
        highlightColor: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(bottom: 5.h),
          child: InkWell(
            onTap: () {
              context.pushNamed(Routers.lesson);
            },
            child: Card(
              color: Colors.white,
              child: Column(
                children: [
                  Stack(children: [
                    ClipRRect(
                      child: Image.asset(
                        'assets/image/unnamed.png',
                        height: 250.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                    ),
                    Container(
                      height: 250.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.center,
                            colors: [
                              Color.fromARGB(94, 44, 44, 44),
                              Color.fromARGB(167, 56, 56, 56),
                            ],
                            stops: [
                              0.5,
                              0.3,
                            ]),
                      ),
                    ),
                    Positioned(
                        bottom: 6,
                        right: 8.w,
                        child: Column(
                            //  crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('كورس برمجة',
                                  style: FontStyleAndText.fontbold
                                      .copyWith(color: Colors.white)),
                              verticalBox(8.h),
                              Text(
                                'وائل ابو حمزة',
                                style: FontStyleAndText.fontbold
                                    .copyWith(color: Colors.white),
                              ),
                              verticalBox(8.h),
                            ]))
                  ]),
                  verticalBox(6.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Flutter عبارة عن إطار عمل مفتوح المصدر تطوّره Google وتدعمه. يستخدم مطورو الواجهة الأمامية والمطورون الشاملون Flutter لإنشاء واجهة مستخدم (UI) للتطبيق تعمل على منصات متعددة بتعليمة برمجية أساسية واحدة.',
                      style: FontStyleAndText.fontmedia,
                      textAlign: TextAlign.right,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  verticalBox(8.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'تطبيقات موبايل ',
                        textAlign: TextAlign.right,
                        style: FontStyleAndText.fontsmall,
                      ),
                    ),
                  ),
                  verticalBox(6.h),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    child: Row(
                      children: [
                        Text(
                          'واحدات 6',
                          style: FontStyleAndText.fontsmall,
                        ),
                        Spacer(),
                        Text(
                          'مدة الكورس 15 يوم',
                          style: FontStyleAndText.fontsmall,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      itemCount: 5,
      scrollDirection: Axis.vertical,
    ),
  );
}
