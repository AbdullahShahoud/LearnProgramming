import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_programtion/core/helper/extention.dart';
import 'package:learn_programtion/core/theming/color.dart';
import 'package:learn_programtion/core/theming/font_style.dart';
import 'package:learn_programtion/features/profile/logic/profile_cubit/cubit/profile_and_notification_cubit.dart';
import 'package:learn_programtion/features/profile/logic/profile_cubit/cubit/profile_and_notification_state.dart';

class DeletBlocListener extends StatelessWidget {
  const DeletBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileAndNotificationCubit,
            ProfileAndNotificationState>(
        child: SizedBox.shrink(),
        listenWhen: (previous, current) =>
            current is SuccessDelete ||
            current is LoadingDelete ||
            current is ErrorDelete,
        listener: (context, state) {
          state.whenOrNull(
            loadingDelete: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: ColorManger.primary_ColorBlue,
                      ),
                    );
                  });
            },
            successDelete: (message) {
              sucessDelet(context, message);
            },
            errorDelete: (error) {
              errorDelet(context, error);
            },
          );
        });
  }
}

void sucessDelet(BuildContext context, String message) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            icon: Icon(
              Icons.check,
              color: Colors.green,
              size: 50,
            ),
            content: Text(
              message,
              style: FontStyleAndText.font_big,
            ),
            actions: [
              Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManger.primary_ColorBlue),
                    onPressed: () {
                      context.pop();
                    },
                    child: Text('موافق')),
              )
            ],
          ));
}

void errorDelet(BuildContext context, String error) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            icon: Icon(
              Icons.error,
              size: 50,
              color: Colors.red,
            ),
            content: Text(
              error,
              style: FontStyleAndText.fontbold,
            ),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManger.primary_ColorBlue),
                  onPressed: () {
                    context.pop();
                  },
                  child: Text('موافق'))
            ],
          ));
}
