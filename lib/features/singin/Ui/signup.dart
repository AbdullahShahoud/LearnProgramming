// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learn_programtion/features/singin/Ui/widget/form_singin.dart';
import 'package:learn_programtion/features/singin/Ui/widget/singin_bloc_listener.dart';
import 'package:learn_programtion/features/singin/logic/cubit/singin_cubit.dart';

import '../../../core/helper/spacing.dart';
import '../../../core/theming/font_style.dart';
import '../../widget/background.dart';
import 'widget/account.dart';

class HomeSignIn extends StatefulWidget {
  HomeSignIn({super.key});
  @override
  State<HomeSignIn> createState() => _HomeSignInState();
}

class _HomeSignInState extends State<HomeSignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Background(context),
          Padding(
            padding: EdgeInsets.only(top: 80.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/svg/logo_text.svg',
                    width: 100.w, height: 100.h),
                Padding(
                  padding: EdgeInsets.only(right: 20.w),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'اهلا بك',
                      style: FontStyleAndText.homefont,
                    ),
                  ),
                ),
                verticalBox(20.h),
                FormSingin(),
                verticalBox(20.h),
                YourAccount(),
                SinginBlocListener()
              ],
            ),
          )
        ],
      )),
    );
  }
}
