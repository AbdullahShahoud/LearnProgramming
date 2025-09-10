// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_question_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionAndResponse _$QuestionAndResponseFromJson(Map<String, dynamic> json) =>
    QuestionAndResponse(
      answer_text: json['answer_text'] as String?,
      answered: json['answered'] as bool?,
      question_text: json['question_text'] as String?,
    );

Map<String, dynamic> _$QuestionAndResponseToJson(
        QuestionAndResponse instance) =>
    <String, dynamic>{
      'question_text': instance.question_text,
      'answer_text': instance.answer_text,
      'answered': instance.answered,
    };
