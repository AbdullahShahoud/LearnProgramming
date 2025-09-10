// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'soulion_test_ruqest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QautionRuqest _$QautionRuqestFromJson(Map<String, dynamic> json) =>
    QautionRuqest(
      student: (json['student'] as num?)?.toInt(),
      selected_answer: json['selected_answer'] as String?,
      question: (json['question'] as num?)?.toInt(),
      quiz: (json['quiz'] as num?)?.toInt(),
    );

Map<String, dynamic> _$QautionRuqestToJson(QautionRuqest instance) =>
    <String, dynamic>{
      'student': instance.student,
      'selected_answer': instance.selected_answer,
      'quiz': instance.quiz,
      'question': instance.question,
    };
