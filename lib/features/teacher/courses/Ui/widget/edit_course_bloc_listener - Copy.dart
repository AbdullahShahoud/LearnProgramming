import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_programtion/core/helper/extention.dart';
import 'package:learn_programtion/features/widget/alert_error.dart';
import 'package:learn_programtion/features/widget/alert_success.dart';

import '../../../../../core/routing/router.dart';
import '../../../../../core/theming/color.dart';
import '../../../courses/logic/courses_cubit/cubit/courser_cubit_cubit.dart';
import '../../../courses/logic/courses_cubit/cubit/courser_cubit_state.dart';

class EditCoursesBlocListener extends StatelessWidget {
  const EditCoursesBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CourserCubitTeacher, CourserCubitTeacherState>(
      listenWhen: (previous, current) =>
          current is LoadingCoursesEdit ||
          current is ErrorCoursesEdit ||
          current is SuccessCoursesEdit,
      listener: (context, state) {
        state.whenOrNull(
          successCoursesEdit: (data) {
            alertSuccess(context, data, () {
              context.pushNamed(Routers.home_page_teacher);
            });
          },
          loadinCoursesEdit: () => showDialog(
              context: context,
              builder: (context) => Center(
                    child: CircularProgressIndicator(
                      color: ColorManger.primary_ColorBlue,
                    ),
                  )),
          errorCoursesEdit: (error) {
            alertError(
              context,
              error,
              () {
                context.pushNamed(Routers.home_page_teacher);
              },
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
