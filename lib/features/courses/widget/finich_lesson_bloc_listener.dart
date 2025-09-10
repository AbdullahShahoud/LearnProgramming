import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_programtion/core/helper/extention.dart';
import 'package:learn_programtion/core/routing/router.dart';
import 'package:learn_programtion/core/theming/color.dart';
import 'package:learn_programtion/core/theming/font_style.dart';
import 'package:learn_programtion/features/courses/logic/cubit/cubit/coursees_cubit.dart';
import 'package:learn_programtion/features/courses/logic/cubit/cubit/coursees_state.dart';

class FinishLessonBlocListener extends StatefulWidget {
  const FinishLessonBlocListener({super.key});

  @override
  State<FinishLessonBlocListener> createState() => _SinginBlocListenerState();
}

class _SinginBlocListenerState extends State<FinishLessonBlocListener> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<CourseesCubit, CoursesState>(
      listenWhen: (previous, current) =>
          current is FinishedError ||
          current is FinishedSuccess ||
          current is FinishedLoading,
      listener: (context, state) {
        state.maybeWhen(
          finishedLoading: () => showDialog(
            context: context,
            builder: (context) => Center(
              child: CircularProgressIndicator(
                color: ColorManger.primary_ColorBlue,
              ),
            ),
          ),
          finishedSuccess: (message) => successcourses(context, message),
          finishedError: (error) => errorcourse(context, error),
          orElse: () {
            SizedBox.shrink();
          },
        );
      },
      child: SizedBox.shrink(),
    );
  }
}

void successcourses(BuildContext context, String message) {
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
              context.pushNamed(Routers.home_page);
            },
            child: Text('حسناً', style: FontStyleAndText.buttonfonttext),
          ),
        )
      ],
    ),
  );
}

void errorcourse(BuildContext context, String error) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            icon: Icon(
              Icons.error,
              color: Colors.red,
              size: 50,
            ),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
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
                    context.pushNamed(Routers.levelMe);
                  },
                  child: Text('حسناً', style: FontStyleAndText.buttonfonttext),
                ),
              )
            ],
          ));
}
