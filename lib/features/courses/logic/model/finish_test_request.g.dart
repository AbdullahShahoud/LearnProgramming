// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finish_test_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FinishedLevelRuqest _$FinishedLevelRuqestFromJson(Map<String, dynamic> json) =>
    FinishedLevelRuqest(
      level: (json['level'] as num?)?.toInt(),
      course: (json['course'] as num?)?.toInt(),
    );

Map<String, dynamic> _$FinishedLevelRuqestToJson(
        FinishedLevelRuqest instance) =>
    <String, dynamic>{
      'course': instance.course,
      'level': instance.level,
    };
