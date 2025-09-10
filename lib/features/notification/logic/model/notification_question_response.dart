import 'package:json_annotation/json_annotation.dart';

part 'notification_question_response.g.dart';

@JsonSerializable()
class QuestionAndResponse {
  String? question_text;
  String? answer_text;
  bool? answered;

  QuestionAndResponse(
      {
      this.answer_text,
      this.answered,
      this.question_text,
});

  factory QuestionAndResponse.fromJson(Map<String, dynamic> json) =>
      _$QuestionAndResponseFromJson(json);
}
