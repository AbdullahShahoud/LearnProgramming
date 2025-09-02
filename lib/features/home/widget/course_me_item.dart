import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_programtion/core/helper/spacing.dart';
import 'package:learn_programtion/core/theming/color.dart';
import 'package:learn_programtion/core/theming/font_style.dart';

Widget CourseMeItem(
        {required String? image,
        required BuildContext context,
        required String? name,
        required String? nameTeacher,
        required int s,
        required int? id}) =>
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 0),
      child: Stack(children: [
        Container(
          width: 240.w,
          height: 230.h,
          foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            // image: DecorationImage(
            //   image: AssetImage(image!),
            //   fit: BoxFit.cover,
            // )
          ),
        ),
        Container(
          width: 240.w,
          height: 230.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.center,
              colors: [
                Color.fromRGBO(0, 0, 0, 0),
                Color.fromRGBO(0, 0, 0, 0.7),
              ],
              stops: [0.0, 0.737],
            ),
          ),
        ),
        Positioned(
          right: 12.w,
          top: 6.h,
          bottom: 0.h,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 200.w,
                  child: Text(name!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textDirection: TextDirection.rtl,
                      softWrap: true,
                      textAlign: TextAlign.right,
                      style: FontStyleAndText.fontmedia
                          .copyWith(color: Colors.white)),
                ),
                verticalBox(8.h),
                // Card(
                //   color: Colors.white,
                //   child: Padding(
                //     padding:
                //         EdgeInsets.symmetric(vertical: 3.h, horizontal: 2.w),
                //     child: Text(nameTeacher!,
                //         textDirection: TextDirection.rtl,
                //         style: FontStyleAndText.smallestTouch
                //             .copyWith(color: ColorManger.font, fontSize: 12)),
                //   ),
                // ),
                Row(
                  children: [
                    Text(
                      '${s}' + '%',
                      textDirection: TextDirection.rtl,
                      style: FontStyleAndText.fontsmall
                          .copyWith(color: Colors.white),
                    ),
                    horizontalBox(8.w),
                    Container(
                      width: 80.w,
                      height: 9.h,
                      child: LinearProgressIndicator(
                        value: (s / 10),
                        backgroundColor: Colors.grey,
                        valueColor: AlwaysStoppedAnimation<Color>(
                            ColorManger.primary_ColorBlue),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ],
                ),
              ]),
        )
      ]),
    );
