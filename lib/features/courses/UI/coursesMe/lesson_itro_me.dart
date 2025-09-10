import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_programtion/core/helper/extention.dart';
import 'package:learn_programtion/core/helper/spacing.dart';
import 'package:learn_programtion/features/courses/logic/cubit/cubit/coursees_cubit.dart';
import 'package:learn_programtion/features/courses/widget/item_device.dart';
import 'package:learn_programtion/features/courses/widget/tab_bar_course.dart';
import 'package:learn_programtion/features/widget/button.dart';

import '../../../../core/routing/router.dart';
import '../../../../core/theming/font_style.dart';
import '../../logic/cubit/cubit/coursees_state.dart';

class LessonsIntrodactionMe extends StatelessWidget {
  const LessonsIntrodactionMe({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CourseesCubit, CoursesState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final coure = CourseesCubit.get(context).seletCourseMe;
        return Scaffold(
            body: SafeArea(
                child: SingleChildScrollView(
          child: Column(
            children: [
              TabBarCourse(image: coure!.course!.image!, name: coure.course!.name!),
              verticalBox(30.h),
              Text(
                'بعد حضورك الدرس سوف نجري لك \n احتبارا يقيس مدى فهمك',
                style: FontStyleAndText.fontbold,
                textAlign: TextAlign.center,
              ),
              verticalBox(20.h),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  ''' اليك بعض النصائح التي تساعدك على الدراسة
                               : بشكل افضل''',
                  style: FontStyleAndText.homefonttext,
                  textAlign: TextAlign.right,
                ),
              ),
              verticalBox(30.h),
              Container(
                height: 300.h,
                width: double.infinity,
                // color: ColorManger.primary_ColorBlue,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                child: Column(
                  children: [
                    Item(context, ' خصص وقت للدراسة بشكل يومي'),
                    verticalBox(12.h),
                    Item(context, 'خصص مكان للدراسة '),
                    verticalBox(12.h),
                    Item(context, 'ضع بجانبك ورقة وقلم وسجل الملاحظات '),
                  ],
                ),
              ),
              verticalBox(30.h),
              button(
                  paddingV: 16.w,
                  paddingH: 140.h,
                  text: 'ابدأ',
                  function: () {
                    context.pushNamed(
                      Routers.lessonBodyMe,
                    );
                  })
            ],
          ),
        )));
      },
    );
  }
}
