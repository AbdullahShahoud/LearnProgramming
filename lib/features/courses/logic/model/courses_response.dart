import 'package:json_annotation/json_annotation.dart';

part 'courses_response.g.dart';
@JsonSerializable()
class CourseListResponseStudent {
  List<CoursesResponse>? courseResponse;

  CourseListResponseStudent({this.courseResponse});

  factory CourseListResponseStudent.fromJson(Map<String, dynamic> json) =>
      _$CourseListResponseStudentFromJson(json);
}
@JsonSerializable()
class CoursesResponse {
  int? id;
  String? name; 
  String? image;
  String? nameTeacher;
  String? type;
  int? time;
  String? descrip;
  List<Level> levels;

  CoursesResponse({
   required this.id,
   required this.name,
   required this.time,
   required this.descrip,
   required this.nameTeacher,
   required this.type,
   required this.image,
    required this.levels,
  });

  factory CoursesResponse.fromJson(Map<String, dynamic> json) =>
      _$CoursesResponseFromJson(json);
}

@JsonSerializable()
class Level {
  String name;
  Level({required this.name});

  factory Level.fromJson(Map<String, dynamic> json) => _$LevelFromJson(json);
}
