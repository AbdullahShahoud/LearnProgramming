import 'package:dio/dio.dart';
import 'package:learn_programtion/core/network/api_error_handler.dart';
import 'package:learn_programtion/core/network/api_result.dart';
import 'package:learn_programtion/core/network/api_service.dart';

import '../../../addCourse/logic/model/add_course_ruqest.dart';
import '../model/edit_Course_respponse.dart';

class EidetCourseRepo {
  ApiService _apiService;
  EidetCourseRepo(this._apiService);
  Future<ApiResult<CourseResponse>> eidtCourse(
      AddCourseRuqest addCourseRuqest, String course) async {
    try {
      final response = await _apiService.editCourses(addCourseRuqest, course);
      return ApiResult.success(response);
    } on DioError catch (error) {
      return ApiResult.failure(ApiErrorHandler.fromDioError(error));
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.fromGenericError(error));
    }
  }
}
