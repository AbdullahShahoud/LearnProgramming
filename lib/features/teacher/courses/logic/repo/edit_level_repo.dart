import 'package:dio/dio.dart';
import 'package:learn_programtion/core/network/api_error_handler.dart';
import 'package:learn_programtion/core/network/api_result.dart';
import 'package:learn_programtion/core/network/api_service.dart';
import 'package:learn_programtion/features/teacher/courses/logic/model/edit_Course_respponse.dart';

import '../../../addCourse/logic/model/add_level_ruqest.dart';

class EidtLevelTeacherRepo {
  ApiService _apiService;
  EidtLevelTeacherRepo(this._apiService);
  Future<ApiResult<CourseResponse>> eidtLevelTeacher(
      AddLevelRuqest addLevelRuqest, String level) async {
    try {
      final response = await _apiService.editLevel(addLevelRuqest, level);
      return ApiResult.success(response);
    } on DioError catch (error) {
      return ApiResult.failure(ApiErrorHandler.fromDioError(error));
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.fromGenericError(error));
    }
  }
}
