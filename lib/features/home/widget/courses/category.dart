import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learn_programtion/core/helper/extention.dart';
import 'package:learn_programtion/core/helper/spacing.dart';
import 'package:learn_programtion/features/courses/logic/cubit/cubit/coursees_cubit.dart';
import 'package:learn_programtion/features/home/widget/courses/courses_item.dart';
import '../../../../core/routing/router.dart';
import '../../../../core/theming/font_style.dart';
import '../../../courses/logic/model/courses_response.dart';

List<String> category = ['برمجة', 'تطوير واجهات', 'تصميم', 'php', 'larvel'];

class CategoryCourses extends StatefulWidget {
  final List<CoursesResponse> courses;
  CategoryCourses(this.courses);

  @override
  State<CategoryCourses> createState() => _CategoryState();
}

class _CategoryState extends State<CategoryCourses> {
  String selectedCategory = "برمجة";
  @override
  Widget build(BuildContext context) {
    List<CoursesResponse> filteredCourses = widget.courses
        .where((course) => course.type == selectedCategory)
        .toList();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Text(
                    'عرض الكل',
                    style: FontStyleAndText.smallestTouch,
                  ),
                  onTap: () {
                    context.pushNamed(Routers.courses_all);
                  },
                ),
                Text(
                  'تصنيفات',
                  style: FontStyleAndText.fontbold,
                ),
              ],
            ),
          ),
          verticalBox(5.h),
          Container(
            height: 140.h,
            child: ListView.builder(
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  setState(() {
                    selectedCategory = category[index];
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40.w,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 10.w),
                          child: SvgPicture.asset('assets/svg/flutter.svg',
                              width: 80.w, height: 80.h),
                        ),
                      ),
                      verticalBox(2.h),
                      Text(
                        category[index],
                        textDirection: TextDirection.rtl,
                        style: FontStyleAndText.fontsmall,
                      )
                    ],
                  ),
                ),
              ),
              itemCount: category.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          Container(
            height: 700.h,
            child: ListView.builder(
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(bottom: 5.h),
                child: InkWell(
                  onTap: () {
                    final course = CourseesCubit.get(context).courses[index];
                    CourseesCubit.get(context).selectedcorse = course;
                    context.pushNamed(Routers.course_level);
                  },
                  child: CoursesItem(
                      name: filteredCourses[index].name,
                      teacherName: filteredCourses[index].nameTeacher,
                      descripe: filteredCourses[index].descrip,
                      time: filteredCourses[index].time,
                      type: filteredCourses[index].type,
                      image: filteredCourses[index].image,
                      id: filteredCourses[index].id,
                      numberLevel: filteredCourses[index].levels.length),
                ),
              ),
              itemCount: filteredCourses.length,
              scrollDirection: Axis.vertical,
            ),
          )
        ],
      ),
    );
  }
}
