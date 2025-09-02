// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/DI/dependency_injection.dart';
import '../../../../../core/helper/spacing.dart';
import '../../../../../core/theming/color.dart';
import '../../../../../core/theming/font_style.dart';
import '../../../addCourse/Ui/widget/from_test.dart';
import '../../logic/courses_cubit/cubit/courser_cubit_cubit.dart';
import '../../logic/model/courses_response.dart';

class QuationItemTeacher extends StatefulWidget {
  Tests test;
  QuationItemTeacher(this.test);

  @override
  State<QuationItemTeacher> createState() => _QuationItemState();
}

class _QuationItemState extends State<QuationItemTeacher> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 650.h,
        child: ListView.builder(
            itemCount: widget.test.questions!.length,
            itemBuilder: (context, index) {
              final question = widget.test.questions![index];
              return Stack(
                children: [
                  Container(
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
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 7.h),
                                        child: Icon(Icons.circle))
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
                                      child: Icon(Icons.circle),
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
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 7.h),
                                        child: Icon(Icons.circle))
                                  ])),
                        ],
                      )),
                  Positioned(
                      top: 5,
                      left: 7,
                      child: Row(
                        children: [
                          Icon(Icons.delete, size: 25, color: ColorManger.font),
                          horizontalBox(13.w),
                          InkWell(
                            child: Icon(Icons.edit,
                                size: 25, color: ColorManger.font),
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  backgroundColor:
                                      ColorManger.primary_ColorBlue,
                                  builder: ((context) {
                                    return BlocProvider(
                                        create: (context) =>
                                            CourserCubitTeacher(
                                              getIt(),
                                              getIt(),
                                              getIt(),
                                              getIt(),
                                              getIt(),
                                              getIt(),
                                              getIt(),
                                              getIt(),
                                              getIt(),
                                              getIt(),
                                            ),
                                        child: FromTest(context));
                                  }));
                            },
                          )
                        ],
                      )),
                ],
              );
            }));
  }
}
