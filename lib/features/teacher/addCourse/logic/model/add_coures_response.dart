import 'package:json_annotation/json_annotation.dart';

part 'add_coures_response.g.dart';

@JsonSerializable()
class AddCourseResponse {
  String? message;
  int? course;
  int? final_id;

  AddCourseResponse({
    this.message,
    this.course,
    this.final_id,
  });

  factory AddCourseResponse.fromJson(Map<String, dynamic> json) =>
      _$AddCourseResponseFromJson(json);
}
