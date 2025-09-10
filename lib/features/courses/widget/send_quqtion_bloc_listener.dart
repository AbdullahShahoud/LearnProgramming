import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_programtion/core/helper/extention.dart';
import 'package:learn_programtion/core/routing/router.dart';
import 'package:learn_programtion/features/courses/logic/cubit/cubit/coursees_cubit.dart';
import 'package:learn_programtion/features/courses/logic/cubit/cubit/coursees_state.dart';

import '../../../core/theming/color.dart';
import '../../../core/theming/font_style.dart';

class SendQuationsBlocListener extends StatelessWidget {
  const SendQuationsBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CourseesCubit, CoursesState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {
            SizedBox.shrink();
          },
          sendQuationError: (error) {
            errorSend(error, context);
          },
          sendQuationSuccess: (data) {
            successSend(context, data);
          },
        );
      },
      child: SizedBox.shrink(),
      listenWhen: (previous, current) =>
          current is SendQuationLoading ||
          current is SendQuationError ||
          current is SendQuationSuccess,
    );
  }
}

void errorSend(String error, BuildContext context) {
  showDialog(
    builder: (context) => AlertDialog(
      icon: Icon(
        Icons.error,
        color: Colors.red,
        size: 50,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
      content: Text(
        error,
        textDirection: TextDirection.rtl,
        style: FontStyleAndText.font_big,
      ),
      actions: [
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: ColorManger.primary_ColorBlue),
            onPressed: () {
              context.pop();
              context.pop();
            },
            child: Text('حسناً', style: FontStyleAndText.buttonfonttext),
          ),
        )
      ],
    ),
    context: context,
  );
}

void successSend(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: Icon(
        Icons.check,
        color: Colors.green,
        size: 50,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
      content: Text(
        message,
        textDirection: TextDirection.rtl,
        style: FontStyleAndText.font_big,
      ),
      actions: [
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: ColorManger.primary_ColorBlue),
            onPressed: () {
              context.pushNamed(Routers.levelMe);
            },
            child: Text('حسناً', style: FontStyleAndText.buttonfonttext),
          ),
        )
      ],
    ),
  );
}
