// ignore_for_file: must_be_immutable, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/theming/color.dart';
import '../../../../../core/theming/font_style.dart';
import '../../../../widget/button.dart';
import '../../../../widget/text_from.dart';
import '../../logic/cubit/notification_teacher_cubit_cubit.dart';
import '../../logic/cubit/notification_teacher_cubit_state.dart';
import '../../logic/models/notification_quations_response.dart';

class NotificationQuationsTeacher extends StatelessWidget {
  NotificationQuationsTeacher({super.key, this.question});
  List<NotificationQuationsResponse>? question;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(bottom: 8.h, left: 6.w, right: 6.w),
          child: Card(
            color: ColorManger.primary_ColorBlue,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      question![index].course_title!,
                      textDirection: TextDirection.rtl,
                      style: FontStyleAndText.fontmedia,
                    ),
                  ),
                ),
                Text(
                  'السؤال',
                  textDirection: TextDirection.rtl,
                  style: FontStyleAndText.fontmedia,
                ),
                verticalBox(8.h),
                Text(
                  question![index].question_text!,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  style: FontStyleAndText.fontmedia,
                ),
                question![index].answered!
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10.h),
                        child: Card(
                          color: ColorManger.primary_ColorYello,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'الجواب',
                                  textDirection: TextDirection.rtl,
                                  style: FontStyleAndText.fontmedia,
                                ),
                                Text(
                                  textDirection: TextDirection.rtl,
                                  question![index].answer_text!,
                                  maxLines: 4,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        child: button(
                          text: 'الاجابة على السؤال',
                          function: () {
                            InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => BlocBuilder<
                                            NotificationTeacherCubit,
                                            NotificationTeacherState>(
                                          builder: (context, state) {
                                            return AlertDialog(
                                              content: Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 20.h),
                                                height: 220.h,
                                                width: 400.w,
                                                child: Column(
                                                  children: [
                                                    Form(
                                                      key:
                                                          NotificationTeacherCubit
                                                                  .get(context)
                                                              .keys,
                                                      child: Column(
                                                        children: [
                                                          FromFields(
                                                              vaildet: (value) {
                                                                if (value!
                                                                        .isEmpty ||
                                                                    value ==
                                                                        null) {
                                                                  return 'الرجاء ادخال الجواب';
                                                                }
                                                              },
                                                              hint:
                                                                  'ادخل الجواب',
                                                              controller: NotificationTeacherCubit
                                                                      .get(
                                                                          context)
                                                                  .controllerTC!,
                                                              icon: Icon(Icons
                                                                  .question_answer_rounded),
                                                              keyboardType:
                                                                  TextInputType
                                                                      .name,
                                                              context: context),
                                                          verticalBox(10.h),
                                                          button(
                                                              text: 'ارسال',
                                                              paddingH: 90.w,
                                                              paddingV: 16.h,
                                                              function: () {
                                                                NotificationTeacherCubit
                                                                        .get(
                                                                            context)
                                                                    .emitSendQuationsTC();
                                                              }),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ));
                              },
                              child: Text(
                                'إضافة جواب',
                                style: FontStyleAndText.fontmedia.copyWith(
                                    color: ColorManger.primary_ColorBlue),
                              ),
                            );
                          },
                        ),
                      )
              ],
            ),
          ),
        ),
        itemCount: question!.length,
      ),
    );
  }
}
