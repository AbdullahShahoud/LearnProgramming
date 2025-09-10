import 'package:dio/dio.dart';
import 'package:learn_programtion/core/network/api_result.dart';

import '../../../../core/network/api_error_handler.dart';
import '../../../../core/network/api_service.dart';
import '../model/soulion_test_ruqest.dart';

class SoulionQuationRepo {
  ApiService _apiService;
  SoulionQuationRepo(this._apiService);
  Future<ApiResult> soulionQuation(
      List<QautionRuqest> qautionRuqest) async {
    try {
      final response = await _apiService.soulionQuations(qautionRuqest);
      return ApiResult.success(response);
    } on DioError catch (error) {
      return ApiResult.failure(ApiErrorHandler.fromDioError(error));
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.fromGenericError(error));
    }
  }
}
