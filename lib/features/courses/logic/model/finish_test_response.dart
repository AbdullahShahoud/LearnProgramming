import 'package:json_annotation/json_annotation.dart';

part 'finish_test_response.g.dart';

@JsonSerializable()
class FinishLevelResponse {
  String? message;
 
  FinishLevelResponse({this.message});

  factory FinishLevelResponse.fromJson(Map<String, dynamic> json) =>
      _$FinishLevelResponseFromJson(json);
}
