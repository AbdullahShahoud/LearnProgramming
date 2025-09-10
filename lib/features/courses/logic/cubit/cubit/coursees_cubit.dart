import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_programtion/features/courses/logic/cubit/cubit/coursees_state.dart';
import 'package:learn_programtion/features/courses/logic/model/checkCourser/check_course_ruqest.dart';
import 'package:learn_programtion/features/courses/logic/model/courses_response.dart';
import 'package:learn_programtion/features/courses/logic/model/finishCourser/finish_coures_ruqest.dart';
import 'package:learn_programtion/features/courses/logic/model/finish_lesson_ruqest.dart';
import 'package:learn_programtion/features/courses/logic/model/send_qaustion_request.dart';
import 'package:learn_programtion/features/courses/logic/repo/check_course_repo.dart';
import 'package:learn_programtion/features/courses/logic/repo/courser_me_repo.dart';
import 'package:learn_programtion/features/courses/logic/repo/courses_repo.dart';
import 'package:learn_programtion/features/courses/logic/repo/finish_course_repo.dart';
import 'package:learn_programtion/features/courses/logic/repo/finish_lesson_repo.dart';
import 'package:learn_programtion/features/courses/logic/repo/finish_test_repo.dart';
import 'package:learn_programtion/features/courses/logic/repo/send_quation_repo.dart';

import '../../../../../core/helper/sherdPrefernce.dart';
import '../../model/courses_me_response.dart';
import '../../model/finish_test_request.dart';
import '../../model/soulion_test_ruqest.dart';
import '../../repo/soulion_quation_repo.dart';

class CourseesCubit extends Cubit<CoursesState> {
  CourseesCubit(
      this.coursesMeRepo,
      this.coursesRepo,
      this.checkCourseRepo,
      this.finishCourseRepo,
      this.finishLessonRepo,
      this.finishLevelRepo,
      this.soulionQuationRepo,
      this.sendQuationsRepo)
      : super(CoursesState.listCoursesInitial());
  static CourseesCubit get(context) => BlocProvider.of(context);
  TextEditingController inputQuationsMe = TextEditingController();
  var keyMe = GlobalKey<FormState>();
  CoursesRepo coursesRepo;
  SoulionQuationRepo soulionQuationRepo;
  CoursesMeRepo coursesMeRepo;
  FinishCourseRepo finishCourseRepo;
  FinishLevelRepo finishLevelRepo;
  FinishLessonRepo finishLessonRepo;
  SendQuationsRepo sendQuationsRepo;
  CheckCourseRepo checkCourseRepo;
  // int? id;
  List<CoursesResponse> courses = [];
  CoursesResponse? selectedcorse;
  LevelMe? selectedlevelMe;
  LessonMe? selectedlessonMe;
  CourseMeWrapper? seletCourseMe;
  static const int ss = 10;
  List<String?> responseUser2 = List.generate(ss, (index) => '');
  List<QautionRuqest> qq = [];
  List<CourseMeWrapper> coursesMe = [];
  void emitCoursesList() async {
    emit(CoursesState.listCoursesLoading());
    final response = await coursesRepo.getCourse();
    response.when(success: (data) {
      courses = data.courseResponse!;
      emit(CoursesState.listCoursesSuccess(courses));
    }, failure: (error) {
      emit(CoursesState.listCoursesError(error: error.errorMessage));
    });
  }

  void emitCoursesMe() async {
    emit(CoursesState.loadingCoursesMe());
    final response = await coursesMeRepo.getCoursesMe();
    response.when(success: (data) {
      coursesMe = data.CourseMeResponse!;
      print('✅  ${data.CourseMeResponse!.length}');
      emit(CoursesState.successCoursesMe(coursesMe));
    }, failure: (error) {
      print('✅  ${error.errorMessage}');
      emit(CoursesState.errorCoursesMe(error: error.errorMessage));
    });
  }

  void emitCheckCourses() async {
    emit(CoursesState.checkCoursesLoading());
    int id = await SharedPrefHelper.getInt('id');
    final response = await checkCourseRepo.checkCourses(
        CheckCourseRuqest(course: selectedcorse!.id!, student: id));
    response.when(success: (data) {
      emit(CoursesState.checkCoursesSuccess(data.message));
    }, failure: (error) {
      emit(CoursesState.checkCoursesError(error: error.errorMessage));
    });
  }

  void emitSendQuation(int idCourse, int idLesson, String text) async {
    emit(CoursesState.sendQuationLoading());
    final response = await sendQuationsRepo.sendQuation(SendQautionsRuqest(
        question_text: text, course: idCourse, lesson: idLesson));
    response.when(success: (sendQautionReesponse) {
      emit(CoursesState.sendQuationSuccess(sendQautionReesponse.message!));
    }, failure: (error) {
      emit(CoursesState.sendQuationError(error: error.errorMessage));
    });
  }

  void emitFinishLevel() async {
    emit(CoursesState.finishedInitial());
    final response = await finishLevelRepo.finishLevel(FinishedLevelRuqest(
      course: seletCourseMe!.course!.id,
      level: selectedlevelMe!.id,
    ));
    response.when(success: (data) {
      emit(CoursesState.finishedSuccess(data.message!));
    }, failure: (error) {
      emit(CoursesState.finishedError(error: 'error'));
    });
  }

  void emitFinishLesson() async {
    emit(CoursesState.finishedLoading());
    final response = await finishLessonRepo.finishLesson(FinishLessonRuqest(
        course: seletCourseMe!.course!.id!, lesson: selectedlessonMe!.id!));
    response.when(success: (finishLessonResponse) {
      emit(CoursesState.finishedSuccess(finishLessonResponse.message!));
    }, failure: (error) {
      emit(CoursesState.finishedError(error: error.errorMessage));
    });
  }

  void emitFinishCourse() async {
    emit(CoursesState.finishedLoading());
    final response = await finishCourseRepo
        .finishCourses(FinishCourseRuqest(course: seletCourseMe!.course!.id));
    response.when(success: (data) {
      emit(CoursesState.finishedSuccess(data.message!));
    }, failure: (error) {
      emit(CoursesState.finishedError(error: error.errorMessage));
    });
  }

  void emitSouliontest(TestMe test) async {
    emit(CoursesState.soulionTestLoading());
    dd(test);
    final response = await soulionQuationRepo.soulionQuation(qq);
    response.when(success: (data) {
      emit(CoursesState.soulionTestSuccess(data));
    }, failure: (error) {
      emit(CoursesState.soulionTestError(error: error.errorMessage));
    });
  }

  void selectCourseMe(CourseMeWrapper course) {
    seletCourseMe = course;
    emit(CoursesState.courseSelectedMe(course));
  }

  void selectLevelMe(LevelMe level) {
    selectedlevelMe = level;
    emit(CoursesState.levelSelectedMe(level));
  }

  void selectLessonMe(LessonMe lesson) {
    selectedlessonMe = lesson;
    emit(CoursesState.lessonSelectedMe(lesson));
  }

  void dd(TestMe test) async {
    int id = await SharedPrefHelper.getInt('id');
    for (int i = 0; i < 10; i++) {
      qq.add(QautionRuqest(
        quiz: test.id,
        selected_answer: responseUser2[i],
        question: test.questions![i].id,
        student: id,
      ));
    }
  }
}
