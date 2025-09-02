// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../widget/button.dart';
import '../../../../widget/text_from.dart';
import '../../../courses/logic/courses_cubit/cubit/courser_cubit_cubit.dart';
import '../../../courses/logic/courses_cubit/cubit/courser_cubit_state.dart';

Widget FromTest(BuildContext context) {
  return BlocConsumer<CourserCubitTeacher, CourserCubitTeacherState>(
    listener: (context, state) {
      // TODO: implement listener
    },
    builder: (context, state) {
      return Form(
          key: context.read<CourserCubitTeacher>().keyeTest,
          child: Column(children: [
            verticalBox(10.h),
            FromFields(
                vaildet: (value) {
                  if (value!.isEmpty || value == null) {
                    return 'الرجاء ادخال السؤال';
                  }
                },
                paddingContentV: 18.h,
                hint: 'السؤال',
                controller:
                    context.read<CourserCubitTeacher>().controllerAddQuation,
                icon: SizedBox.shrink(),
                keyboardType: TextInputType.name,
                context: context),
            FromFields(
                vaildet: (value) {
                  if (value!.isEmpty || value == null) {
                    return 'الرجاء ادخال الخيار الاول';
                  }
                },
                paddingContentV: 18.h,
                hint: 'الخيار الاول',
                controller: context
                    .read<CourserCubitTeacher>()
                    .controllerAddResponseOne,
                icon: SizedBox.shrink(),
                keyboardType: TextInputType.emailAddress,
                context: context),
            FromFields(
                vaildet: (value) {
                  if (value!.isEmpty || value == null) {
                    return 'الرجاء ادخال الخيار الثاني';
                  }
                },
                paddingContentV: 18.h,
                hint: 'الخيار الثاني',
                controller: context
                    .read<CourserCubitTeacher>()
                    .controllerAddResponseTwo,
                icon: SizedBox.shrink(),
                keyboardType: TextInputType.emailAddress,
                context: context),
            FromFields(
                vaildet: (value) {
                  if (value!.isEmpty || value == null) {
                    return 'الرجاء ادخال الخيار الثالث';
                  }
                },
                paddingContentV: 18.h,
                hint: 'الخيار الثالث',
                controller: context
                    .read<CourserCubitTeacher>()
                    .controllerAddResponseThree,
                icon: SizedBox.shrink(),
                keyboardType: TextInputType.emailAddress,
                context: context),
            FromFields(
                vaildet: (value) {
                  if (value!.isEmpty || value == null) {
                    return 'الرجاء ادخال الاجابة الصحيحة';
                  }
                },
                paddingContentV: 18.h,
                hint: 'الاجابة الصحيحة',
                controller: context
                    .read<CourserCubitTeacher>()
                    .controllerAddResponseCorrect,
                icon: SizedBox.shrink(),
                keyboardType: TextInputType.emailAddress,
                context: context),
            button(
                text: 'حفظ',
                paddingH: 140.w,
                paddingV: 16.h,
                function: () {
                  context.read<CourserCubitTeacher>().addQuarions();
                })
          ]));
    },
  );
}
