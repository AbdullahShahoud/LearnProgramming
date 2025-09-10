import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_programtion/core/helper/extention.dart';
import 'package:learn_programtion/core/routing/router.dart';
import 'package:learn_programtion/core/theming/color.dart';
import 'package:learn_programtion/core/theming/font_style.dart';
import 'package:learn_programtion/features/login/logic/cubit/login_cubit.dart';
import 'package:learn_programtion/features/login/logic/cubit/login_stare.dart';
import 'package:learn_programtion/features/login/otp/logic/model/otp_response.dart';

import '../../../core/helper/sherdPrefernce.dart';

class OtpLoginBlocListener extends StatefulWidget {
  const OtpLoginBlocListener({super.key});

  @override
  State<OtpLoginBlocListener> createState() => _SinginBlocListenerState();
}

class _SinginBlocListenerState extends State<OtpLoginBlocListener> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoadingOtp || current is ErrorOtp || current is SuccessOtp,
      listener: (context, state) {
        state.whenOrNull(
          loadingOtp: () => showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => Center(
              child: CircularProgressIndicator(
                color: ColorManger.primary_ColorBlue,
              ),
            ),
          ),
          successOtp: (data) => SinginSuccess(context, data),
          errorOtp: (error) => singinError(context, error),
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}

void SinginSuccess(BuildContext context, OtpResponseLogin otp) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(otp.message!),
            actions: [
              TextButton(
                  onPressed: () async {
                    await SharedPrefHelper.getString('type') == 'student'
                        ? context.pushNamed(Routers.home_page)
                        : context.pushNamed(Routers.home_page_teacher);
                  },
                  child: Text('خروج'))
            ],
          ));
}

void singinError(BuildContext context, String error) {
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
              style: FontStyleAndText.font_big,
            ),
            actions: [
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManger.primary_ColorBlue),
                  onPressed: () {
                    context.pushNamed(Routers.Welcome);
                  },
                  child: Text('حسناً', style: FontStyleAndText.buttonfonttext),
                ),
              )
            ],
          ));
}
