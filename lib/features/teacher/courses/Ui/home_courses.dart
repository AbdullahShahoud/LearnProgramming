import 'package:flutter/material.dart';
import 'package:learn_programtion/core/helper/extention.dart';
import 'package:learn_programtion/core/theming/color.dart';
import 'package:learn_programtion/features/teacher/courses/Ui/widget/courses_bloc_listener.dart';
import '../../../../core/routing/router.dart';
import '../logic/courses_cubit/cubit/courser_cubit_cubit.dart';
import 'widget/tab_bar_home_tc.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  @override
  void initState() {
    // TODO: implement initState
    CourserCubitTeacher.get(context).emitCoursesTeacher();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(Routers.add_courses);
        },
        backgroundColor: ColorManger.primary_ColorBlue,
        child: Icon(Icons.add),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [TabBarhomeTeacher(), CoursesBlocListenerCubit()],
        ),
      )),
    );
  }
}
