import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theming/color.dart';
import '../../core/theming/font_style.dart';

void alertSuccess(BuildContext context, String message, VoidCallback function) {
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
        style: FontStyleAndText.fontmedia,
      ),
      actions: [
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: ColorManger.primary_ColorBlue),
            onPressed: function,
            child: Text('حسناً', style: FontStyleAndText.buttonfonttext),
          ),
        )
      ],
    ),
  );
}
