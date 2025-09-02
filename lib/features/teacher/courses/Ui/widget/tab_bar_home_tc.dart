// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import '../../../../../core/theming/color.dart';

class TabBarhomeTeacher extends StatefulWidget {
  const TabBarhomeTeacher({super.key});

  @override
  State<TabBarhomeTeacher> createState() => _TabBarhomeTeacherState();
}

class _TabBarhomeTeacherState extends State<TabBarhomeTeacher> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ClipPath(
          clipper: OvalBottomBorderClipper(),
          child: Container(
            height: 215.h,
            width: double.infinity.w,
            decoration: BoxDecoration(
              color: ColorManger.primary_ColorBlue,
            ),
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8.h),
                      child: Image(
                        image: AssetImage('assets/image/logo.png'),
                        width: 130.w,
                        height: 170.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                )),
          )),
    ]);
  }
}
