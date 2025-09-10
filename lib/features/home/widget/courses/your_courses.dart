import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_programtion/core/theming/color.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/theming/font_style.dart';

Widget YourCourses({
  required String? image,
  required BuildContext context,
  required String? name,
  required String? nameteatcher,
  required String? type,
  required int? time,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Card(
        color: Colors.white,
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image(
                  height: 100.h,
                  width: 100.w,
                  fit: BoxFit.cover,
                  image: AssetImage('assets/image/images.png'
                      // image!
                      )),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.w, left: 10.w, top: 7.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  name!,
                  textDirection: TextDirection.rtl,
                  style: FontStyleAndText.fontmedia,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                verticalBox(8.h),
                Text(nameteatcher!,
                    textDirection: TextDirection.rtl,
                    style: FontStyleAndText.fontsmall),
                verticalBox(8.h),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${time!}',
                          textDirection: TextDirection.rtl,
                          style: FontStyleAndText.fontsmall
                              .copyWith(color: ColorManger.primary_ColorBlue)),
                      horizontalBox(20.w),
                      Text(type!,
                          textDirection: TextDirection.rtl,
                          style: FontStyleAndText.fontsmall
                              .copyWith(color: ColorManger.primary_ColorBlue))
                    ]),
                verticalBox(8.h),
              ],
            ),
          )
        ]),
      ),
    );
