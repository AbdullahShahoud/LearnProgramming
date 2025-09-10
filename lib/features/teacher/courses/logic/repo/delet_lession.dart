import 'package:dio/dio.dart';
import 'package:learn_programtion/core/network/api_error_handler.dart';
import 'package:learn_programtion/core/network/api_result.dart';
import 'package:learn_programtion/core/network/api_service.dart';

class DeleteLessionTeacherRepo {
  ApiService _apiService;
  DeleteLessionTeacherRepo(this._apiService);
  Future<ApiResult<void>> deletLessionTeacher(String lession) async {
    try {
      final response = await _apiService.deletLession(lession);
      return ApiResult.success(response);
    } on DioError catch (error) {
      return ApiResult.failure(ApiErrorHandler.fromDioError(error));
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.fromGenericError(error));
    }
  }
}
