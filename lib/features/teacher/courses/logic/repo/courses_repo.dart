// ignore_for_file: unnecessary_null_comparison

import 'package:learn_programtion/core/network/api_error_handler.dart';
import 'package:learn_programtion/core/network/api_result.dart';
import 'package:learn_programtion/core/network/api_service.dart';
import '../model/courses_response.dart';

class CoursesTeacherRepo {
  final ApiService _apiService;

  CoursesTeacherRepo(this._apiService);

  Future<ApiResult<CourseListResponse>> getCoursesTeacher() async {
    try {
      final response = await _apiService.getCoursesTeacher();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.fromGenericError(error));
    }
  }
}
