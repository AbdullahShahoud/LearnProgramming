// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_programtion/core/helper/extention.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/routing/router.dart';
import '../../../../core/theming/color.dart';
import '../../../../core/theming/font_style.dart';
import '../../../widget/button.dart';
import '../../../widget/text_from.dart';
import '../../courses/logic/courses_cubit/cubit/courser_cubit_cubit.dart';

class EditeLessionTeacher extends StatelessWidget {
  const EditeLessionTeacher({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(
            'تعديل درس',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FromFields(
                color: Color.fromARGB(48, 121, 98, 248),
                vaildet: (value) {
                  if (value!.isEmpty || value == null) {
                    return 'الرجاء ادخال الاسم';
                  }
                },
                paddingContentV: 18.h,
                hint: 'اسم الدرس',
                controller:
                    context.read<CourserCubitTeacher>().controllerNameLession,
                icon: SizedBox.shrink(),
                // init_value:
                //     context.read<CourserCubitTeacher>().selectedlesson!.name,
                keyboardType: TextInputType.name,
                context: context),
            verticalBox(10.h),
            FromFields(
                color: Color.fromARGB(48, 121, 98, 248),
                vaildet: (value) {
                  if (value!.isEmpty || value == null) {
                    return 'الرجاء ادخال رابط الفيديو';
                  }
                },
                paddingContentV: 18.h,
                hint: 'رابط الفيديو ',
                controller:
                    context.read<CourserCubitTeacher>().controllerLinkLession,
                icon: SizedBox.shrink(),
                keyboardType: TextInputType.emailAddress,
                // init_value:
                //     context.read<CourserCubitTeacher>().selectedlesson!.video,
                context: context),
            verticalBox(10.h),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty || value == null) {
                  return 'الرجاء ادخال وصف الدرس';
                }
                return null;
              },
              controller:
                  context.read<CourserCubitTeacher>().controllerDescripLession,
              cursorColor: Colors.white,
              maxLines: 12,
              // initialValue: context
              //     .read<CourserCubitTeacher>()
              //     .selectedlesson!
              //     .description,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w200,
                color: ColorManger.font,
              ),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(48, 121, 98, 248),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 150.h, horizontal: 50.w),
                  hintText: 'وصف الدرس',
                  hintStyle: FontStyleAndText.textfrom,
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                          BorderSide(color: ColorManger.primary_ColorYello)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.red))),
              keyboardType: TextInputType.name,
            ),
            verticalBox(20.h),
            button(
                text: 'تعديل',
                paddingH: 135.w,
                paddingV: 20.h,
                function: () {
                  context.pushNamed(Routers.add_test);
                })
          ],
        ),
      ),
    );
  }
}
