import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theming/font_style.dart';

Widget TabBarCourse({
  required String image,
  required String name,
}) {
  return ClipPath(
      clipper: OvalBottomBorderClipper(),
      child: Stack(
        children: [
          Container(
            height: 200.h,
            width: double.infinity,
            foregroundDecoration: BoxDecoration(
                image: DecorationImage(fit: BoxFit.cover, image: AssetImage(
                    // image,
                    "assets/image/images.png"))),
          ),
          Positioned(
            bottom: 60.h,
            left: 60.w,
            right: 60.w,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                textDirection: TextDirection.rtl,
                name,
                style: FontStyleAndText.homefont.copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ));
}
