// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'soulion_test_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SoulionResponse _$SoulionResponseFromJson(Map<String, dynamic> json) =>
    SoulionResponse(
      message: json['message'] as String?,
      passed: json['passed'] as bool?,
      score: (json['score'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SoulionResponseToJson(SoulionResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'score': instance.score,
      'passed': instance.passed,
    };
