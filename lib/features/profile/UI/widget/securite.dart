// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_programtion/core/DI/dependency_injection.dart';
import 'package:learn_programtion/core/helper/spacing.dart';
import 'package:learn_programtion/core/theming/font_style.dart';
import 'package:learn_programtion/features/profile/logic/profile_cubit/cubit/profile_and_notification_cubit.dart';
import 'package:learn_programtion/features/widget/button.dart';

import '../../../../core/theming/color.dart';
import '../../../widget/text_from.dart';
import '../../logic/profile_cubit/cubit/profile_and_notification_state.dart';
import 'security_bloc_listener.dart';

class Security extends StatefulWidget {
  const Security({super.key});

  @override
  State<Security> createState() => _SecurityState();
}

class _SecurityState extends State<Security> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(13.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: ColorManger.primary_ColorBlue),
        child: Stack(children: [
          Positioned(
            left: 8,
            top: 4,
            child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(ColorManger.primary_ColorYello),
                ),
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      backgroundColor: ColorManger.primary_ColorBlue,
                      builder: ((context) {
                        return BlocProvider(
                          create: (context) => ProfileAndNotificationCubit(
                              getIt(),
                              getIt(),
                              getIt(),
                              getIt(),
                              getIt(),
                              getIt(),
                              getIt(),
                              getIt()),
                          child: aaaa(context),
                        );
                      }));
                },
                child: Text('تعديل')),
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'الامان',
                    style: FontStyleAndText.fontbold,
                  ),
                ),
                verticalBox(25.h),
                Text(
                  'كلمة المرور',
                  textDirection: TextDirection.rtl,
                  style: FontStyleAndText.homefonttext,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  padding:
                      EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                  width: MediaQuery.of(context).size.width - 20.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: ColorManger.primary_ColorYello,
                    borderRadius: BorderRadius.circular(15),
                    // border: Border.all(color: Colors.black,width: 1),
                  ),
                  child: Text(
                    '* * * * * * * * *',
                    style: FontStyleAndText.fontbold,
                  ),
                )
              ])
        ]));
  }
}

void ValidationSecurety(BuildContext context) {
  if (context
      .read<ProfileAndNotificationCubit>()
      .keysPassword
      .currentState!
      .validate()) {
    context.read<ProfileAndNotificationCubit>().emiteChangePassword();
  }
}

Widget aaaa(BuildContext context) {
  return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    Text(
      'الامان',
      style: FontStyleAndText.fontbold,
    ),
    verticalBox(10.h),
    BlocConsumer<ProfileAndNotificationCubit, ProfileAndNotificationState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Form(
          key: context.read<ProfileAndNotificationCubit>().keysPassword,
          child: Column(children: [
            FromFields(
                vaildet: (value) {
                  if (value!.isEmpty || value == null) {
                    return 'الرجاء ادخال كلمة المرور';
                  }
                },
                paddingContentV: 18.h,
                hint: 'كلمة المرور القديمة',
                controller: context
                    .read<ProfileAndNotificationCubit>()
                    .controllerPassword!,
                icon: Icon(
                  Icons.https,
                  size: 25,
                  color: ColorManger.font,
                ),
                keyboardType: TextInputType.number,
                context: context),
            verticalBox(8.h),
            FromFields(
                vaildet: (value) {
                  if (value!.isEmpty || value == null) {
                    return 'الرجاء ادخال كلمة المرور';
                  }
                },
                paddingContentV: 18.h,
                hint: 'كلمة المرور الجديدة',
                controller: context
                    .read<ProfileAndNotificationCubit>()
                    .controllerPassword2!,
                icon: Icon(
                  Icons.https,
                  size: 25,
                  color: ColorManger.font,
                ),
                keyboardType: TextInputType.number,
                context: context),
            verticalBox(8.h),
            FromFields(
                vaildet: (value) {
                  if (value!.isEmpty || value == null) {
                    return 'الرجاء ادخال كلمة المرور';
                  }
                },
                paddingContentV: 18.h,
                hint: 'تأكيد كلمة المرور',
                controller: context
                    .read<ProfileAndNotificationCubit>()
                    .controllerPassword3!,
                icon: Icon(
                  Icons.https,
                  size: 25,
                  color: ColorManger.font,
                ),
                keyboardType: TextInputType.number,
                context: context),
            verticalBox(20.h),
            SecurityBlocListener(),
            button(
                paddingV: 16.h,
                paddingH: 140.w,
                text: 'حفظ',
                function: () {
                  ValidationSecurety(context);
                })
          ]),
        );
      },
    )
  ]);
}
