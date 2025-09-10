import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_programtion/core/helper/extention.dart';
import 'package:learn_programtion/core/helper/spacing.dart';
import 'package:learn_programtion/core/theming/font_style.dart';
import 'package:learn_programtion/features/home/widget/course_me_item.dart';

import '../../../core/routing/router.dart';
import '../../courses/logic/cubit/cubit/coursees_cubit.dart';
import '../../courses/logic/model/courses_me_response.dart';

Widget CoursesMe(List<CourseMeWrapper> courseItem) {
  int Pre(CourseMeWrapper coursesMeResponse) {
    final v = coursesMeResponse.course!.level!
        .where((element) => element.finished == true);
    return v.length;
  }

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
      Container(
        height: 160.h,
        child: ListView.builder(
          itemBuilder: (context, index) => InkWell(
            child: CourseMeItem(
                context: context,
                image: courseItem[index].course!.image,
                name: courseItem[index].course!.name,
                nameTeacher: courseItem[index].course!.nameTeacher,
                s: Pre(courseItem[index]),
                id: courseItem[index].course!.id),
            onTap: () {
              final courseMe = CourseesCubit.get(context).coursesMe[index];
              CourseesCubit.get(context).selectCourseMe(courseMe);
              context.pushNamed(Routers.levelMe);
            },
          ),
          itemCount: courseItem.length,
          scrollDirection: Axis.horizontal,
        ),
      )
    ],
  );
}
