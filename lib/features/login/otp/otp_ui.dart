// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:learn_programtion/core/helper/extention.dart';
import 'package:learn_programtion/core/helper/spacing.dart';
import 'package:learn_programtion/core/theming/color.dart';
import 'package:learn_programtion/core/theming/font_style.dart';
import 'package:learn_programtion/features/login/logic/cubit/login_cubit.dart';
import 'package:learn_programtion/features/login/otp/otp_bloc_Listener.dart';
import 'package:learn_programtion/features/widget/button.dart';

// import '../../../core/routing/router.dart';
import '../../widget/background.dart';

class OTPLogin extends StatelessWidget {
  OTPLogin({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Background(context),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 60.h),
              child: Text(
                'سارع',
                style: FontStyleAndText.homefont,
              ),
            ),
            verticalBox(20.h),
            OtpTextField(
              showCursor: true,
              numberOfFields: 6,
              filled: true,
              fillColor: Colors.white,
              disabledBorderColor: ColorManger.primary_ColorBlue,
              enabledBorderColor: Colors.black,
              showFieldAsBox: true,
              onSubmit: (code) {
                LoginCubit.get(context).otpLogin = code;
              },
            ),
            OtpLoginBlocListener(),
            verticalBox(30.h),
            button(
                text: 'المتابعة',
                paddingV: 20.h,
                function: () {
                  LoginCubit.get(context).emitOtpLogin();
                })
          ],
        ),
      ]),
    );
  }
}
