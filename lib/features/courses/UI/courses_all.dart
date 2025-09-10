import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_programtion/core/helper/extention.dart';

import '../../../core/routing/router.dart';
import '../../../core/theming/color.dart';
import '../../home/widget/courses/courses_item.dart';
import '../logic/cubit/cubit/coursees_cubit.dart';

List<String> category = ['برمجة', 'تطوير واجهات', 'تصميم', 'php', 'larvel'];

class CoursesAll extends StatefulWidget {
  const CoursesAll({super.key});

  @override
  State<CoursesAll> createState() => _CoursesAllState();
}

class _CoursesAllState extends State<CoursesAll> {
  @override
  Widget build(BuildContext context) {
    final courses = CourseesCubit.get(context).courses;

    // تحقق إذا كانت القائمة فارغة
    if (courses.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'الكورسات',
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: Text(
            'لا توجد كورسات متاحة حاليًا.',
            style: TextStyle(fontSize: 18.sp),
          ),
        ),
      );
    }

    return DefaultTabController(
      length: courses.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'الكورسات',
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.white,
          bottom: TabBar(
            indicatorColor: ColorManger.primary_ColorBlue,
            labelStyle: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w300),
            labelColor: ColorManger.primary_ColorYello,
            tabs: List.generate(
              courses.length,
              (index) => Tab(text: category[index]),
            ),
          ),
        ),
        body: TabBarView(
          children: List.generate(
            courses.length,
            (index) {
              final course = courses[index];
              return ListView.builder(
                itemCount: course.levels.length,
                itemBuilder: (context, levelIndex) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 5.h),
                    child: InkWell(
                      onTap: () {
                        CourseesCubit.get(context).selectedcorse = course;
                        context.pushNamed(Routers.introdactionCourse);
                      },
                      child: CoursesItem(
                        name: course.name,
                        teacherName: course.nameTeacher,
                        descripe: course.descrip,
                        time: course.time,
                        type: course.type,
                        image: course.image,
                        id: course.id,
                        numberLevel: course.levels.length,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
