import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_programtion/features/teacher/courses/logic/repo/edit_quation_repo.dart';
import '../../../../../../core/helper/sherdPrefernce.dart';
import '../../../../addCourse/logic/model/add_course_ruqest.dart';
import '../../../../addCourse/logic/model/add_lession_ruqest.dart';
import '../../../../addCourse/logic/model/add_level_ruqest.dart';
import '../../../../addCourse/logic/model/add_quation_ruqest.dart';
import '../../../../addCourse/logic/repo/add_course_repo.dart';
import '../../../../addCourse/logic/repo/add_lession_repo.dart';
import '../../../../addCourse/logic/repo/add_level_repo.dart';
import '../../../../addCourse/logic/repo/add_quation_repo.dart';
import '../../../../addCourse/logic/repo/add_test_repo.dart';
import '../../../Ui/widget/courses_bloc_listener.dart';
import '../../model/courses_response.dart';
import '../../repo/courses_repo.dart';
import '../../repo/edit_course_repo.dart';
import '../../repo/edit_lession_repo.dart';
import '../../repo/edit_level_repo.dart';
import 'courser_cubit_state.dart';

class CourserCubitTeacher extends Cubit<CourserCubitTeacherState> {
  CourserCubitTeacher(
      this.coursesTeacherRepo,
      this.eidetCourseRepo,
      this.eidtLessionTeacherRepo,
      this.eidtLevelTeacherRepo,
      this.eidtQuationRepo,
      this.addCoursesTeacherRepo,
      this.addLessionTeacherRepo,
      this.addLevelTeacherRepo,
      this.addTestRepo,
      this.addQuationRepo)
      : super(CourserCubitTeacherState.initialCourses());
  static CourserCubitTeacher get(context) => BlocProvider.of(context);
  CoursesTeacherRepo coursesTeacherRepo;
  AddCoursesTeacherRepo addCoursesTeacherRepo;
  AddLessionTeacherRepo addLessionTeacherRepo;
  AddLevelTeacherRepo addLevelTeacherRepo;
  AddQuationRepo addQuationRepo;
  AddTestRepo addTestRepo;
  EidetCourseRepo eidetCourseRepo;
  EidtLessionTeacherRepo eidtLessionTeacherRepo;
  EidtLevelTeacherRepo eidtLevelTeacherRepo;
  EidtQuationRepo eidtQuationRepo;
  List<CoursesResponseTc>? CoursesTeacher = getSampleCourses;
  CoursesResponseTc? selectedcorse;
  Levels? selectedlevel;
  Lessons? selectedlesson;

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controllerDescripLession = TextEditingController();
  TextEditingController controllerNameLession = TextEditingController();
  TextEditingController controllerLinkLession = TextEditingController();
  var keye = GlobalKey<FormState>();

  TextEditingController controllerimage = TextEditingController();
  TextEditingController controllername = TextEditingController();

  TextEditingController controllerdescription = TextEditingController();
  TextEditingController controllertime = TextEditingController();

  TextEditingController controllerAddQuation = TextEditingController();
  TextEditingController controllerAddResponseOne = TextEditingController();
  TextEditingController controllerAddResponseTwo = TextEditingController();
  TextEditingController controllerAddResponseThree = TextEditingController();
  TextEditingController controllerAddResponseCorrect = TextEditingController();
  var keyeTest = GlobalKey<FormState>();

  int? course;
  int? finals;
  List<int> level = [];
  List<int> quiz = [];
  List<int> lession = [];
  int? select;
  int? selectTest;
  List<QuationRuqest> quations = [];
  void emitCoursesTeacher() async {
    emit(CourserCubitTeacherState.loadinCourses());
    final response = await coursesTeacherRepo.getCoursesTeacher();
    response.whenOrNull(
      success: (coursesRepo) {
        CoursesTeacher = getSampleCourses;
        emit(CourserCubitTeacherState.successCourses(CoursesTeacher));
      },
      failure: (errorHandler) {
        emit(CourserCubitTeacherState.errorCourses(
            error: errorHandler.errorMessage));
      },
    );
  }

  void emitAddCoursesTeacher(String type, int number) async {
    emit(CourserCubitTeacherState.loadinCoursesAdd());
    final response = await addCoursesTeacherRepo.addCoursesTeacher(
        AddCourseRuqest(
            name: controllername.text,
            image: controllerimage.text,
            time: int.parse(controllertime.text),
            descrip: controllerdescription.text,
            type: type,
            num_of_level: number,
            teacher: SharedPrefHelper.getInt('id'),
            nameTeacher: SharedPrefHelper.getString('userName')));
    response.whenOrNull(
      success: (coursesRepo) {
        emit(CourserCubitTeacherState.successCoursesAdd(coursesRepo.message));
        course = coursesRepo.course;
        finals = coursesRepo.finals;
      },
      failure: (errorHandler) {
        emit(CourserCubitTeacherState.errorCoursesAdd(
            error: errorHandler.errorMessage));
      },
    );
  }

  void emitAddLevelTeacher() async {
    emit(CourserCubitTeacherState.loadinLevelAdd());
    final response = await addLevelTeacherRepo.addLevelTeacher(AddLevelRuqest(
        name: controller3.text,
        num_of_lesson: int.parse(controller4.text),
        teacher: SharedPrefHelper.getInt('id'),
        course: course));
    response.whenOrNull(
      success: (coursesRepo) {
        lession.add(int.parse(controller4.text));
        level.add(coursesRepo.level!);
        quiz.add(coursesRepo.quiz!);
        quiz.add(finals!);
        emit(CourserCubitTeacherState.successLevelAdd(coursesRepo.message));
      },
      failure: (errorHandler) {
        emit(CourserCubitTeacherState.errorLevelAdd(
            error: errorHandler.errorMessage));
      },
    );
  }

  void emitAddLessionTeacher() async {
    emit(CourserCubitTeacherState.loadinLessionAdd());
    final response = await addLessionTeacherRepo.addLessionTeacher(
        AddLessionRuqest(
            teacher: SharedPrefHelper.getInt('id'),
            name: controllerNameLession.text,
            video: controllerLinkLession.text,
            description: controllerDescripLession.text,
            course: course,
            level: select));
    response.whenOrNull(
      success: (coursesRepo) {
        emit(CourserCubitTeacherState.successLessionAdd(coursesRepo.message));
      },
      failure: (errorHandler) {
        emit(CourserCubitTeacherState.errorLessionAdd(
            error: errorHandler.errorMessage));
      },
    );
  }

  void addQuarions() {
    quations.add(QuationRuqest(
        question: controllerAddQuation.text,
        a: controllerAddResponseOne.text,
        b: controllerAddResponseTwo.text,
        c: controllerAddResponseThree.text,
        correct_choice: controllerAddResponseCorrect.text,
        quiz: selectTest,
        course: course));
  }

  void emitAddQuationsTeacher() async {
    emit(CourserCubitTeacherState.loadinTestAdd());
    final response = await addQuationRepo.addQuation(quations);
    response.whenOrNull(
      success: (coursesRepo) {
        emit(CourserCubitTeacherState.successTestAdd(coursesRepo.message));
      },
      failure: (errorHandler) {
        emit(CourserCubitTeacherState.errorTestAdd(
            error: errorHandler.errorMessage));
      },
    );
  }
}
