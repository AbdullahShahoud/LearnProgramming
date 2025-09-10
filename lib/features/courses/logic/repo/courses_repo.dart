import 'package:dio/dio.dart';
import 'package:learn_programtion/core/network/api_error_handler.dart';
import 'package:learn_programtion/core/network/api_result.dart';
import 'package:learn_programtion/core/network/api_service.dart';
import 'package:learn_programtion/features/courses/logic/model/courses_response.dart';

class CoursesRepo {
  ApiService _apiService;
  CoursesRepo(this._apiService);
  Future<ApiResult<CourseListResponseStudent>> getCourse() async {
    try {
      final response = await _apiService.getCourses();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.fromGenericError(error));
    }
  }
}
