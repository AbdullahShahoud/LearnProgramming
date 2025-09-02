import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_programtion/core/helper/extention.dart';
import 'package:learn_programtion/features/teacher/courses/Ui/widget/level_Item_tc.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/routing/router.dart';
import '../../../../core/theming/font_style.dart';
import '../../../courses/widget/tab_bar_course.dart';
import '../logic/courses_cubit/cubit/courser_cubit_cubit.dart';
import '../logic/courses_cubit/cubit/courser_cubit_state.dart';

class LevelsTeacher extends StatelessWidget {
  const LevelsTeacher({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<CourserCubitTeacher, CourserCubitTeacherState>(
      listener: (context, state) {},
      builder: (context, state) {
        final course = context.read<CourserCubitTeacher>().selectedcorse;
        return SafeArea(
            child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            TabBarCourse(image: course!.image!, name: course.name!),
            verticalBox(10.h),
            Text('المستويات', style: FontStyleAndText.homefont),
            Container(
                height: 500.h,
                child: ListView.builder(
                    itemCount: course.level!.length,
                    itemBuilder: (context, index) {
                      final level = course.level![index];
                      return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6.w),
                          child: InkWell(
                            onTap: () {
                              context
                                  .read<CourserCubitTeacher>()
                                  .selectedlevel = level;
                              context.pushNamed(Routers.lesson_teacher);
                            },
                            child: LevelItemTeacher(
                              image: course.image!,
                              name: course.level![index].name!,
                            ),
                          ));
                    })),
          ]),
        ));
      },
    ));
  }
}
