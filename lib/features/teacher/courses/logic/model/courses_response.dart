import 'package:json_annotation/json_annotation.dart';
part 'courses_response.g.dart';

@JsonSerializable()
class CourseListResponse {
  @JsonKey(name: 'CourseResponse')
  List<CoursesResponseTc>? courseResponse;

  CourseListResponse({this.courseResponse});

  factory CourseListResponse.fromJson(Map<String, dynamic> json) =>
      _$CourseListResponseFromJson(json);
}

@JsonSerializable()
class CoursesResponseTc {
  String? descrip;
  String? nameTeacher;
  int? num_of_level;
  String? image;
  String? type;
  String? name;
  int? time;
  Tests? finalTest;
  int? id;
  List<Levels>? level;

  CoursesResponseTc({
    this.image,
    this.level,
    this.id,
    this.time,
    this.name,
    this.type,
    this.finalTest,
    this.descrip,
    this.nameTeacher,
    this.num_of_level,
  });

  factory CoursesResponseTc.fromJson(Map<String, dynamic> json) =>
      _$CoursesResponseTcFromJson(json);
}

@JsonSerializable()
class Tests {
  List<Quations>? questions;
  int? id;
  Tests({this.questions, this.id});

  factory Tests.fromJson(Map<String, dynamic> json) => _$TestsFromJson(json);
}

@JsonSerializable()
class Quations {
  String? question;
  String? a;
  String? correct_choice;
  String? b;
  String? c;
  int? id;
  Quations(
      {this.question, this.c, this.correct_choice, this.a, this.b, this.id});

  factory Quations.fromJson(Map<String, dynamic> json) =>
      _$QuationsFromJson(json);
}

@JsonSerializable()
class Levels {
  int? id;
  String? name;
  int? num_of_lesson;
  List<Lessons>? lessons;
  Tests? test;
  Levels({this.id, this.name, this.num_of_lesson, this.test, this.lessons});

  factory Levels.fromJson(Map<String, dynamic> json) => _$LevelsFromJson(json);
}

@JsonSerializable()
class Lessons {
  int? id;
  String? name;
  String? description;
  String? video;

  Lessons({this.id, this.name, this.description, this.video});

  factory Lessons.fromJson(Map<String, dynamic> json) =>
      _$LessonsFromJson(json);
}
