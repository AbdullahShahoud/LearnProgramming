// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_programtion/features/teacher/courses/logic/courses_cubit/cubit/courser_cubit_cubit.dart';
import 'package:learn_programtion/features/teacher/courses/logic/courses_cubit/cubit/courser_cubit_state.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/theming/color.dart';
import '../../../../core/theming/font_style.dart';
import '../../../widget/button.dart';
import '../../../widget/text_from.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LessonBodyTeacher extends StatefulWidget {
  const LessonBodyTeacher({super.key});

  @override
  State<LessonBodyTeacher> createState() => _LessonItemState();
}

class _LessonItemState extends State<LessonBodyTeacher> {
  late YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'egMWlD3fLJ8',
    // CourseesCubit.get(context).selectedlessonMe!.video!,
    flags: YoutubePlayerFlags(
      autoPlay: true,
      mute: true,
      disableDragSeek: false,
      loop: false,
      isLive: false,
      forceHD: false,
      enableCaption: true,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocConsumer<CourserCubitTeacher, CourserCubitTeacherState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = CourserCubitTeacher.get(context);
          final lessonMe = CourserCubitTeacher.get(context).selectedlesson;
          return SingleChildScrollView(
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  YoutubePlayer(
                    controller: _controller,
                    width: MediaQuery.of(context).size.width,
                    aspectRatio: 16 / 12,
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: ColorManger.primary_ColorBlue,
                  ),
                  verticalBox(20.h),
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                content: Container(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 20.h),
                                    height: 220.h,
                                    width: 400.w,
                                    child: Column(
                                      children: [
                                        FromFields(
                                            vaildet: (value) {
                                              if (value!.isEmpty ||
                                                  value == null) {
                                                return 'الرجاء ادخال الرابط';
                                              }
                                            },
                                            hint: 'ادخل الرابط',
                                            controller: cubit.controller1,
                                            icon: Icon(
                                                Icons.question_answer_rounded),
                                            keyboardType: TextInputType.name,
                                            context: context),
                                        verticalBox(10.h),
                                        button(
                                            text: 'تعديل',
                                            paddingH: 90.w,
                                            paddingV: 16.h,
                                            function: () {}),
                                      ],
                                    )),
                              ));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'تعديل الفيديو',
                          style: FontStyleAndText.fontmedia
                              .copyWith(color: ColorManger.primary_ColorBlue),
                        ),
                      ],
                    ),
                  ),
                  verticalBox(10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: TextField(
                      controller: CourserCubitTeacher.get(context).controller2,
                      maxLines: 20,
                      keyboardType: TextInputType.multiline,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: lessonMe!.description!,
                        hintTextDirection: TextDirection.rtl,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.h),
                    child: button(
                        text: 'حفظ',
                        paddingH: 140.w,
                        paddingV: 17.h,
                        function: () {}),
                  ),
                ],
              ),
            ),
          );
        },
      )),
    );
  }
}
