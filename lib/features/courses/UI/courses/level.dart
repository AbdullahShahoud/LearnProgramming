import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_programtion/core/helper/extention.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/routing/router.dart';
import '../../../../core/theming/font_style.dart';
import '../../../widget/button.dart';
import '../../logic/cubit/cubit/coursees_cubit.dart';
import '../../logic/cubit/cubit/coursees_state.dart';
import '../../widget/level_item.dart';
import '../../widget/tab_bar_course.dart';

class CoursesLevel extends StatefulWidget {
  const CoursesLevel({super.key});

  @override
  State<CoursesLevel> createState() => _CoursesLevelState();
}

class _CoursesLevelState extends State<CoursesLevel> {
  @override
  Widget build(BuildContext context) {
    final course = context.read<CourseesCubit>().selectedcorse;
    return Scaffold(body: BlocBuilder<CourseesCubit, CoursesState>(
      builder: (context, state) {
        return SafeArea(
            child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            TabBarCourse(image: course!.image!, name: course.name!),
            verticalBox(10.h),
            Text('المستويات', style: FontStyleAndText.homefont),
            Container(
                height: 500.h,
                child: ListView.builder(
                    itemCount: course.levels.length,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6.w),
                          child: LevelItem(
                            image: course.image!,
                            name: course.levels[index].name,
                          ));
                    })),
            verticalBox(10.h),
            button(
                text: 'المتابعة',
                paddingV: 16.h,
                paddingH: 120.w,
                function: () {
                  context.pushNamed(
                    Routers.introdactionCourse,
                  );
                })
          ]),
        ));
      },
    ));
  }
}
