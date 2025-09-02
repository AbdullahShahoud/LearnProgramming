import 'package:flutter/material.dart';
import 'package:learn_programtion/core/helper/extention.dart';

import '../../../../core/routing/router.dart';
import '../../../../core/theming/color.dart';
import '../../../../core/theming/font_style.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

bool? chek = false;

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7),
      child: Row(
        children: [
          InkWell(
            child: Text(
              'هل نسيت كلمة المرور؟',
              style: FontStyleAndText.smallestTouch,
            ),
            onTap: () {
              context.pushNamed(Routers.confirmPassword);
            },
          ),
          Spacer(),
          Text(
            'تذكرني ',
            style: FontStyleAndText.smallestTouch,
          ),
          Checkbox(
              value: chek,
              activeColor: ColorManger.primary_ColorBlue,
              onChanged: (value) {
                setState(() {
                  chek = value;
                });
              }),
        ],
      ),
    );
  }
}
