import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:learn_programtion/core/network/api_service.dart';
import 'package:learn_programtion/features/books/logic/repo/book_repo.dart';
import 'package:learn_programtion/features/courses/logic/repo/check_course_repo.dart';
import 'package:learn_programtion/features/courses/logic/repo/courser_me_repo.dart';
import 'package:learn_programtion/features/courses/logic/repo/courses_repo.dart';
import 'package:learn_programtion/features/courses/logic/repo/delet_course_repo.dart';
import 'package:learn_programtion/features/courses/logic/repo/finish_course_repo.dart';
import 'package:learn_programtion/features/courses/logic/repo/finish_lesson_repo.dart';
import 'package:learn_programtion/features/courses/logic/repo/finish_test_repo.dart';
import 'package:learn_programtion/features/courses/logic/repo/send_quation_repo.dart';
import 'package:learn_programtion/features/login/forgetPassword/repo/forget_confirm.dart';
import 'package:learn_programtion/features/login/logic/cubit/login_cubit.dart';
import 'package:learn_programtion/features/login/logic/repo/login_repo.dart';
import 'package:learn_programtion/features/login/otp/logic/repo/otp_repo.dart';
import 'package:learn_programtion/features/notification/logic/repo/notification_repo.dart';
import 'package:learn_programtion/features/notification/logic/repo/notification_repo_quation.dart';
import 'package:learn_programtion/features/singin/logic/cubit/singin_cubit.dart';
import 'package:learn_programtion/features/singin/logic/repo/singin_repo.dart';

import '../../features/login/forgetPassword/repo/forget_repo.dart';
import '../../features/profile/logic/repo/information_repo.dart';
import '../../features/profile/logic/profile_cubit/cubit/profile_and_notification_cubit.dart';
import '../../features/profile/logic/repo/change_email_repo.dart';
import '../../features/profile/logic/repo/change_password_repo.dart';
import '../../features/profile/logic/repo/delet_repo.dart';
import '../../features/profile/logic/repo/view_grade_repo.dart';
import '../../features/teacher/addCourse/logic/repo/add_course_repo.dart';
import '../../features/teacher/addCourse/logic/repo/add_lession_repo.dart';
import '../../features/teacher/addCourse/logic/repo/add_level_repo.dart';
import '../../features/teacher/addCourse/logic/repo/add_quation_repo.dart';
import '../../features/teacher/addCourse/logic/repo/add_test_repo.dart';
import '../../features/teacher/courses/logic/courses_cubit/cubit/courser_cubit_cubit.dart';
import '../../features/teacher/courses/logic/repo/courses_repo.dart';
import '../../features/teacher/courses/logic/repo/edit_course_repo.dart';
import '../../features/teacher/courses/logic/repo/edit_lession_repo.dart';
import '../../features/teacher/courses/logic/repo/edit_level_repo.dart';
import '../../features/teacher/courses/logic/repo/edit_quation_repo.dart';
import '../../features/teacher/notifaction/logic/cubit/notification_teacher_cubit_cubit.dart';
import '../../features/teacher/notifaction/logic/repo/notification_quations_repo.dart';
import '../../features/teacher/notifaction/logic/repo/notification_repo.dart';
import '../../features/teacher/notifaction/logic/repo/send_quations_repo.dart';
import '../network/dio.dart';

