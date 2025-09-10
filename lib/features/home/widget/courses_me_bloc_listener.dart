import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learn_programtion/features/courses/logic/cubit/cubit/coursees_cubit.dart';
import 'package:learn_programtion/features/home/widget/courses_me.dart';
import 'package:learn_programtion/features/home/widget/courses_me_shimmer.dart';

import '../../courses/logic/cubit/cubit/coursees_state.dart';
import '../../courses/logic/model/courses_me_response.dart';

class CoursesMeBlocListener extends StatelessWidget {
  const CoursesMeBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return BlocBuilder<CourseesCubit, CoursesState>(
          buildWhen: (previous, current) =>
              current is LoadingCoursesMe ||
              current is SuccessCoursesMe ||
              current is ErrorCoursesMe,
          builder: (context, state) {
            return state.maybeWhen(successCoursesMe: (data) {
              return success(data);
            }, errorCoursesMe: (error) {
              return Error();
            }, loadingCoursesMe: () {
              return loading(context);
            }, orElse: () {
              return SizedBox.shrink();
            });
          });
    });
  }
}

Widget success(List<CourseMeWrapper> courseItem) {
  return CoursesMe(courseItem);
}

Widget Error() {
  return Center(
    child: SvgPicture.asset(
      'assets/svg/404error.svg',
      width: 100.w,
      height: 100.h,
    ),
  );
}

Widget loading(BuildContext context) {
  return CoursesMeShimmer();
}
