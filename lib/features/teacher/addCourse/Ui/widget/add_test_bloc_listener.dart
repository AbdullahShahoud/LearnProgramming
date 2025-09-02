import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_programtion/core/helper/extention.dart';
import 'package:learn_programtion/features/widget/alert_error.dart';
import 'package:learn_programtion/features/widget/alert_success.dart';

import '../../../../../core/routing/router.dart';
import '../../../../../core/theming/color.dart';
import '../../../courses/logic/courses_cubit/cubit/courser_cubit_cubit.dart';
import '../../../courses/logic/courses_cubit/cubit/courser_cubit_state.dart';

class AddTestBlocListener extends StatefulWidget {
  const AddTestBlocListener({super.key});

  @override
  State<AddTestBlocListener> createState() => _LoginBlocListenerState();
}

class _LoginBlocListenerState extends State<AddTestBlocListener> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<CourserCubitTeacher, CourserCubitTeacherState>(
      listenWhen: (previous, current) =>
          current is LoadingTestAdd ||
          current is ErrorTestAdd ||
          current is SuccessTestAdd,
      listener: (context, state) {
        state.whenOrNull(
          successTestAdd: (data) {
            alertSuccess(context, data, () {
              context.read<CourserCubitTeacher>().selectTest = 0;
              context.pushNamed(Routers.test);
            });
          },
          loadinTestAdd: () => showDialog(
              context: context,
              builder: (context) => Center(
                    child: CircularProgressIndicator(
                      color: ColorManger.primary_ColorBlue,
                    ),
                  )),
          errorTestAdd: (error) {
            alertError(
              context,
              error,
              () {
                context.pushNamed(Routers.test);
              },
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
