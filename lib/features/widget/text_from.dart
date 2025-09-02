import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theming/color.dart';
import '../../core/theming/font_style.dart';

Widget FromFields({
  required String hint,
  required Widget icon,
  required TextInputType keyboardType,
  required TextEditingController controller,
  required Function(String?) vaildet,
  Color color = Colors.white,
  required BuildContext context,
  double paddingContentV = 4,
  double paddingContentH = 50,
  bool obscure = false,
  String? init_value,
}) =>
    Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      child: TextFormField(
        validator: (value) {
          vaildet(value);
          return null;
        },
        initialValue: init_value,
        controller: controller,
        cursorColor: color,
        textAlign: TextAlign.right,
        obscureText: obscure,
        style: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w400,
          color: ColorManger.font,
        ),
        decoration: InputDecoration(
            filled: true,
            fillColor: color,
            contentPadding: EdgeInsets.symmetric(
                vertical: paddingContentV.w, horizontal: paddingContentH.h),
            prefixIcon: icon,
            hintText: hint,
            hintStyle: FontStyleAndText.textfrom,
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(30),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(30),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: ColorManger.primary_ColorYello)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.red))),
        keyboardType: keyboardType,
      ),
    );
