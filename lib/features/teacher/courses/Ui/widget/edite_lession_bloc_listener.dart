import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_programtion/core/helper/extention.dart';
import 'package:learn_programtion/features/widget/alert_error.dart';
import 'package:learn_programtion/features/widget/alert_success.dart';

import '../../../../../core/routing/router.dart';
import '../../../../../core/theming/color.dart';
import '../../../courses/logic/courses_cubit/cubit/courser_cubit_cubit.dart';
import '../../../courses/logic/courses_cubit/cubit/courser_cubit_state.dart';

class EidteLessionBlocListener extends StatefulWidget {
  const EidteLessionBlocListener({super.key});

  @override
  State<EidteLessionBlocListener> createState() => _LoginBlocListenerState();
}

class _LoginBlocListenerState extends State<EidteLessionBlocListener> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<CourserCubitTeacher, CourserCubitTeacherState>(
      listenWhen: (previous, current) =>
          current is LoadingLessionEdit ||
          current is ErrorLessionEdit ||
          current is SuccessLessionEdit,
      listener: (context, state) {
        state.whenOrNull(
          successLessionEdit: (data) {
            alertSuccess(context, data, () {
              context.pushNamed(Routers.home_page_teacher);
            });
          },
          loadinLessionEdit: () => showDialog(
              context: context,
              builder: (context) => Center(
                    child: CircularProgressIndicator(
                      color: ColorManger.primary_ColorBlue,
                    ),
                  )),
          errorLessionEdit: (error) {
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
