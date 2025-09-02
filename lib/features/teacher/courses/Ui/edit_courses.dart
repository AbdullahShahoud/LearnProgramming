// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../courses/logic/courses_cubit/cubit/courser_cubit_cubit.dart';
import '../../courses/logic/courses_cubit/cubit/courser_cubit_state.dart';
import 'widget/editFromCourse.dart';

class EditCoursesTeacher extends StatefulWidget {
  EditCoursesTeacher({super.key});

  @override
  State<EditCoursesTeacher> createState() => _AddCoursesTeacherState();
}

class _AddCoursesTeacherState extends State<EditCoursesTeacher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(
            'تعديل كورس',
          ),
        ),
      ),
      body: BlocConsumer<CourserCubitTeacher, CourserCubitTeacherState>(
        listener: (context, state) {},
        builder: (context, state) => SingleChildScrollView(
          child: SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EditeFormCourses(),
            ],
          )),
        ),
      ),
    );
  }
}
