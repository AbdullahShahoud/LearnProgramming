import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_programtion/core/helper/extention.dart';
import 'package:learn_programtion/features/widget/alert_error.dart';
import 'package:learn_programtion/features/widget/alert_success.dart';

import '../../../../../core/routing/router.dart';
import '../../../../../core/theming/color.dart';
import '../../../courses/logic/courses_cubit/cubit/courser_cubit_cubit.dart';
import '../../../courses/logic/courses_cubit/cubit/courser_cubit_state.dart';

class AddCoursesBlocListener extends StatefulWidget {
  const AddCoursesBlocListener({super.key});

  @override
  State<AddCoursesBlocListener> createState() => _LoginBlocListenerState();
}

class _LoginBlocListenerState extends State<AddCoursesBlocListener> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<CourserCubitTeacher, CourserCubitTeacherState>(
      listenWhen: (previous, current) =>
          current is LoadingCoursesAdd ||
          current is ErrorCoursesAdd ||
          current is SuccessCoursesAdd,
      listener: (context, state) {
        state.whenOrNull(
          successCoursesAdd: (data) {
            alertSuccess(context, data, () {
              context.pushNamed(Routers.add_level);
            });
          },
          loadinCoursesAdd: () => showDialog(
              context: context,
              builder: (context) => Center(
                    child: CircularProgressIndicator(
                      color: ColorManger.primary_ColorBlue,
                    ),
                  )),
          errorCoursesAdd: (error) {
            alertError(
              context,
              error,
              () {
                // context.pushNamed(Routers.add_courses);
                context.pushNamed(Routers.add_level);
              },
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
