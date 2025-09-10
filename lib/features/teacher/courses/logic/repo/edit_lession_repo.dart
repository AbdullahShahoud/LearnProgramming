import 'package:dio/dio.dart';
import 'package:learn_programtion/core/network/api_error_handler.dart';
import 'package:learn_programtion/core/network/api_result.dart';
import 'package:learn_programtion/core/network/api_service.dart';

import '../../../addCourse/logic/model/add_lession_ruqest.dart';
import '../model/edit_Course_respponse.dart';

class EidtLessionTeacherRepo {
  ApiService _apiService;
  EidtLessionTeacherRepo(this._apiService);
  Future<ApiResult<CourseResponse>> eidtLessionTeacher(
      AddLessionRuqest addLessionRuqest, String lession) async {
    try {
      final response = await _apiService.editLession(addLessionRuqest, lession);
      return ApiResult.success(response);
    } on DioError catch (error) {
      return ApiResult.failure(ApiErrorHandler.fromDioError(error));
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.fromGenericError(error));
    }
  }
}
