// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_quation_ruqest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuationRuqest _$QuationRuqestFromJson(Map<String, dynamic> json) =>
    QuationRuqest(
      question: json['question'] as String?,
      a: json['a'] as String?,
      b: json['b'] as String?,
      c: json['c'] as String?,
      correct_choice: json['correct_choice'] as String?,
      quiz: (json['quiz'] as num?)?.toInt(),
      course: (json['course'] as num?)?.toInt(),
    );

Map<String, dynamic> _$QuationRuqestToJson(QuationRuqest instance) =>
    <String, dynamic>{
      'question': instance.question,
      'a': instance.a,
      'b': instance.b,
      'c': instance.c,
      'correct_choice': instance.correct_choice,
      'quiz': instance.quiz,
      'course': instance.course,
    };
