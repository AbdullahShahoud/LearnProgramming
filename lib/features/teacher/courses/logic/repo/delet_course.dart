import 'package:dio/dio.dart';
import 'package:learn_programtion/core/network/api_error_handler.dart';
import 'package:learn_programtion/core/network/api_result.dart';
import 'package:learn_programtion/core/network/api_service.dart';

class DeletCourseRepo {
  ApiService _apiService;
  DeletCourseRepo(this._apiService);
  Future<ApiResult<void>> deletCourse(String course) async {
    try {
      final response = await _apiService.deletCourse(course);
      return ApiResult.success(response);
    } on DioError catch (error) {
      return ApiResult.failure(ApiErrorHandler.fromDioError(error));
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.fromGenericError(error));
    }
  }
}
