// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_grade.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GradeRespons _$GradeResponsFromJson(Map<String, dynamic> json) => GradeRespons(
      (json['completed_courses'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$GradeResponsToJson(GradeRespons instance) =>
    <String, dynamic>{
      'completed_courses': instance.completed_courses,
    };
