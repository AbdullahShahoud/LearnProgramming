import 'package:learn_programtion/features/books/logic/model/book_response.dart';
import 'package:learn_programtion/features/courses/logic/model/courses_response.dart';
import 'package:learn_programtion/features/courses/logic/model/finish_lesson_ruqest.dart';
import 'package:retrofit/retrofit.dart';
import 'package:learn_programtion/core/network/api_constant.dart';
import 'package:dio/dio.dart';

import '../../features/courses/logic/model/checkCourser/check_course_response.dart';
import '../../features/courses/logic/model/checkCourser/check_course_ruqest.dart';
import '../../features/courses/logic/model/courses_me_response.dart';
import '../../features/courses/logic/model/finishCourser/finish_coures_ruqest.dart';
import '../../features/courses/logic/model/finishCourser/finish_course_response.dart';
import '../../features/courses/logic/model/finish_lesson_response.dart';
import '../../features/courses/logic/model/finish_test_request.dart';
import '../../features/courses/logic/model/finish_test_response.dart';
import '../../features/courses/logic/model/send_qaustion_request.dart';
import '../../features/courses/logic/model/send_qaustion_response.dart';
import '../../features/courses/logic/model/soulion_test_response.dart';
import '../../features/courses/logic/model/soulion_test_ruqest.dart';
import '../../features/login/forgetPassword/model/forget_confirm_ruqest.dart';
import '../../features/login/forgetPassword/model/forget_password_response.dart';
import '../../features/login/forgetPassword/model/forget_password_ruqest.dart';
import '../../features/login/logic/model/login_request.dart';
import '../../features/login/logic/model/login_response.dart';
import '../../features/login/otp/logic/model/otp_response.dart';
import '../../features/login/otp/logic/model/otp_ruqest.dart';
import '../../features/notification/logic/model/notification_question_response.dart';
import '../../features/notification/logic/model/notification_response.dart';
import '../../features/profile/logic/model/view_information_respones.dart';
import '../../features/profile/logic/model/changEmail/chang_email_request.dart';
import '../../features/profile/logic/model/changEmail/chang_email_response.dart';
import '../../features/profile/logic/model/changePassord/chang_password_request.dart';
import '../../features/profile/logic/model/changePassord/change_password_response.dart';
import '../../features/profile/logic/model/viewGrade/view_grade.dart';
import '../../features/singin/logic/model/singin_reqest.dart';
import '../../features/singin/logic/model/singin_response.dart';
import '../../features/teacher/addCourse/logic/model/add_coures_response.dart';
import '../../features/teacher/addCourse/logic/model/add_course_ruqest.dart';
import '../../features/teacher/addCourse/logic/model/add_lession_ruqest.dart';
import '../../features/teacher/addCourse/logic/model/add_level_response.dart';
import '../../features/teacher/addCourse/logic/model/add_level_ruqest.dart';
import '../../features/teacher/addCourse/logic/model/add_quation_ruqest.dart';
import '../../features/teacher/addCourse/logic/model/add_quations_response.dart';
import '../../features/teacher/addCourse/logic/model/add_response_lession.dart';
import '../../features/teacher/addCourse/logic/model/add_test_response.dart';
import '../../features/teacher/addCourse/logic/model/add_test_ruqest.dart';
import '../../features/teacher/courses/logic/model/courses_response.dart';
import '../../features/teacher/courses/logic/model/edit_Course_respponse.dart';
import '../../features/teacher/notifaction/logic/models/notification_quations_response.dart';
import '../../features/teacher/notifaction/logic/models/notification_response.dart';
import '../../features/teacher/notifaction/logic/models/qautions_request.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstant.BaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstant.Login)
  Future<LoginResponse> login(
    @Body() LoginRequest loginRequest,
  );

  @POST(ApiConstant.Signup)
  Future<SinginResponse> signup(
    @Body() SinginRequest signupRequest,
  );
  @POST(ApiConstant.verfify_email)
  Future<OtpResponseLogin> veifyEmailLogin(
    @Body() OtpRuqestLogin otpRuqestLogin,
  );

  @GET(ApiConstant.Book)
  Future<List<Book>> getBook();

  @GET(ApiConstant.NotificationsAlert)
  Future<List<NotificationAlertItem>> getNotificationAlert();

  @GET(ApiConstant.NotificationsQuation)
  Future<List<QuestionAndResponse>> getNotificationQuation();

  @PATCH(ApiConstant.ProfileChangeEmail)
  Future<ChangeEmailResponse> changeEmail(
    @Body() ChangeEmailRequest changeEmailRequest,
  );

  @PUT(ApiConstant.ProfileChangePassword)
  Future<ChangePasswordResponse> changePassword(
    @Body() ChangePasswordRequest changePasswordRequest,
  );

  @GET(ApiConstant.UserInformation)
  Future<UserInformation> getInformation();
  @GET(ApiConstant.ProfileViewGrade)
  Future<GradeRespons> getView();

  @GET(ApiConstant.Courses)
  Future<CourseListResponseStudent> getCourses();

  @GET(ApiConstant.CoursesMe)
  Future<CourseMeListResponse> getCoursesMe();

  @POST(ApiConstant.CheckCourse)
  Future<CheckCourseResponse> checkCourse(
    @Body() CheckCourseRuqest checkCourse,
  );

  @POST(ApiConstant.FinishCourse)
  Future<FinishCourseResponse> finishCourse(
    @Body() FinishCourseRuqest finishCourse,
  );

  @POST(ApiConstant.FinishLevel)
  Future<FinishLevelResponse> finishedLevel(
    @Body() FinishedLevelRuqest finishedTest,
  );

  @POST(ApiConstant.SendQaution)
  Future<SendQautionReesponse> sendQautions(
    @Body() SendQautionsRuqest sendQautions,
  );

  @POST(ApiConstant.FinishLeson)
  Future<FinishLessonResponse> finishLesson(
    @Body() FinishLessonRuqest sendQautions,
  );

  @POST(ApiConstant.DeletUesr)
  Future<void> deletUser();

  @POST(ApiConstant.PasswordReset)
  Future<ForgetPasswordResponse> passwordReset(
    @Body() FoargetPasswordRuqest foargetPasswordRuqest,
  );

  @POST(ApiConstant.PasswordResetConfirm)
  Future<ForgetPasswordResponse> passwordResetConfirm(
    @Body() ForgatePasswordConfirmRquest forgatePasswordConfirmRquest,
  );
   @POST(ApiConstant.SoulionQuations)
  Future<SoulionResponse> soulionQuations(
    @Body() List<QautionRuqest> qautionRuqest,
  );
  // ************************************************************************************************************
  @GET(ApiConstant.notificationTeacher)
  Future<List<NotificationResponse>> getNotificationTeacher();
  @GET(ApiConstant.notificationTeacherQuations)
  Future<List<NotificationQuationsResponse>> getNotificationTeacherQuations();
  @GET(ApiConstant.coursesTeacher)
  Future<CourseListResponse> getCoursesTeacher();
  @POST(ApiConstant.notificationTeacherQuations)
  Future<void> sendQuationsTeacher(@Body() QuationsRequest quationsRequest);

  @PUT('${ApiConstant.eidtCourses}{course}/')
  Future<CourseResponse> editCourses(
      @Body() AddCourseRuqest addCourseRuqest, @Path('course') String course);
  @POST(ApiConstant.addCourse)
  Future<AddCourseResponse> addCourses(
    @Body() AddCourseRuqest addCourseRuqest,
  );
  @POST(ApiConstant.addLevel)
  Future<AddLevelResponse> addLevel(
    @Body() AddLevelRuqest addLevelRuqest,
  );
  @PUT('${ApiConstant.eidtLevel}{level}/')
  Future<CourseResponse> editLevel(
      @Body() AddLevelRuqest addLevelRuqest, @Path('level') String level);
  @POST(ApiConstant.addLesssion)
  Future<AddLessionResponse> addLession(
    @Body() AddLessionRuqest addLessionRuqest,
  );
  @PUT('${ApiConstant.eidtLession}{lession}/')
  Future<CourseResponse> editLession(@Body() AddLessionRuqest addLessionRuqest,
      @Path('lession') String lession);

  @POST(ApiConstant.addTest)
  Future<AddTestResponse> addTest(
    @Body() AddTestRuqest addTestRuqest,
  );
  @POST(ApiConstant.addQuation)
  Future<AddQuationResponse> addQuations(
    @Body() List<QuationRuqest> quationRuqest,
  );
  @PUT('${ApiConstant.eidQuation}{quation}/')
  Future<CourseResponse> editQuations(
      @Body() QuationRuqest quationRuqest, @Path('quation') String quation);

  @DELETE('${ApiConstant.eidtCourses}{course}/')
  Future<void> deletCourse(
     @Path('course') String course,
  );
  @DELETE('${ApiConstant.eidtLevel}{level}/')
  Future<void> deletLevel(
     @Path('level') String level
  );
  @DELETE('${ApiConstant.eidtLession}{lession}/')
  Future<void> deletLession(
      @Path('lession') String lession,
  );

}
