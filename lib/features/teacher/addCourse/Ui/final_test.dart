import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_programtion/core/helper/extention.dart';
import 'package:learn_programtion/core/routing/router.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/theming/color.dart';
import '../../../../core/theming/font_style.dart';
import '../../../widget/button.dart';
import '../../courses/Ui/widget/qautions_item_tc.dart';
import '../../courses/logic/courses_cubit/cubit/courser_cubit_cubit.dart';
import '../../courses/logic/courses_cubit/cubit/courser_cubit_state.dart';

class FinalTestTeacher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('الاختبار النهائي'),
        ),
        body: BlocBuilder<CourserCubitTeacher, CourserCubitTeacherState>(
          builder: (context, state) {
            final testLevel = CourserCubitTeacher.get(context).finalTest;
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
                  QuationItemTeacher(testLevel!),
                  verticalBox(10.h),
                  button(
                      text: 'حفظ',
                      paddingV: 16.h,
                      paddingH: 140.w,
                      function: () {
                        context.pushNamed(Routers.home_page_teacher);
                      })
                ],
              )),
            );
          },
        ));
  }
}
