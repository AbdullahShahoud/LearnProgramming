import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_programtion/features/notification/logic/model/notification_question_response.dart';
import 'package:learn_programtion/features/notification/logic/repo/notification_repo_quation.dart';
import 'package:learn_programtion/features/profile/logic/profile_cubit/cubit/profile_and_notification_state.dart';
import '../../../../books/logic/model/book_response.dart';
import '../../../../books/logic/repo/book_repo.dart';
import '../../../../notification/logic/model/notification_response.dart';
import '../../../../notification/logic/repo/notification_repo.dart';
import '../../model/changEmail/chang_email_request.dart';
import '../../model/changePassord/chang_password_request.dart';
import '../../repo/change_email_repo.dart';
import '../../repo/change_password_repo.dart';
import '../../repo/delet_repo.dart';
import '../../repo/information_repo.dart';
import '../../repo/view_grade_repo.dart';

class ProfileAndNotificationCubit extends Cubit<ProfileAndNotificationState> {
  ProfileAndNotificationCubit(
      this.profileRepoPassword,
      this.changeEmailRepo,
      this.notificationRepoQuation,
      this.deletRepo,
      this.viewGradeRepo,
      this.bookRepo,
      this.userIformationRepo,
      this.notificationRepo)
      : super(ProfileAndNotificationState.initial());
  static ProfileAndNotificationCubit get(context) => BlocProvider.of(context);
  BookRepo bookRepo;
  NotificationRepo notificationRepo;
  NotificationRepoQuation notificationRepoQuation;
  DeletRepo deletRepo;
  List<Book> book = [];
  List<NotificationAlertItem> notification = [];
  List<QuestionAndResponse> questionAndResponse = [];
  void emitBook() async {
    emit(ProfileAndNotificationState.loadingBook());
    final response = await bookRepo.getBook();
    response.when(
      success: (bookResponse) {
        book.addAll(bookResponse);
        print(book.length);
        emit(ProfileAndNotificationState.successBook(book));
      },
      failure: (errorHandler) {
        emit(ProfileAndNotificationState.errorBook(
            error: errorHandler.errorData));
      },
    );
  }

  void emitNotificationAlert() async {
    emit(ProfileAndNotificationState.loadingNotificationNormal());
    final response = await notificationRepo.getNotification();
    response.whenOrNull(
      success: (notificationRepo) {
        notification = notificationRepo;
        emit(ProfileAndNotificationState.successNotificationNormal(
            notification));
      },
      failure: (errorHandler) {
        emit(ProfileAndNotificationState.errorNotificationNormal(
            error: errorHandler.errorData));
      },
    );
  }

  void emitNotificationQuation() async {
    emit(ProfileAndNotificationState.loadingNotificationQuation());
    final response = await notificationRepoQuation.getNotification();
    response.whenOrNull(
      success: (Repo) {
        questionAndResponse = Repo;
        emit(ProfileAndNotificationState.successNotificationQuation(
            questionAndResponse));
      },
      failure: (errorHandler) {
        emit(ProfileAndNotificationState.errorNotificationQuation(
            error: errorHandler.errorData));
      },
    );
  }

  ProfileRepoPassword profileRepoPassword;
  var keysPassword = GlobalKey<FormState>();
  TextEditingController? controllerPassword = TextEditingController();
  TextEditingController? controllerPassword2 = TextEditingController();
  TextEditingController? controllerPassword3 = TextEditingController();
  List<String> grade = [];
  void emiteChangePassword() async {
    emit(ProfileAndNotificationState.loadingSecurite());
    final response = await profileRepoPassword.changePasseord(
        ChangePasswordRequest(
            old_password: controllerPassword?.text,
            new_password: controllerPassword2?.text));
    response.when(success: (data) {
      emit(ProfileAndNotificationState.successSecurite(data.message));
    }, failure: (error) {
      emit(ProfileAndNotificationState.errorSecurite(error: error.errorData));
    });
  }

  TextEditingController? controllerEmail = TextEditingController();
  TextEditingController? controllerName = TextEditingController();
  var keysEmailAndName = GlobalKey<FormState>();
  ChangeEmailRepo changeEmailRepo;
  void emiteChangeEmail() async {
    emit(ProfileAndNotificationState.loadingPersoinInformation());
    final response = await changeEmailRepo.changePasseord(ChangeEmailRequest(
        email: controllerEmail?.text, username: controllerName?.text));
    response.when(success: (data) {
      emit(ProfileAndNotificationState.successPersoinInformation(data));
    }, failure: (error) {
      emit(ProfileAndNotificationState.errorPersoinInformation(
          error: error.errorData));
    });
  }

  ViewGradeRepo viewGradeRepo;
  void emiteViewGrade() async {
    emit(ProfileAndNotificationState.loadingGrade());
    final response = await viewGradeRepo.getViewGrade();
    response.when(success: (data) {
      grade.addAll(data.completed_courses);
      emit(ProfileAndNotificationState.successGrade(grade));
    }, failure: (error) {
      emit(ProfileAndNotificationState.errorGrade(error: error.errorData));
    });
  }

  UserIformationRepo userIformationRepo;
  String? user_name;
  String? email;
  void emiteGetInformation() async {
    emit(ProfileAndNotificationState.loadingGetInformation());
    final response = await userIformationRepo.getInformation();
    response.when(success: (data) {
      emit(ProfileAndNotificationState.successGetInformation(data));
      user_name = data.username;
      email = data.email;
    }, failure: (error) {
      emit(ProfileAndNotificationState.errorGetInformation(
          error: error.errorData));
    });
  }

  void emiteDeletUser() async {
    emit(ProfileAndNotificationState.loadingDelete());
    final response = await deletRepo.delUser();
    response.when(success: (data) {
      emit(ProfileAndNotificationState.successDelete(''));
    }, failure: (error) {
      emit(ProfileAndNotificationState.errorDelete(error: error.errorData));
    });
  }
}
