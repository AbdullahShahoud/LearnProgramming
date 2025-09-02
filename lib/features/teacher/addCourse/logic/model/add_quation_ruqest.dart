import 'package:json_annotation/json_annotation.dart';

part 'add_quation_ruqest.g.dart';

@JsonSerializable()
class QuationRuqest {
  String? question;
  String? a;
  String? b;
  String? c;
  String? correct_choice;
  int? quiz;
  int? course;

  QuationRuqest({
    required this.question,
    required this.a,
    required this.b,
    required this.c,
    required this.correct_choice,
    required this.quiz,
    required this.course,
  });

  Map<String, dynamic> toJson() => _$QuationRuqestToJson(this);
}
