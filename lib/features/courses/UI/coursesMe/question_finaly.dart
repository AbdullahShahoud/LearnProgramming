import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_programtion/core/helper/extention.dart';
import 'package:learn_programtion/core/theming/color.dart';
import 'package:learn_programtion/core/theming/font_style.dart';
import 'package:learn_programtion/features/courses/logic/cubit/cubit/coursees_cubit.dart';
import 'package:learn_programtion/features/widget/button.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/routing/router.dart';
import '../../logic/cubit/cubit/coursees_state.dart';
import '../../widget/finish_course_bloc_listener.dart';
import '../../widget/quation_item.dart';
import '../../widget/soulion_bloc_listener.dart';

class QuestionFinaly extends StatefulWidget {
  const QuestionFinaly({super.key});

  @override
  State<QuestionFinaly> createState() => _QuestionFinalyState();
}

class _QuestionFinalyState extends State<QuestionFinaly> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('الاختبار النهائي'),
        ),
        body: BlocBuilder<CourseesCubit, CoursesState>(
          builder: (context, state) {
            final test =
                CourseesCubit.get(context).seletCourseMe?.course!.finalTest;
            return SafeArea(
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        textDirection: TextDirection.rtl,
                        'وقت هذالامتحان 10 دقائق',
                        textAlign: TextAlign.right,
                        style: FontStyleAndText.fontmedia
                            .copyWith(color: ColorManger.primary_ColorBlue),
                      ),
                    ),
                  ),
                  verticalBox(5.h),
                  QuationItem(test!),
                  verticalBox(10.h),
                  SoulionBlocListener(),
                  // FinishCourseBlocListener(),
                  button(
                      text: 'النتيجة',
                      paddingV: 16.h,
                      paddingH: 140.w,
                      function: () {
                        CourseesCubit.get(context).emitSouliontest(test);
                        // CourseesCubit.get(context).emitFinishCourse();
                      })
                ],
              )),
            );
          },
        ));
  }
}
