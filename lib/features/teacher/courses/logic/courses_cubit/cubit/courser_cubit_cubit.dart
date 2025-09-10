// ignore_for_file: non_constant_identifier_names, unnecessary_null_comparison

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
import '../../model/courses_response.dart';
import '../../repo/courses_repo.dart';
import '../../repo/delet_course.dart';
import '../../repo/delet_lession.dart';
import '../../repo/delet_level.dart';
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
      this.deletCourseRepo,
      this.deleteLevelTeacherRepo,
      this.deleteLessionTeacherRepo,
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
  DeletCourseRepo deletCourseRepo;
  DeleteLessionTeacherRepo deleteLessionTeacherRepo;
  DeleteLevelTeacherRepo deleteLevelTeacherRepo;
//#########################################################################################
  List<CoursesResponseTc>? CoursesTeacher;
  CoursesResponseTc? selectedcorse;
  Levels? selectedlevel;
  Lessons? selectedlesson;
  Tests? finalTest;
  int? selectQuations;
  int? course;
  int? finals;
  List<int> level = [];
  List<int> quiz = [];
  List<int> lession = [];
  int? select;
  int? selectTest;
  int? selectQuiz;
  List<QuationRuqest> quations = [];

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

  TextEditingController? controllereditcoursename;
  TextEditingController? controllereditcoursedescrip;
  TextEditingController? controllereditcourseLink;
  TextEditingController? controllereditcoursetime;
  var keyeEditCourse = GlobalKey<FormState>();

  TextEditingController? controllereditLevelName;
  TextEditingController? controllereditLevelNumber;

  TextEditingController? controllerEditeDescripLession;
  TextEditingController? controllerEditeNameLession;
  TextEditingController? controllerEditeLinkLession;

  TextEditingController? controllerEidteQuation;
  TextEditingController? controllerEidteResponseOne;
  TextEditingController? controllerEidteResponseTwo;
  TextEditingController? controllerEidteResponseThree;
  TextEditingController? controllerEidteResponseCorrect;
  var keyeEidteTest = GlobalKey<FormState>();

  void emitCoursesTeacher() async {
    emit(CourserCubitTeacherState.loadinCourses());

    final response = await coursesTeacherRepo.getCoursesTeacher();

    response.when(
      success: (coursesRepo) {
        CoursesTeacher = coursesRepo.courseResponse;
        emit(CourserCubitTeacherState.successCourses(CoursesTeacher!));
      },
      failure: (errorHandler) {
        emit(CourserCubitTeacherState.errorCourses(
            error: errorHandler.errorMessage));
      },
    );
  }

  void emitAddCoursesTeacher(String type, int number) async {
    var id = await SharedPrefHelper.getInt('id');
    var user = await SharedPrefHelper.getString('userName');
    emit(CourserCubitTeacherState.loadinCoursesAdd());
    final response = await addCoursesTeacherRepo.addCoursesTeacher(
        AddCourseRuqest(
            name: controllername.text,
            image: controllerimage.text,
            time: int.parse(controllertime.text),
            descrip: controllerdescription.text,
            type: "CORE_LANG",
            num_of_level: number,
            teacher: id,
            nameTeacher: user));
    response.whenOrNull(
      success: (coursesRepo) {
        emit(CourserCubitTeacherState.successCoursesAdd(coursesRepo.message));
        course = coursesRepo.course;
        finals = coursesRepo.final_id;
      },
      failure: (errorHandler) {
        emit(CourserCubitTeacherState.errorCoursesAdd(
            error: errorHandler.errorMessage));
      },
    );
  }

  void emitAddLevelTeacher() async {
    emit(CourserCubitTeacherState.loadinLevelAdd());
    var id = await SharedPrefHelper.getInt('id');
    final response = await addLevelTeacherRepo.addLevelTeacher(AddLevelRuqest(
        name: controller3.text,
        num_of_lesson: int.parse(controller4.text),
        teacher: id,
        course: course));
    response.whenOrNull(
      success: (coursesRepo) {
        lession.add(int.parse(controller4.text));
        level.add(coursesRepo.level!);
        quiz.add(coursesRepo.quiz!);
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
    var id = await SharedPrefHelper.getInt('id');
    final response = await addLessionTeacherRepo.addLessionTeacher(
        AddLessionRuqest(
            teacher: id,
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

  void emitEditCoursesTeacher(String type, int number) async {
    var id = await SharedPrefHelper.getInt('id');
    var user = await SharedPrefHelper.getString('userName');
    emit(CourserCubitTeacherState.loadinCoursesEdit());
    final response = await eidetCourseRepo.eidtCourse(
        AddCourseRuqest(
            name: controllereditcoursename!.text,
            image: controllereditcourseLink!.text,
            time: int.parse(controllereditcoursetime!.text),
            descrip: controllereditcoursedescrip!.text,
            type: "CORE_LANG",
            num_of_level: number,
            teacher: id,
            nameTeacher: user),
        '${selectedcorse!.id}');
    response.whenOrNull(
      success: (coursesRepo) {
        emit(CourserCubitTeacherState.successCoursesEdit(coursesRepo.message));
      },
      failure: (errorHandler) {
        emit(CourserCubitTeacherState.errorCoursesEdit(
            error: errorHandler.errorMessage));
      },
    );
  }

  void emitEditLevelTeacher() async {
    emit(CourserCubitTeacherState.loadinLevelEdit());
    var id = await SharedPrefHelper.getInt('id');
    final response = await eidtLevelTeacherRepo.eidtLevelTeacher(
        AddLevelRuqest(
            name: controllereditLevelName!.text,
            num_of_lesson: int.parse(controllereditLevelNumber!.text),
            teacher: id,
            course: selectedcorse!.id),
        '${selectedlevel!.id}');
    response.whenOrNull(
      success: (coursesRepo) {
        emit(CourserCubitTeacherState.successLevelEdit(coursesRepo.message));
      },
      failure: (errorHandler) {
        emit(CourserCubitTeacherState.errorLevelEdit(
            error: errorHandler.errorMessage));
      },
    );
  }

  void emitEidteLessionTeacher() async {
    emit(CourserCubitTeacherState.loadinLessionEdit());
    var id = await SharedPrefHelper.getInt('id');
    final response = await eidtLessionTeacherRepo.eidtLessionTeacher(
        AddLessionRuqest(
            teacher: id,
            name: controllerEditeNameLession!.text,
            video: controllerEditeLinkLession!.text,
            description: controllerEditeDescripLession!.text,
            course: selectedcorse!.id,
            level: selectedlevel!.id),
        selectedlesson!.id.toString());
    response.whenOrNull(
      success: (coursesRepo) {
        emit(CourserCubitTeacherState.successLessionEdit(coursesRepo.message));
      },
      failure: (errorHandler) {
        emit(CourserCubitTeacherState.errorLessionEdit(
            error: errorHandler.errorMessage));
      },
    );
  }

  void emitEidteQuationsTeacher(int id) async {
    emit(CourserCubitTeacherState.loadinTestEdit());
    final response = await eidtQuationRepo.editQuation(
        QuationRuqest(
          a: controllerEidteResponseOne!.text,
          b: controllerEidteResponseTwo!.text,
          c: controllerEidteResponseThree!.text,
          question: controllerEidteQuation!.text,
          correct_choice: controllerEidteResponseCorrect!.text,
          quiz: id,
          course: selectedcorse!.id,
        ),
        selectQuations.toString());
    response.whenOrNull(
      success: (coursesRepo) {
        emit(CourserCubitTeacherState.successTestEdit(coursesRepo.message));
      },
      failure: (errorHandler) {
        emit(CourserCubitTeacherState.errorTestEdit(
            error: errorHandler.errorMessage));
      },
    );
  }

  void emitDeleteCoursesTeacher() async {
    emit(CourserCubitTeacherState.loadinCoursesDelet());
    final response = await deletCourseRepo.deletCourse('${selectedcorse!.id}');
    response.whenOrNull(
      success: (coursesRepo) {
        emit(CourserCubitTeacherState.successCoursesDelet(' '));
      },
      failure: (errorHandler) {
        emit(CourserCubitTeacherState.errorCoursesDelet(
            error: errorHandler.errorMessage));
      },
    );
  }

  void emitDeleteLevelTeacher() async {
    emit(CourserCubitTeacherState.loadinLevelDelet());
    final response =
        await deleteLevelTeacherRepo.deletLevelTeacher('${selectedlevel!.id}');
    response.whenOrNull(
      success: (coursesRepo) {
        emit(CourserCubitTeacherState.successLevelDelet(''));
      },
      failure: (errorHandler) {
        emit(CourserCubitTeacherState.errorLevelDelet(
            error: errorHandler.errorMessage));
      },
    );
  }

  void emitDeleteLessionTeacher() async {
    emit(CourserCubitTeacherState.loadinLessionDelet());
    final response = await deleteLessionTeacherRepo
        .deletLessionTeacher(selectedlesson!.id.toString());
    response.whenOrNull(
      success: (coursesRepo) {
        emit(CourserCubitTeacherState.successLessionDelet(''));
      },
      failure: (errorHandler) {
        emit(CourserCubitTeacherState.errorLessionDelet(
            error: errorHandler.errorMessage));
      },
    );
  }
}
