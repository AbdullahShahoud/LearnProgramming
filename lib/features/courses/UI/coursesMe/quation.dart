import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_programtion/core/helper/spacing.dart';
import 'package:learn_programtion/features/courses/logic/cubit/cubit/coursees_cubit.dart';

import '../../../../core/theming/color.dart';
import '../../../../core/theming/font_style.dart';
import '../../../widget/button.dart';
import '../../logic/cubit/cubit/coursees_state.dart';
import '../../widget/quation_item.dart';
import '../../widget/soulion_bloc_listener.dart';

class QuationLevel extends StatelessWidget {
  const QuationLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('الاختبار'),
        ),
        body: BlocBuilder<CourseesCubit, CoursesState>(
          builder: (context, state) {
            final testLevel = CourseesCubit.get(context).selectedlevelMe?.test;
            return SafeArea(
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
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
                  QuationItem(testLevel!),
                  verticalBox(10.h),
                  SoulionBlocListener(),
                  button(
                      text: 'النتيجة',
                      paddingV: 16.h,
                      paddingH: 140.w,
                      function: () {
                        CourseesCubit.get(context).emitSouliontest(testLevel);
                        CourseesCubit.get(context).responseUser2 =
                            List.generate(10, (index) => '');
                      })
                ],
              )),
            );
          },
        ));
  }
}
