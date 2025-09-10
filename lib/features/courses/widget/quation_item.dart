// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_programtion/features/courses/logic/cubit/cubit/coursees_cubit.dart';

import '../../../core/helper/spacing.dart';
import '../../../core/theming/color.dart';
import '../../../core/theming/font_style.dart';
import '../logic/cubit/cubit/coursees_state.dart';
import '../logic/model/courses_me_response.dart';

class QuationItem extends StatefulWidget {
  TestMe test;
  QuationItem(this.test);

  @override
  State<QuationItem> createState() => _QuationItemState();
}

class _QuationItemState extends State<QuationItem> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseesCubit, CoursesState>(
      builder: (context, state) {
        final grob2 = CourseesCubit.get(context).responseUser2;
        return Container(
            height: 750.h,
            child: ListView.builder(
                itemCount: widget.test.questions!.length,
                itemBuilder: (context, index) {
                  final question = widget.test.questions![index];
                  return Container(
                      margin:
                          EdgeInsets.only(bottom: 10.h, left: 8.w, right: 8.w),
                      height: 300.h,
                      decoration: BoxDecoration(
                        color: ColorManger.primary_ColorBlue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.all(10.w),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '10/100',
                                style: FontStyleAndText.fontmedia,
                                textDirection: TextDirection.rtl,
                              ),
                              Container(
                                height: 60.h,
                                width:
                                    MediaQuery.of(context).size.width - 120.w,
                                child: Text(question.question!,
                                    textDirection: TextDirection.rtl,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    style: FontStyleAndText.fontmedia),
                              ),
                            ],
                          ),
                          Container(
                              alignment: Alignment.centerLeft,
                              width: MediaQuery.of(context).size.width - 20.w,
                              height: 65.h,
                              decoration: BoxDecoration(
                                color: ColorManger.primary_ColorYello,
                                borderRadius: BorderRadius.circular(15),
                                border:
                                    Border.all(color: Colors.black, width: 1),
                              ),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      textDirection: TextDirection.rtl,
                                      question.a!,
                                      textAlign: TextAlign.right,
                                      maxLines: 2,
                                      style: FontStyleAndText.fontmedia,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 7.h),
                                      child: Radio(
                                          focusColor: Colors.white,
                                          splashRadius: 15,
                                          value: 'a',
                                          groupValue: grob2[index],
                                          onChanged: (value) {
                                            setState(() {
                                              grob2[index] = value;
                                            });
                                          }),
                                    )
                                  ])),
                          verticalBox(10.h),
                          Container(
                              alignment: Alignment.centerLeft,
                              width: MediaQuery.of(context).size.width - 20.w,
                              height: 65.h,
                              decoration: BoxDecoration(
                                color: ColorManger.primary_ColorYello,
                                borderRadius: BorderRadius.circular(15),
                                border:
                                    Border.all(color: Colors.black, width: 1),
                              ),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      textDirection: TextDirection.rtl,
                                      question.b!,
                                      textAlign: TextAlign.right,
                                      style: FontStyleAndText.fontmedia,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 7.h),
                                      child: Radio(
                                          focusColor: Colors.white,
                                          splashRadius: 15,
                                          value: 'b',
                                          groupValue: grob2[index],
                                          onChanged: (value) {
                                            setState(() {
                                              grob2[index] = value;
                                            });
                                          }),
                                    )
                                  ])),
                          verticalBox(10.h),
                          Container(
                              alignment: Alignment.centerLeft,
                              width: MediaQuery.of(context).size.width - 20.w,
                              height: 65.h,
                              decoration: BoxDecoration(
                                color: ColorManger.primary_ColorYello,
                                borderRadius: BorderRadius.circular(15),
                                border:
                                    Border.all(color: Colors.black, width: 1),
                              ),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      textDirection: TextDirection.rtl,
                                      question.c!,
                                      textAlign: TextAlign.right,
                                      style: FontStyleAndText.fontmedia,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 7.h),
                                      child: Radio(
                                          focusColor: Colors.white,
                                          splashRadius: 15,
                                          value: 'c',
                                          groupValue: grob2[index],
                                          onChanged: (value) {
                                            setState(() {
                                              grob2[index] = value;
                                            });
                                          }),
                                    )
                                  ])),
                        ],
                      ));
                }));
      },
    );
  }
}
