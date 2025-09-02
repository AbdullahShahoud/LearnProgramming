// ignore_for_file: empty_constructor_bodies, must_be_immutable

import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_programtion/core/helper/extention.dart';
import 'package:learn_programtion/core/helper/spacing.dart';
import 'package:learn_programtion/core/routing/router.dart';
import '../../../../core/theming/color.dart';
import '../../../../core/theming/font_style.dart';

class CoursesItem extends StatelessWidget {
  CoursesItem(
      {this.image,
      this.descripe,
      this.name,
      this.id,
      this.numberLevel,
      this.teacherName,
      this.time,
      this.type});
  String? image;
  String? name;
  int? numberLevel;
  String? teacherName;
  String? descripe;
  int? time;
  String? type;
  int? id;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        children: [
          Stack(children: [
            ClipRRect(
              child: Image.asset(
                image!,
                height: 160.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
            Container(
              height: 160.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: [
                      Color.fromARGB(94, 44, 44, 44),
                      Color.fromARGB(167, 56, 56, 56),
                    ],
                    stops: [
                      0.5,
                      0.3,
                    ]),
              ),
            ),
            Positioned(
                bottom: 6.h,
                right: 4.w,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(name!,
                          textDirection: TextDirection.rtl,
                          style: FontStyleAndText.fontbold
                              .copyWith(color: Colors.white)),
                      verticalBox(5.h),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          teacherName!,
                          textDirection: TextDirection.rtl,
                          style: FontStyleAndText.fontbold
                              .copyWith(color: Colors.white),
                        ),
                      ),
                      verticalBox(8.h),
                    ]))
          ]),
          verticalBox(6.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              textDirection: TextDirection.rtl,
              descripe!,
              style: FontStyleAndText.fontmedia,
              textAlign: TextAlign.right,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          verticalBox(8.h),
          Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: Align(
              alignment: Alignment.topRight,
              child: Text(
                type!,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
                style: FontStyleAndText.fontsmall,
              ),
            ),
          ),
          verticalBox(6.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
            child: Row(
              children: [
                Text(
                  '${numberLevel!} ' + ' ' + 'مستويات',
                  textDirection: TextDirection.rtl,
                  style: FontStyleAndText.fontsmall,
                ),
                Spacer(),
                Row(children: [
                  Icon(Icons.delete, size: 25, color: ColorManger.font),
                  horizontalBox(13.w),
                  InkWell(
                    child: Icon(Icons.edit, size: 25, color: ColorManger.font),
                    onTap: () {
                      context.pushNamed(Routers.edit_courses);
                    },
                  ),
                  horizontalBox(13.w),
                ])
                // Text(
                //   ' ${time!}',
                //   textDirection: TextDirection.rtl,
                //   style: FontStyleAndText.fontsmall,
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
