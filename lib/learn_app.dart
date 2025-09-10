// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_programtion/core/DI/dependency_injection.dart';
import 'package:learn_programtion/features/courses/logic/cubit/cubit/coursees_cubit.dart';
import 'package:learn_programtion/main.dart';
import 'core/routing/app_router.dart';
import 'core/routing/router.dart';
import 'features/teacher/courses/logic/courses_cubit/cubit/courser_cubit_cubit.dart';

class LearnApp extends StatelessWidget {
  LearnApp();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(500, 1000),
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CourseesCubit(
              getIt(),
              getIt(),
              getIt(),
              getIt(),
              getIt(),
              getIt(),
              getIt(),
              getIt(),
            ),
          ),
          BlocProvider(
            create: (context) => CourserCubitTeacher(
              getIt(),
              getIt(),
              getIt(),
              getIt(),
              getIt(),
              getIt(),
              getIt(),
              getIt(),
              getIt(),
              getIt(),
              getIt(),
              getIt(),
              getIt(),
            ),
          )
        ],
        child: MaterialApp(
          title: 'LearnProgram',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: 'Alexandria'),
          initialRoute: LoginUser
              ? Student
                  ? Routers.home_page
                  : Routers.home_page_teacher
              : Routers.Welcome,
          onGenerateRoute: AppRouters.generateRoute,
        ),
      ),
    );
  }
}
