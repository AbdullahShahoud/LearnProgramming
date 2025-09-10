import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_programtion/core/helper/extention.dart';
import 'package:learn_programtion/features/widget/alert_error.dart';

import '../../../../../core/routing/router.dart';
import '../../../../../core/theming/color.dart';
import '../../../courses/logic/courses_cubit/cubit/courser_cubit_cubit.dart';
import '../../../courses/logic/courses_cubit/cubit/courser_cubit_state.dart';

class AddLevelBlocListener extends StatefulWidget {
  const AddLevelBlocListener({super.key});

  @override
  State<AddLevelBlocListener> createState() => _LoginBlocListenerState();
}

class _LoginBlocListenerState extends State<AddLevelBlocListener> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<CourserCubitTeacher, CourserCubitTeacherState>(
      listenWhen: (previous, current) =>
          current is LoadingLevelAdd ||
          current is ErrorLevelAdd ||
          current is SuccessLevelAdd,
      listener: (context, state) {
        state.whenOrNull(
          successLevelAdd: (data) {
            context.pop();
            context.pushNamed(Routers.add_level);
          },
          loadinLevelAdd: () => showDialog(
              context: context,
              builder: (context) => Center(
                    child: CircularProgressIndicator(
                      color: ColorManger.primary_ColorBlue,
                    ),
                  )),
          errorLevelAdd: (error) {
            alertError(
              context,
              error,
              () {
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
