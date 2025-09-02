import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_programtion/core/helper/extention.dart';
import 'package:learn_programtion/features/home/widget/courses/courses_item.dart';
import 'package:learn_programtion/features/teacher/courses/logic/courses_cubit/cubit/courser_cubit_cubit.dart';

import '../../../../../core/routing/router.dart';
import '../../logic/model/courses_response.dart';
import 'courses_bloc_listener.dart';

class CategoryCoursesTeacher extends StatefulWidget {
  final List<CoursesResponseTc> courses;
  CategoryCoursesTeacher(this.courses);

  @override
  State<CategoryCoursesTeacher> createState() => _CategoryState();
}

class _CategoryState extends State<CategoryCoursesTeacher> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      height: 700.h,
      child: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(bottom: 5.h),
          child: InkWell(
            onTap: () {
              CourserCubitTeacher.get(context).selectedcorse =
                  getSampleCourses[index];
              context.pushNamed(Routers.level_teacher);
            },
            child: CoursesItem(
                name: widget.courses[index].name,
                teacherName: widget.courses[index].nameTeacher,
                descripe: widget.courses[index].descrip,
                time: widget.courses[index].time,
                type: widget.courses[index].type,
                image: widget.courses[index].image,
                id: widget.courses[index].id,
                numberLevel: widget.courses[index].num_of_level),
          ),
        ),
        itemCount: widget.courses.length,
        scrollDirection: Axis.vertical,
      ),
    ));
  }
}
