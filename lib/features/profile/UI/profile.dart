import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_programtion/core/helper/spacing.dart';
import 'package:learn_programtion/core/theming/color.dart';
import 'package:learn_programtion/core/theming/font_style.dart';
import 'package:learn_programtion/features/login/Ui/widget/forget_password.dart';
import 'package:learn_programtion/features/profile/logic/profile_cubit/cubit/profile_and_notification_cubit.dart';
import '../../../core/DI/dependency_injection.dart';
import 'widget/delet_user_bloc_listener.dart';
import 'widget/grabe.dart';
import 'widget/person_information.dart';
import 'widget/securite.dart';

class Profile extends StatefulWidget {
  const Profile({super.key, bool? check});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ProfileAndNotificationCubit(getIt(), getIt(),
            getIt(), getIt(), getIt(), getIt(), getIt(), getIt())
          ..emiteGetInformation(),
        child: Padding(
          padding: EdgeInsets.only(top: 24.h),
          child: Column(
            children: [
              Stack(children: [
                Padding(
                  padding: EdgeInsets.only(top: 17.h),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/image/welcome.jfif'),
                    radius: 100.sp,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 20,
                  child: InkWell(
                    onTap: () {},
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          size: 35,
                          Icons.camera_alt_sharp,
                          color: ColorManger.primary_ColorBlue,
                        )),
                  ),
                )
              ]),
              verticalBox(15.h),
              DeletBlocListener(),
              verticalBox(15.h),
              InkWell(
                onTap: () {
                  ProfileAndNotificationCubit.get(context).emiteDeletUser();
                },
                child: Icon(
                  Icons.logout_rounded,
                  size: 45,
                  color: Colors.red,
                ),
              ),
              verticalBox(15.h),
              Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(' الاعدادات', style: FontStyleAndText.homefont),
                ),
              ),
              verticalBox(5.h),
              CarouselSlider(
                disableGesture: false,
                items: [
                  PersonInformation(),
                  Security(),
                  if (chek == false) Grade()
                ],
                options: CarouselOptions(
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 1000),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    aspectRatio: 20.w / 19.h,
                    enableInfiniteScroll: false,
                    enlargeCenterPage: true,
                    initialPage: 2,
                    reverse: true),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
