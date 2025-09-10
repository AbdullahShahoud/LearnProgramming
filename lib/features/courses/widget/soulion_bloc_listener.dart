import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_programtion/core/helper/extention.dart';
import 'package:learn_programtion/core/routing/router.dart';
import 'package:learn_programtion/core/theming/color.dart';
import 'package:learn_programtion/core/theming/font_style.dart';
import 'package:learn_programtion/features/courses/logic/cubit/cubit/coursees_cubit.dart';
import 'package:learn_programtion/features/courses/logic/cubit/cubit/coursees_state.dart';

import '../../../core/helper/spacing.dart';

class SoulionBlocListener extends StatelessWidget {
  const SoulionBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CourseesCubit, CoursesState>(
      listenWhen: (previous, current) =>
          current is SoulionTestError ||
          current is SoulionTestLoading ||
          current is SoulionTestSuccess,
      listener: (context, state) {
        state.maybeWhen(
          soulionTestLoading: () => showDialog(
            context: context,
            builder: (context) => Center(
              child: CircularProgressIndicator(
                color: ColorManger.primary_ColorBlue,
              ),
            ),
          ),
          soulionTestSuccess: (data) => successcourses(context, data),
          soulionTestError: (error) => errorcourse(context, error),
          orElse: () {
            SizedBox.shrink();
          },
        );
      },
      child: SizedBox.shrink(),
    );
  }
}

void successcourses(BuildContext context, dynamic message) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: Icon(
        Icons.check,
        color: Colors.green,
        size: 50,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '${message.score}',
            textDirection: TextDirection.rtl,
            style: FontStyleAndText.fontmedia,
          ),
          verticalBox(7.h),
          Text(
            message.message,
            textDirection: TextDirection.rtl,
            style: FontStyleAndText.font_big,
          ),
        ],
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
                    context.pushNamed(Routers.home_page);
                  },
                  child: Text('حسناً', style: FontStyleAndText.buttonfonttext),
                ),
              )
            ],
          ));
}
