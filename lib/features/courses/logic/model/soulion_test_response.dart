import 'package:json_annotation/json_annotation.dart';

part 'soulion_test_response.g.dart';

@JsonSerializable()
class SoulionResponse {
  String? message;
  int? score ;
  bool? passed  ;

  SoulionResponse({this.message,this.passed,this.score});

  factory SoulionResponse.fromJson(Map<String, dynamic> json) => _$SoulionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SoulionResponseToJson(this);
}