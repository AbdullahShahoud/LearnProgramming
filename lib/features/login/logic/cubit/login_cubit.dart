import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_programtion/features/login/logic/cubit/login_stare.dart';
import 'package:learn_programtion/features/login/logic/model/login_request.dart';
import 'package:learn_programtion/features/login/logic/repo/login_repo.dart';
import 'package:learn_programtion/features/login/otp/logic/model/otp_ruqest.dart';
import 'package:learn_programtion/features/login/otp/logic/repo/otp_repo.dart';
import '../../../../core/helper/sherdPrefernce.dart';
import '../../forgetPassword/model/forget_confirm_ruqest.dart';
import '../../forgetPassword/model/forget_password_ruqest.dart';
import '../../forgetPassword/repo/forget_confirm.dart';
import '../../forgetPassword/repo/forget_repo.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepo, this.otpRepoLogin, this.forgetConfirmeRepo,
      this.forgetRepo)
      : super(const LoginState.initial());
  LoginRepo _loginRepo;
  static LoginCubit get(context) => BlocProvider.of(context);
  TextEditingController? controllerEmail = TextEditingController();
  TextEditingController? controllerPassword = TextEditingController();
  TextEditingController? controllerPasswordReset = TextEditingController();
  TextEditingController? controllerPasswordConfirme = TextEditingController();
  TextEditingController? controllerPasswordToken = TextEditingController();
  var key = GlobalKey<FormState>();

  TextEditingController? controllerEmailChangePassword =
      TextEditingController();
  OtpRepoLogin otpRepoLogin;
  ForgetConfirmeRepo forgetConfirmeRepo;
  ForgetRepo forgetRepo;
  String? otpLogin;
  var keyChangePassword = GlobalKey<FormState>();
  bool obscure = true;
  void cnangeObscure(bool value) {
    obscure = !value;
  }

  String? type_user;
  void emitLogin() async {
    emit(LoginState.loading());
    final response = await _loginRepo.login(LoginRequest(
        email: controllerEmail?.text, password: controllerPassword?.text));

    response.when(success: (loginResponse) async {
      emit(LoginState.success(loginResponse));
      await SharedPrefHelper.setData('token', loginResponse.token ?? '');
    }, failure: (error) async {
      if (error is DioError && error.errorData?.statusCode == 403) {
        try {
          final responseData = error.errorData?.data;
          await SharedPrefHelper.setData('token', error.errorData.token ?? '');
          emit(LoginState.error(error: responseData));
        } catch (e) {
          emit(LoginState.error(error: "خطأ في معالجة الاستجابة"));
        }
      } else {
        emit(LoginState.error(error: error.toString()));
      }
    });
  }

  void emitOtpLogin() async {
    emit(LoginState.loadingOtp());
    final respons =
        await otpRepoLogin.verifLogin(OtpRuqestLogin(otp_code: otpLogin));
    respons.when(
      success: (otpRespon) {
        emit(LoginState.successOtp(otpRespon));
      },
      failure: (errorHandler) {
        print('❌ Error: ottttttpLoignnnnn');
        emit(LoginState.errorOtp(error: 'nototp'));
      },
    );
  }

  void emitForget() async {
    emit(LoginState.loadingForget());
    final respons = await forgetRepo
        .forget(FoargetPasswordRuqest(email: controllerPasswordReset!.text));
    respons.when(
      success: (forgetRespon) {
        emit(LoginState.successForget(forgetRespon));
      },
      failure: (errorHandler) {
        print('❌ Error: forrrrrrrrrrrrrgetLoignnnnn');
        emit(LoginState.errorForget(error: 'noforget'));
      },
    );
  }

  void emitForgetConfirm() async {
    emit(LoginState.loadingForgetConfirme());
    final respons = await forgetConfirmeRepo.forgetConfirme(
        ForgatePasswordConfirmRquest(
            password: int.parse(controllerPasswordConfirme!.text),
            token: int.parse(controllerPasswordToken!.text)));
    respons.when(
      success: (forgetRespon) {
        emit(LoginState.successForgetConfirme(forgetRespon));
      },
      failure: (errorHandler) {
        print('❌ Error: forrrrrrrrrrrrrgetLoignnnnn');
        emit(LoginState.errorForgetConfirme(error: 'noforget'));
      },
    );
  }
}
