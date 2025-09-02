// ignore_for_file: unnecessary_null_comparison, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_programtion/core/helper/extention.dart';
import 'package:learn_programtion/core/routing/router.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/theming/color.dart';
import '../../../../../core/theming/font_style.dart';

class LessonItemTeacher extends StatefulWidget {
  LessonItemTeacher(
      {required this.image, required this.name, required this.lessonId});
  String image;
  String name;
  String lessonId;
  @override
  State<LessonItemTeacher> createState() => _LessonState();
}

class _LessonState extends State<LessonItemTeacher> {
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
                    context.pushNamed(Routers.edit_lession);
                  },
                )
              ],
            )),
      ],
    );
  }
}
