// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_programtion/core/helper/spacing.dart';
import 'package:learn_programtion/features/teacher/courses/logic/model/courses_response.dart';
import '../../../../../core/theming/color.dart';
import '../../../../../core/theming/font_style.dart';
import '../../../../widget/button.dart';
import '../../../../widget/text_from.dart';
import '../../logic/courses_cubit/cubit/courser_cubit_cubit.dart';
import '../../logic/courses_cubit/cubit/courser_cubit_state.dart';
import 'delete_level_bloc_listener.dart';
import 'edit_level_bloc_listener - Copy.dart';

class LevelItemTeacher extends StatefulWidget {
  LevelItemTeacher({
    required this.image,
    required this.name,
    required this.level,
  });
  String image;
  String name;
  Levels level;
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
                      image: AssetImage('assets/image/images.png'
                          // widget.image
                          )),
                )
              ],
            ),
          ),
        ),
        DeleteLevelBlocListener(),
        Positioned(
            top: 5,
            left: 7,
            child: Row(
              children: [
                InkWell(
                    onTap: () {
                      context.read<CourserCubitTeacher>().selectedlevel =
                          widget.level;
                      context
                          .read<CourserCubitTeacher>()
                          .emitDeleteLevelTeacher();
                    },
                    child:
                        Icon(Icons.delete, size: 25, color: ColorManger.font)),
                horizontalBox(13.w),
                InkWell(
                  child: Icon(Icons.edit, size: 25, color: ColorManger.font),
                  onTap: () {
                    context.read<CourserCubitTeacher>().selectedlevel =
                        widget.level;
                    context
                            .read<CourserCubitTeacher>()
                            .controllereditLevelName =
                        TextEditingController(
                            text: context
                                .read<CourserCubitTeacher>()
                                .selectedlevel!
                                .name);
                    context
                            .read<CourserCubitTeacher>()
                            .controllereditLevelNumber =
                        TextEditingController(
                            text: context
                                .read<CourserCubitTeacher>()
                                .selectedlevel!
                                .num_of_lesson
                                .toString());
                    showDialog(
                      context: context,
                      builder: (dialogContext) {
                        return BlocBuilder<CourserCubitTeacher,
                            CourserCubitTeacherState>(
                          builder: (context, state) {
                            final cubit = context.read<CourserCubitTeacher>();
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
                                      controller:
                                          cubit.controllereditLevelName!,
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
                                      controller:
                                          cubit.controllereditLevelNumber!,
                                      icon: const Icon(
                                          Icons.question_answer_rounded),
                                      keyboardType: TextInputType.name,
                                      context: dialogContext,
                                    ),
                                    verticalBox(10.h),
                                    EidteLevelBlocListener(),
                                    button(
                                      text: 'تعديل',
                                      paddingH: 90.w,
                                      paddingV: 16.h,
                                      function: () {
                                        cubit.emitEditLevelTeacher();
                                      },
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