final getIt = GetIt.instance;
Future<void> setupGetIt() async {
  Dio dio = await DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(
      () => LoginCubit(getIt(), getIt(), getIt(), getIt()));

  getIt.registerLazySingleton<SinginRepo>(() => SinginRepo(getIt()));
  getIt.registerFactory<SinginCubit>(() => SinginCubit(getIt()));

  getIt.registerLazySingleton<OtpRepoLogin>(() => OtpRepoLogin(getIt()));
  getIt
      .registerLazySingleton<NotificationRepo>(() => NotificationRepo(getIt()));

  getIt.registerLazySingleton<NotificationRepoQuation>(
      () => NotificationRepoQuation(getIt()));

  getIt.registerLazySingleton<BookRepo>(() => BookRepo(getIt()));

  getIt.registerLazySingleton<ChangeEmailRepo>(() => ChangeEmailRepo(getIt()));
  getIt.registerLazySingleton<ProfileRepoPassword>(
      () => ProfileRepoPassword(getIt()));
  getIt.registerLazySingleton<ViewGradeRepo>(() => ViewGradeRepo(getIt()));
  getIt.registerFactory<ProfileAndNotificationCubit>(() =>
      ProfileAndNotificationCubit(getIt(), getIt(), getIt(), getIt(), getIt(),
          getIt(), getIt(), getIt()));

  getIt.registerLazySingleton<UserIformationRepo>(
      () => UserIformationRepo(getIt()));
  getIt.registerLazySingleton<CoursesRepo>(() => CoursesRepo(getIt()));
  getIt.registerLazySingleton<CoursesMeRepo>(() => CoursesMeRepo(getIt()));
  getIt.registerLazySingleton<CheckCourseRepo>(() => CheckCourseRepo(getIt()));
  getIt
      .registerLazySingleton<SendQuationsRepo>(() => SendQuationsRepo(getIt()));
  getIt.registerLazySingleton<FinishTestRepo>(() => FinishTestRepo(getIt()));
  getIt
      .registerLazySingleton<FinishLessonRepo>(() => FinishLessonRepo(getIt()));
  getIt
      .registerLazySingleton<FinishCourseRepo>(() => FinishCourseRepo(getIt()));
  getIt
      .registerLazySingleton<DeletCoursenRepo>(() => DeletCoursenRepo(getIt()));
  getIt.registerLazySingleton<DeletRepo>(() => DeletRepo(getIt()));
  getIt.registerLazySingleton<NotificationRepoTeacher>(
      () => NotificationRepoTeacher(getIt()));
  getIt.registerLazySingleton<NotificationQautionsRepoTeacher>(
      () => NotificationQautionsRepoTeacher(getIt()));
  getIt
      .registerFactory<NotificationTeacherCubit>(() => NotificationTeacherCubit(
            notificationRepoTeacher: getIt(),
            notificationQautionsRepoTeacher: getIt(),
            sendQuationsRepo: getIt(),
          ));

  getIt.registerFactory<CourserCubitTeacher>(() => CourserCubitTeacher(
        getIt(),
        getIt(),
        getIt(),
        getIt(),
        getIt(),
        getIt(),
        getIt(),
        getIt(),
        getIt(),
        getIt(),
      ));

  getIt.registerLazySingleton<SendQuationsRepoTC>(
      () => SendQuationsRepoTC(getIt()));
  getIt.registerLazySingleton<ForgetConfirmeRepo>(
      () => ForgetConfirmeRepo(getIt()));
  getIt.registerLazySingleton<ForgetRepo>(() => ForgetRepo(getIt()));

  getIt.registerLazySingleton<AddLessionTeacherRepo>(
      () => AddLessionTeacherRepo(getIt()));
  getIt.registerLazySingleton<AddLevelTeacherRepo>(
      () => AddLevelTeacherRepo(getIt()));
  getIt.registerLazySingleton<AddCoursesTeacherRepo>(
      () => AddCoursesTeacherRepo(getIt()));
  getIt.registerLazySingleton<CoursesTeacherRepo>(
      () => CoursesTeacherRepo(getIt()));
  getIt.registerLazySingleton<AddTestRepo>(() => AddTestRepo(getIt()));
  getIt.registerLazySingleton<EidetCourseRepo>(() => EidetCourseRepo(getIt()));
  getIt.registerLazySingleton<EidtLessionTeacherRepo>(
      () => EidtLessionTeacherRepo(getIt()));
  getIt.registerLazySingleton<EidtLevelTeacherRepo>(
      () => EidtLevelTeacherRepo(getIt()));
  getIt.registerLazySingleton<EidtQuationRepo>(() => EidtQuationRepo(getIt()));
  getIt.registerLazySingleton<AddQuationRepo>(() => AddQuationRepo(getIt()));
}
