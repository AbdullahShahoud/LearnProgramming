import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_programtion/core/helper/extention.dart';
import 'package:learn_programtion/core/theming/font_style.dart';
import 'package:learn_programtion/features/singin/logic/cubit/singin_cubit.dart';
import 'package:learn_programtion/features/singin/logic/cubit/singin_stare.dart';

import '../../../core/helper/spacing.dart';
import '../../../core/routing/router.dart';
import '../../../core/theming/color.dart';
import '../../widget/button.dart';

class Welcome extends StatefulWidget {
  Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SinginCubit, SinginState>(
        listener: (context, state) {},
        builder: (context, state) => SafeArea(
          child: Stack(children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              foregroundDecoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/image/welcome.jfif'),
                    fit: BoxFit.cover),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'هيا نبدأ',
                  style: FontStyleAndText.homefont,
                ),
                verticalBox(100.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'تحديد نوع المستخدم',
                      style: FontStyleAndText.homefont,
                    ),
                  ),
                ),
                verticalBox(20.h),
                InkWell(
                  onTap: () {
                    setState(() {
                      assentType(Check.student, context);
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Container(
                        alignment: Alignment.centerLeft,
                        width: MediaQuery.of(context).size.width - 20.w,
                        height: 70.h,
                        decoration: BoxDecoration(
                          color: ColorManger.primary_ColorYello,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black, width: 1),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'طالب',
                                textAlign: TextAlign.right,
                                style: FontStyleAndText.homemedia,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 7.0),
                                child: Radio(
                                    focusColor: Colors.white,
                                    splashRadius: 15,
                                    value: Check.student,
                                    groupValue: SinginCubit.get(context).site,
                                    onChanged: (value) {
                                      setState(() {
                                        SinginCubit.get(context).site = value;
                                      });
                                    }),
                              )
                            ])),
                  ),
                ),
                verticalBox(12.h),
                InkWell(
                  onTap: () {
                    setState(() {
                      assentType(Check.teacher, context);
                    });
                  },
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Container(
                          alignment: Alignment.centerLeft,
                          width: MediaQuery.of(context).size.width - 20.w,
                          height: 70.h,
                          decoration: BoxDecoration(
                            color: ColorManger.primary_ColorYello,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black, width: 1),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'مدرس',
                                  textAlign: TextAlign.right,
                                  style: FontStyleAndText.homemedia,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 7.0),
                                  child: Radio(
                                      focusColor: Colors.white,
                                      splashRadius: 15,
                                      value: Check.teacher,
                                      groupValue: SinginCubit.get(context).site,
                                      onChanged: (value) {
                                        setState(() {
                                          SinginCubit.get(context).site = value;
                                        });
                                      }),
                                )
                              ]))),
                ),
                verticalBox(40.h),
                button(
                  text: 'متابعة',
                  paddingV: 20.h,
                  paddingH: 100.w,
                  function: () {
                    context.pushNamed(Routers.singin);
                  },
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

void assentType(Check ch, BuildContext context) {
  SinginCubit.get(context).site = ch;
}
