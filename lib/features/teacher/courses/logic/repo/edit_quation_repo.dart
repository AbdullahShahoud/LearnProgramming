import 'package:dio/dio.dart';
import 'package:learn_programtion/core/network/api_error_handler.dart';
import 'package:learn_programtion/core/network/api_result.dart';
import 'package:learn_programtion/core/network/api_service.dart';
import 'package:learn_programtion/features/teacher/addCourse/logic/model/add_quation_ruqest.dart';

import '../model/edit_Course_respponse.dart';

class EidtQuationRepo {
  ApiService _apiService;
  EidtQuationRepo(this._apiService);
  Future<ApiResult<CourseResponse>> editQuation(
      QuationRuqest quationRuqest, String qautions) async {
    try {
      final response = await _apiService.editQuations(quationRuqest, qautions);
      return ApiResult.success(response);
    } on DioError catch (error) {
      return ApiResult.failure(ApiErrorHandler.fromDioError(error));
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.fromGenericError(error));
    }
  }
}
