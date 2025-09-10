import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_programtion/core/helper/spacing.dart';
import 'package:learn_programtion/core/theming/font_style.dart';
import 'package:learn_programtion/features/profile/UI/widget/gride_item.dart';
import 'package:learn_programtion/features/profile/logic/profile_cubit/cubit/profile_and_notification_cubit.dart';

import '../../../../core/theming/color.dart';

class Grade extends StatefulWidget {
  const Grade({super.key});

  @override
  State<Grade> createState() => _GradeState();
}

class _GradeState extends State<Grade> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(13.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: ColorManger.primary_ColorBlue),
      child: Column(children: [
        Text(
          'الشهادات',
          style: FontStyleAndText.fontbold,
        ),
        verticalBox(10.h),
        context.read<ProfileAndNotificationCubit>().grade.length == 0
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'لا يوجد شهادات حاليا',
                  style: FontStyleAndText.fontmedia
                      .copyWith(color: ColorManger.primary_ColorYello),
                ),
              )
            : Container(
                height: 300.h,
                child: ListView.builder(
                  itemCount:
                      context.read<ProfileAndNotificationCubit>().grade.length,
                  itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: GradeItem(
                          context,
                          context
                              .read<ProfileAndNotificationCubit>()
                              .grade[index])),
                ),
              ),
      ]),
      // verticalBox(20.h),
      // button(
      //     text: 'عرض الكل',
      //     paddingV: 10.h,
      //     paddingH: 40.w,
      //     function: () {
      //       context.read<ProfileAndNotificationCubit>().emiteViewGrade();
      //       showModalBottomSheet(
      //           context: context,
      //           backgroundColor: ColorManger.primary_ColorBlue,
      //           builder: ((context) {
      //             return BlocProvider.value(
      //               value: BlocProvider.of<ProfileAndNotificationCubit>(
      //                   context),
      //               child: Container(
      //                 height: 800.h,
      //                 child: Column(
      //                   crossAxisAlignment: CrossAxisAlignment.center,
      //                   children: [
      //                     Padding(
      //                       padding:
      //                           const EdgeInsets.symmetric(vertical: 8.0),
      //                       child: Text(
      //                         'الشهادات',
      //                         style: FontStyleAndText.fontbold,
      //                       ),
      //                     ),
      //                     Container(
      //                       padding:
      //                           EdgeInsets.only(right: 14.w, left: 14.w),
      //                       height: 400.h,
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             );
      //           }));
      //     })
    );
  }
}
