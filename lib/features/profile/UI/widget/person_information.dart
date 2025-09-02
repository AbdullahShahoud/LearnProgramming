// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_programtion/core/DI/dependency_injection.dart';
import 'package:learn_programtion/core/helper/spacing.dart';
import 'package:learn_programtion/core/theming/font_style.dart';
import 'package:learn_programtion/features/profile/logic/profile_cubit/cubit/profile_and_notification_cubit.dart';
import 'package:learn_programtion/features/widget/button.dart';
import 'package:learn_programtion/core/helper/extention.dart';
import '../../../../core/routing/router.dart';

import '../../../../core/theming/color.dart';
import '../../../widget/text_from.dart';
import '../../logic/profile_cubit/cubit/profile_and_notification_state.dart';
import 'person_information_bloc_listener.dart';

class PersonInformation extends StatefulWidget {
  const PersonInformation({super.key});

  @override
  State<PersonInformation> createState() => _PersonInformationState();
}

class _PersonInformationState extends State<PersonInformation> {
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
            left: 6.w,
            top: 4.h,
            child: TextButton(
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
                                getIt())
                              ..emiteGetInformation(),
                            child: bbbb(context));
                      }));
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(ColorManger.primary_ColorYello),
                ),
                child: Text('تعديل')),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'المعلومات \n الشخصية',
                    style: FontStyleAndText.fontbold,
                  ),
                ),
              ),
              verticalBox(15.h),
              Text(
                'البريد الالكتروني',
                style: FontStyleAndText.homefonttext,
                textAlign: TextAlign.right,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width - 20.w,
                height: 70.h,
                decoration: BoxDecoration(
                  color: ColorManger.primary_ColorYello,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  context.read<ProfileAndNotificationCubit>().email!,
                  textDirection: TextDirection.rtl,
                  style: FontStyleAndText.textfrom,
                  textAlign: TextAlign.right,
                ),
              ),
              verticalBox(10.h),
              Text(
                'الاسم',
                textDirection: TextDirection.rtl,
                style: FontStyleAndText.homefonttext,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width - 20.w,
                height: 60.h,
                decoration: BoxDecoration(
                  color: ColorManger.primary_ColorYello,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  context.read<ProfileAndNotificationCubit>().user_name!,
                  textDirection: TextDirection.rtl,
                  style: FontStyleAndText.textfrom,
                ),
              )
            ],
          ),
        ]));
  }
}

void ValidateEmailAndName(BuildContext context) {
  if (context
      .read<ProfileAndNotificationCubit>()
      .keysEmailAndName
      .currentState!
      .validate()) {
    context.read<ProfileAndNotificationCubit>().emiteChangeEmail();
  }
}

Widget bbbb(BuildContext context) {
  return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    BlocConsumer<ProfileAndNotificationCubit, ProfileAndNotificationState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Form(
            key: context.read<ProfileAndNotificationCubit>().keysEmailAndName,
            child: Column(children: [
              Text(
                'المعلومات الشخصية',
                style: FontStyleAndText.fontbold,
              ),
              verticalBox(20.h),
              FromFields(
                  vaildet: (value) {
                    if (value!.isEmpty || value == null) {
                      return 'الرجاء ادخال الاسم';
                    }
                  },
                  paddingContentV: 18.h,
                  hint: 'الاسم',
                  controller: context
                      .read<ProfileAndNotificationCubit>()
                      .controllerName!,
                  icon: Icon(
                    Icons.person,
                    size: 25,
                    color: ColorManger.font,
                  ),
                  keyboardType: TextInputType.name,
                  context: context),
              FromFields(
                  vaildet: (value) {
                    if (value!.isEmpty || value == null) {
                      return 'الرجاء ادخال البريد الالكتروني';
                    }
                  },
                  paddingContentV: 18.h,
                  hint: 'البريد الاكتروني',
                  controller: context
                      .read<ProfileAndNotificationCubit>()
                      .controllerEmail!,
                  icon: Icon(
                    Icons.email_outlined,
                    size: 25,
                    color: ColorManger.font,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  context: context),
              verticalBox(30.h),
              PersonInformationBlocListener(),
              button(
                  text: 'حفظ',
                  paddingH: 140.w,
                  paddingV: 16.h,
                  function: () {
                    ValidateEmailAndName(context);
                    context.pushNamed(Routers.home_page);
                  })
            ]));
      },
    ),
  ]);
}
