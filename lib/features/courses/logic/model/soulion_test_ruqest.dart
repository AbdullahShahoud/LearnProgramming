import 'package:json_annotation/json_annotation.dart';

part 'soulion_test_ruqest.g.dart';

@JsonSerializable()
class QautionRuqest {
  int? student;
  String? selected_answer;
  int? quiz;
  int? question;

  QautionRuqest({required this.student,required this.selected_answer,required this.question,required this.quiz});

  Map<String, dynamic> toJson() => _$QautionRuqestToJson(this);
}