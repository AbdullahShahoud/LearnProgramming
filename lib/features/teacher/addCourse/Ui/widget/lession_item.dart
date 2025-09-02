import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_programtion/core/theming/color.dart';

import '../../../../../core/theming/font_style.dart';

Widget LessionItem(String text) {
  return Container(
    width: 370.w,
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(30)),
    padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 14.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          textAlign: TextAlign.left,
          text,
          style: FontStyleAndText.fontsmall,
        ),
        Icon(
          Icons.arrow_forward_rounded,
          color: ColorManger.font,
          size: 24,
        )
      ],
    ),
  );
}
