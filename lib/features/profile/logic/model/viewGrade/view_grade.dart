import 'package:json_annotation/json_annotation.dart';

part 'view_grade.g.dart';

@JsonSerializable()
class GradeRespons {
  List<String> completed_courses;

  GradeRespons(this.completed_courses);

  factory GradeRespons.fromJson(Map<String, dynamic> json) =>
      _$GradeResponsFromJson(json);
}
