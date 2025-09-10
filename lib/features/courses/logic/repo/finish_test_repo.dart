import 'package:dio/dio.dart';
import 'package:learn_programtion/core/network/api_result.dart';
import 'package:learn_programtion/features/courses/logic/model/finish_test_request.dart';
import 'package:learn_programtion/features/courses/logic/model/finish_test_response.dart';

import '../../../../core/network/api_error_handler.dart';
import '../../../../core/network/api_service.dart';

class FinishLevelRepo {
  ApiService _apiService;
  FinishLevelRepo(this._apiService);
  Future<ApiResult<FinishLevelResponse>> finishLevel(
      FinishedLevelRuqest finishedLevelRuqest) async {
    try {
      final response = await _apiService.finishedLevel(finishedLevelRuqest);
      return ApiResult.success(response);
    } on DioError catch (error) {
      return ApiResult.failure(ApiErrorHandler.fromDioError(error));
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.fromGenericError(error));
    }
  }
}
