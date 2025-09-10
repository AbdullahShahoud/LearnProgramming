import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_programtion/core/helper/spacing.dart';
import '../../../core/DI/dependency_injection.dart';
import '../../courses/logic/cubit/cubit/coursees_cubit.dart';
import '../widget/courses/check_courses_blocListener.dart';
import '../widget/courses/courses_bloc_listener.dart';
import '../widget/courses_me_bloc_listener.dart';
import '../widget/tapbar_home.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    CourseesCubit.get(context).emitCoursesList();
    CourseesCubit.get(context).emitCoursesMe();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TabBarhome(),
              CoursesMeBlocListener(),
              verticalBox(7.h),
              CheekCoursesBlocListener(),
              verticalBox(7.h),
              CoursesBlocListenerCubit(),
            ],
          ),
        ),
      ),
    );
  }
}
