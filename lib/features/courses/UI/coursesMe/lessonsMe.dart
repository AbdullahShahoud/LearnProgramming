import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_programtion/core/helper/extention.dart';
import 'package:learn_programtion/features/courses/logic/cubit/cubit/coursees_cubit.dart';
import 'package:learn_programtion/features/courses/logic/cubit/cubit/coursees_state.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/routing/router.dart';
import '../../../../core/theming/font_style.dart';
import '../../../widget/button.dart';
import '../../widget/finish_level_bloc_Listener.dart';
import '../../widget/lesson_item_me.dart';
import '../../widget/tab_bar_course.dart';

class LessonsMe extends StatelessWidget {
  LessonsMe({super.key});
  @override
  Widget build(BuildContext context) {
    final levelMe = context.read<CourseesCubit>().selectedlevelMe!;
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<CourseesCubit, CoursesState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            final coures = context.read<CourseesCubit>().seletCourseMe;
            return SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TabBarCourse(
                        image: coures!.course!.image!,
                        name: coures.course!.name!),
                    verticalBox(10.h),
                    Text('الدروس', style: FontStyleAndText.fontbold),
                    Container(
                      height: 620.h,
                      child: ListView.builder(
                          itemCount: levelMe.lessons!.length,
                          itemBuilder: (context, index) {
                            final lessonMe = levelMe.lessons![index];
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6.w),
                              child: InkWell(
                                onTap: () {
                                  CourseesCubit.get(context)
                                      .selectLessonMe(lessonMe);
                                  context.pushNamed(Routers.lesson_intro_Me);
                                },
                                child: LessonItemMe(
                                    context: context,
                                    image: coures.course!.image!,
                                    text: lessonMe.name!,
                                    finish: lessonMe.finished!),
                              ),
                            );
                          }),
                    ),
                    verticalBox(10.h),
                    FinishLevelBlocListener(),
                    button(
                        text: 'الاختبار',
                        paddingV: 16.h,
                        paddingH: 140.w,
                        function: () {
                          if (levelMe.finished == false) {
                            context.read<CourseesCubit>().emitFinishLevel();
                            context.pushNamed(Routers.questions);
                          }
                          context.pushNamed(Routers.levelMe);
                        })
                  ]),
            );
          },
        ),
      ),
    );
  }
}
