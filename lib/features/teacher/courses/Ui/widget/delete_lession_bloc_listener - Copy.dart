import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_programtion/core/helper/extention.dart';
import 'package:learn_programtion/features/widget/alert_error.dart';
import 'package:learn_programtion/features/widget/alert_success.dart';

import '../../../../../core/routing/router.dart';
import '../../../../../core/theming/color.dart';
import '../../../courses/logic/courses_cubit/cubit/courser_cubit_cubit.dart';
import '../../../courses/logic/courses_cubit/cubit/courser_cubit_state.dart';

class DeletLessionBlocListener extends StatefulWidget {
  const DeletLessionBlocListener({super.key});

  @override
  State<DeletLessionBlocListener> createState() => _LoginBlocListenerState();
}

class _LoginBlocListenerState extends State<DeletLessionBlocListener> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<CourserCubitTeacher, CourserCubitTeacherState>(
      listenWhen: (previous, current) =>
          current is LoadingLessionDelet ||
          current is ErrorLessionDelet ||
          current is SuccessLessionDelet,
      listener: (context, state) {
        state.whenOrNull(
          successLessionDelet: (data) {
            alertSuccess(context, 'تم حذف الدرس بنجاح', () {
              context.pushNamed(Routers.home_page_teacher);
            });
          },
          loadinLessionDelet: () => showDialog(
              context: context,
              builder: (context) => Center(
                    child: CircularProgressIndicator(
                      color: ColorManger.primary_ColorBlue,
                    ),
                  )),
          errorLessionDelet: (error) {
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
