// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_coures_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCourseResponse _$AddCourseResponseFromJson(Map<String, dynamic> json) =>
    AddCourseResponse(
      message: json['message'] as String?,
      course: (json['course'] as num?)?.toInt(),
      final_id: (json['final_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AddCourseResponseToJson(AddCourseResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'course': instance.course,
      'final_id': instance.final_id,
    };
