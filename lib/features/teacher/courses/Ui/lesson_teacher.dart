import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_programtion/core/helper/extention.dart';
import 'package:learn_programtion/features/teacher/courses/logic/courses_cubit/cubit/courser_cubit_cubit.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/routing/router.dart';
import '../../../../core/theming/font_style.dart';
import '../../../courses/widget/tab_bar_course.dart';
import '../../../widget/button.dart';
import '../logic/courses_cubit/cubit/courser_cubit_state.dart';
import 'widget/lesson_item_tc.dart';

class LessonTeacher extends StatelessWidget {
  const LessonTeacher({super.key});

  @override
  Widget build(BuildContext context) {
    final levelMe = context.read<CourserCubitTeacher>().selectedlevel!;
    final coures = context.read<CourserCubitTeacher>().selectedcorse;
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<CourserCubitTeacher, CourserCubitTeacherState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TabBarCourse(image: coures!.image!, name: coures.name!),
                    verticalBox(10.h),
                    Text('الدروس', style: FontStyleAndText.fontbold),
                    Container(
                      height: 540.h,
                      child: ListView.builder(
                          itemCount: levelMe.lessons!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6.w),
                              child: InkWell(
                                onTap: () {
                                  CourserCubitTeacher.get(context)
                                      .selectedlesson = levelMe.lessons![index];
                                  context
                                      .pushNamed(Routers.lesson_body_teacher);
                                },
                                child: LessonItemTeacher(
                                    image: coures.image!,
                                    name: levelMe.lessons![index].name!,
                                    lesson: levelMe.lessons![index]),
                              ),
                            );
                          }),
                    ),
                    verticalBox(10.h),
                    button(
                        text: 'الاختبار',
                        paddingV: 16.h,
                        paddingH: 140.w,
                        function: () {
                          context.pushNamed(Routers.test_teacher);
                        })
                  ]),
            );
          },
        ),
      ),
    );
  }
}
