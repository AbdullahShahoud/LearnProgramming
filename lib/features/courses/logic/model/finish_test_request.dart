import 'package:json_annotation/json_annotation.dart';

part 'finish_test_request.g.dart';

@JsonSerializable()
class FinishedLevelRuqest {
  int? course;
  int? level;

  FinishedLevelRuqest(
      { required this.level, required this.course});

  Map<String, dynamic> toJson() => _$FinishedLevelRuqestToJson(this);
}
