import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_programtion/core/helper/extention.dart';
import 'package:learn_programtion/features/widget/alert_error.dart';
import 'package:learn_programtion/features/widget/alert_success.dart';

import '../../../../../core/routing/router.dart';
import '../../../../../core/theming/color.dart';
import '../../../courses/logic/courses_cubit/cubit/courser_cubit_cubit.dart';
import '../../../courses/logic/courses_cubit/cubit/courser_cubit_state.dart';

class DeleteLevelBlocListener extends StatelessWidget {
  const DeleteLevelBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CourserCubitTeacher, CourserCubitTeacherState>(
      listenWhen: (previous, current) =>
          current is LoadingLevelDelet ||
          current is ErrorLevelDelet ||
          current is SuccessLevelDelet,
      listener: (context, state) {
        state.whenOrNull(
          successLevelDelet: (data) {
            alertSuccess(context, data, () {
              context.pushNamed(Routers.home_page_teacher);
            });
          },
          loadinLevelDelet: () => showDialog(
              context: context,
              builder: (context) => Center(
                    child: CircularProgressIndicator(
                      color: ColorManger.primary_ColorBlue,
                    ),
                  )),
          errorLevelDelet: (error) {
            alertError(
              context,
              error,
              () {
                context.pushNamed(Routers.level_teacher);
              },
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
