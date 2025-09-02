import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_programtion/core/helper/extention.dart';
import 'package:learn_programtion/features/widget/alert_error.dart';
import 'package:learn_programtion/features/widget/alert_success.dart';

import '../../../../../core/routing/router.dart';
import '../../../../../core/theming/color.dart';
import '../../../courses/logic/courses_cubit/cubit/courser_cubit_cubit.dart';
import '../../../courses/logic/courses_cubit/cubit/courser_cubit_state.dart';

class AddLessionBlocListener extends StatefulWidget {
  const AddLessionBlocListener({super.key});

  @override
  State<AddLessionBlocListener> createState() => _LoginBlocListenerState();
}

class _LoginBlocListenerState extends State<AddLessionBlocListener> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<CourserCubitTeacher, CourserCubitTeacherState>(
      listenWhen: (previous, current) =>
          current is LoadingLessionAdd ||
          current is ErrorLessionAdd ||
          current is SuccessLessionAdd,
      listener: (context, state) {
        state.whenOrNull(
          successLessionAdd: (data) {
            alertSuccess(context, data, () {
              context.pushNamed(Routers.add_level);
            });
          },
          loadinLessionAdd: () => showDialog(
              context: context,
              builder: (context) => Center(
                    child: CircularProgressIndicator(
                      color: ColorManger.primary_ColorBlue,
                    ),
                  )),
          errorLessionAdd: (error) {
            alertError(
              context,
              error,
              () {
                // context.pushNamed(Routers.add_lession);
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
