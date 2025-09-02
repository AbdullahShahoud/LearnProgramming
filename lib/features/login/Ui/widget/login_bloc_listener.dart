import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_programtion/core/helper/extention.dart';
import 'package:learn_programtion/core/theming/color.dart';
import 'package:learn_programtion/features/login/logic/cubit/login_cubit.dart';
import 'package:learn_programtion/features/login/logic/cubit/login_stare.dart';

import '../../../../core/routing/router.dart';
import '../../../../core/theming/font_style.dart';

class LoginBlocListener extends StatefulWidget {
  const LoginBlocListener({super.key});

  @override
  State<LoginBlocListener> createState() => _LoginBlocListenerState();
}

class _LoginBlocListenerState extends State<LoginBlocListener> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading ||
          current is Error ||
          current is Success ||
          current is SuccessMs,
      listener: (context, state) {
        state.whenOrNull(
          successMs: (data) {
            context.pushNamed(Routers.otp);
          },
          loading: () => showDialog(
              context: context,
              builder: (context) => Center(
                    child: CircularProgressIndicator(
                      color: ColorManger.primary_ColorBlue,
                    ),
                  )),
          success: (loginResponse) {
            // context.pushNamed(Routers.otp);
            context.read<LoginCubit>().type_user == 'student'
                ? context.pushNamed(Routers.home_page)
                : context.pushNamed(Routers.home_page_teacher);
          },
          error: (error) {
            errorLogin(context, error);
            context.pushNamed(Routers.otp);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}

void errorLogin(BuildContext context, String error) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            icon: Icon(
              Icons.error,
              color: Colors.red,
              size: 50,
            ),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
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
                    context.pushNamed(Routers.otp);
                  },
                  child: Text('حسناً', style: FontStyleAndText.buttonfonttext),
                ),
              )
            ],
          ));
}
