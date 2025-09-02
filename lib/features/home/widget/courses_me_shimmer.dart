import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_programtion/core/theming/color.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/helper/spacing.dart';
import '../../../core/theming/font_style.dart';

class CoursesMeShimmer extends StatelessWidget {
  const CoursesMeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 15.w),
          child: Text(
            'كورساتي',
            style: FontStyleAndText.fontbold,
          ),
        ),
        verticalBox(10.h),
        SizedBox(
          height: 150.h,
          child: ListView.builder(
            itemBuilder: (context, index) => Shimmer.fromColors(
                baseColor: ColorManger.lightGray,
                highlightColor: Colors.white,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
                  child: Stack(children: [
                    Container(
                      width: 200.w,
                      height: 200.h,
                    ),
                    Container(
                      width: 200.w,
                      height: 200.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.center,
                          colors: [
                            Color.fromRGBO(0, 0, 0, 0),
                            Color.fromRGBO(0, 0, 0, 0.7),
                          ],
                          stops: [0.0, 0.8437],
                        ),
                      ),
                    ),
                  ]),
                )),
            itemCount: 5,
            scrollDirection: Axis.horizontal,
          ),
        )
      ],
    );
  }
}
