// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_programtion/core/helper/spacing.dart';
import '../../../../../core/theming/color.dart';
import '../../../../../core/theming/font_style.dart';
import '../../../../widget/button.dart';
import '../../../../widget/text_from.dart';
import '../../logic/courses_cubit/cubit/courser_cubit_cubit.dart';
import '../../logic/courses_cubit/cubit/courser_cubit_state.dart';

class LevelItemTeacher extends StatefulWidget {
  LevelItemTeacher({
    required this.image,
    required this.name,
  });
  String image;
  String name;

  @override
  State<LevelItemTeacher> createState() => _LessonState();
}

class _LessonState extends State<LevelItemTeacher> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          color: ColorManger.primary_ColorBlue,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  widget.name,
                  textDirection: TextDirection.rtl,
                  style: FontStyleAndText.fontmedia,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image(
                      height: 100.h,
                      width: 100.w,
                      fit: BoxFit.cover,
                      image: AssetImage(widget.image)),
                )
              ],
            ),
          ),
        ),
        Positioned(
            top: 5,
            left: 7,
            child: Row(
              children: [
                Icon(Icons.delete, size: 25, color: ColorManger.font),
                horizontalBox(13.w),
                InkWell(
                  child: Icon(Icons.edit, size: 25, color: ColorManger.font),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (dialogContext) {
                        return BlocBuilder<CourserCubitTeacher,
                            CourserCubitTeacherState>(
                          builder: (context, state) {
                            final cubit = context.read<CourserCubitTeacher>();

                            // التحقق من وجود selectedlevel
                            // if (cubit.s == null) {
                            //   return AlertDialog(
                            //     content: Text('لم يتم تحديد مستوى'),
                            //   );
                            // }
                            return AlertDialog(
                              content: Container(
                                padding: EdgeInsets.symmetric(vertical: 20.h),
                                height: 270.h,
                                width: 400.w,
                                child: Column(
                                  children: [
                                    FromFields(
                                      vaildet: (value) {
                                        if (value?.isEmpty ?? true) {
                                          return 'الرجاء ادخال الاسم';
                                        }
                                        return null;
                                      },
                                      hint: 'ادخل الاسم',
                                      controller: cubit.controller3,
                                      // init_value: cubit.selectedlevel!.name,
                                      icon: const Icon(
                                          Icons.question_answer_rounded),
                                      keyboardType: TextInputType.name,
                                      context: dialogContext,
                                    ),
                                    verticalBox(10.h),
                                    FromFields(
                                      vaildet: (value) {
                                        if (value?.isEmpty ?? true) {
                                          return 'الرجاء ادخال عدد الدروس';
                                        }
                                        return null;
                                      },
                                      hint: 'ادخل عدد الدروس',
                                      controller: cubit.controller4,
                                      icon: const Icon(
                                          Icons.question_answer_rounded),
                                      keyboardType: TextInputType.name,
                                      // init_value: cubit.selectedlevel!.num_of_lesson
                                      //     .toString(),
                                      context: dialogContext,
                                    ),
                                    verticalBox(10.h),
                                    button(
                                      text: 'تعديل',
                                      paddingH: 90.w,
                                      paddingV: 16.h,
                                      function: () {},
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                )
              ],
            )),
      ],
    );
  }
}
