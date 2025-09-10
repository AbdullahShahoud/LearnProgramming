import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_programtion/core/helper/spacing.dart';
import 'package:learn_programtion/features/courses/logic/cubit/cubit/coursees_cubit.dart';

import '../../../../core/theming/font_style.dart';
import '../../../widget/button.dart';
import '../../logic/cubit/cubit/coursees_state.dart';
import '../../widget/check_course_blloc_listener.dart';

class CourseIntrodaction extends StatelessWidget {
  const CourseIntrodaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CourseesCubit, CoursesState>(
        builder: (context, state) {
          final course = CourseesCubit.get(context).selectedcorse;
          return SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image(
                    image: AssetImage('assets/image/unnamed.png'
                        // course!.image!
                        ),
                    width: MediaQuery.of(context).size.width.w,
                    height: 350.h,
                    fit: BoxFit.fill,
                  ),
                ),
                verticalBox(15.h),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                  child: Text(
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    softWrap: true,
                    course!.descrip!,
                    maxLines: 15,
                    textScaler: TextScaler.linear(1),
                    style: FontStyleAndText.homefonttext,
                  ),
                ),
                CheckCourseBlocListener(),
                verticalBox(15.h),
                button(
                    text: 'التسجيل',
                    paddingV: 16.h,
                    paddingH: 140.w,
                    function: () {
                      CourseesCubit.get(context).emitCheckCourses();
                    })
              ],
            ),
          );
        },
      ),
    );
  }
}
