// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_programtion/core/helper/extention.dart';
import 'package:learn_programtion/features/courses/logic/cubit/cubit/coursees_cubit.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/routing/router.dart';
import '../../../../core/theming/color.dart';
import '../../../../core/theming/font_style.dart';
import '../../../widget/button.dart';
import '../../../widget/text_from.dart';
import '../../logic/cubit/cubit/coursees_state.dart';
import '../../widget/finich_lesson_bloc_listener.dart';
import '../../widget/send_quqtion_bloc_listener.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LessonBodyMe extends StatefulWidget {
  const LessonBodyMe({super.key});

  @override
  State<LessonBodyMe> createState() => _LessonItemState();
}

class _LessonItemState extends State<LessonBodyMe> {
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
          child: BlocConsumer<CourseesCubit, CoursesState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final lessonMe = CourseesCubit.get(context).selectedlessonMe;
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
                          builder: (context) =>
                              BlocBuilder<CourseesCubit, CoursesState>(
                                builder: (context, state) {
                                  return AlertDialog(
                                    content: Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 20.h),
                                      height: 220.h,
                                      width: 400.w,
                                      child: Column(
                                        children: [
                                          Form(
                                            key: CourseesCubit.get(context)
                                                .keyMe,
                                            child: Column(
                                              children: [
                                                FromFields(
                                                    vaildet: (value) {
                                                      if (value!.isEmpty ||
                                                          value == null) {
                                                        return 'الرجاء ادخال السؤال';
                                                      }
                                                    },
                                                    hint: 'ادخل السؤال',
                                                    controller:
                                                        CourseesCubit.get(
                                                                context)
                                                            .inputQuationsMe,
                                                    icon: Icon(Icons
                                                        .question_answer_rounded),
                                                    keyboardType:
                                                        TextInputType.name,
                                                    context: context),
                                                verticalBox(10.h),
                                                button(
                                                    text: 'ارسال',
                                                    paddingH: 90.w,
                                                    paddingV: 16.h,
                                                    function: () {
                                                      sendQuationsMe(
                                                          context,
                                                          CourseesCubit.get(
                                                                  context)
                                                              .seletCourseMe!
                                                              .course!
                                                              .id!,
                                                          CourseesCubit.get(
                                                                  context)
                                                              .selectedlessonMe!
                                                              .id!,
                                                          CourseesCubit.get(
                                                                  context)
                                                              .inputQuationsMe
                                                              .text);
                                                    }),
                                                SendQuationsBlocListener()
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'إضافة سؤال',
                          style: FontStyleAndText.fontmedia
                              .copyWith(color: ColorManger.primary_ColorBlue),
                        ),
                        Icon(Icons.add,
                            color: ColorManger.primary_ColorBlue, size: 30)
                      ],
                    ),
                  ),
                  verticalBox(10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Text(
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.right,
                      softWrap: true,
                      lessonMe!.description!,
                      maxLines: 20,
                      textScaler: TextScaler.linear(1),
                      style: FontStyleAndText.homefonttext,
                    ),
                  ),
                  FinishLessonBlocListener(),
                  Padding(
                    padding: EdgeInsets.all(20.h),
                    child: button(
                        text: 'متابعة',
                        paddingH: 140.w,
                        paddingV: 17.h,
                        function: () {
                          if (CourseesCubit.get(context)
                              .selectedlessonMe!
                              .finished==false) {
                          CourseesCubit.get(context).emitFinishLesson();
                          context.pushNamed(Routers.levelMe);
                          }else{
                            context.pushNamed(Routers.levelMe);
                          }
                        }),
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

void sendQuationsMe(
    BuildContext context, int idCourse, int idLesson, String text) {
  if (CourseesCubit.get(context).keyMe.currentState!.validate()) {
    CourseesCubit.get(context).emitSendQuation(idCourse, idLesson, text);
  }
}
