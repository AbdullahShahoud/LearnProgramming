// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_programtion/features/teacher/courses/Ui/widget/edite_qaution_bloc_listener.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../widget/button.dart';
import '../../../../widget/text_from.dart';
import '../../../courses/logic/courses_cubit/cubit/courser_cubit_cubit.dart';
import '../../../courses/logic/courses_cubit/cubit/courser_cubit_state.dart';
import '../../logic/model/courses_response.dart';

Widget FromEidte(BuildContext context, Quations quation, int id) {
  return BlocConsumer<CourserCubitTeacher, CourserCubitTeacherState>(
    listener: (context, state) {
      // TODO: implement listener
    },
    builder: (context, state) {
      var cubit = context.read<CourserCubitTeacher>();
      cubit.controllerEidteQuation =
          TextEditingController(text: quation.question);
      cubit.controllerEidteResponseOne = TextEditingController(text: quation.a);
      cubit.controllerEidteResponseTwo = TextEditingController(text: quation.b);
      cubit.controllerEidteResponseThree =
          TextEditingController(text: quation.c);
      cubit.controllerEidteResponseCorrect =
          TextEditingController(text: quation.correct_choice);
      return Form(
          key: cubit.keyeEidteTest,
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
                controller: cubit.controllerEidteQuation!,
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
                controller: cubit.controllerEidteResponseOne!,
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
                controller: cubit.controllerEidteResponseTwo!,
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
                controller: cubit.controllerEidteResponseThree!,
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
                controller: cubit.controllerEidteResponseCorrect!,
                icon: SizedBox.shrink(),
                keyboardType: TextInputType.emailAddress,
                context: context),
            EditeQuationsBlocListener(),
            button(
                text: 'حفظ',
                paddingH: 140.w,
                paddingV: 16.h,
                function: () {
                  cubit.emitEidteQuationsTeacher(id);
                })
          ]));
    },
  );
}
