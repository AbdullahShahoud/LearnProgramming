import 'package:json_annotation/json_annotation.dart';

part 'courses_me_response.g.dart';

@JsonSerializable()
class CourseMeListResponse {
  List<CourseMeWrapper>? CourseMeResponse;

  CourseMeListResponse({this.CourseMeResponse});

  factory CourseMeListResponse.fromJson(Map<String, dynamic> json) =>
      _$CourseMeListResponseFromJson(json);
}

@JsonSerializable()
class CourseMeWrapper {
  CoursesMeResponse? course;

  CourseMeWrapper({this.course});

  factory CourseMeWrapper.fromJson(Map<String, dynamic> json) =>
      _$CourseMeWrapperFromJson(json);
}

@JsonSerializable()
class CoursesMeResponse {
  int? id;
  String? name;
  String? image;
  String? nameTeacher;
  String? type;
  int? time;
  String? descrip;
  TestMe finalTest;
  bool? checkk;
  List<LevelMe>? level;
  bool? finished;
  CoursesMeResponse(
      {this.id,
      this.name,
      this.time,
      this.type,
      this.checkk,
      this.image,
      this.nameTeacher,
      this.descrip,
      required this.finished,
      required this.level,
      required this.finalTest});

  factory CoursesMeResponse.fromJson(Map<String, dynamic> json) =>
      _$CoursesMeResponseFromJson(json);
}

@JsonSerializable()
class LevelMe {
  List<LessonMe>? lessons;
  bool? checkk;
  int? id;
  TestMe? test;
  String? name;
  bool? finished;
  LevelMe({
    required this.lessons,
    required this.checkk,
    required this.id,
    required this.finished,
    required this.test,
    required this.name,
  });

  factory LevelMe.fromJson(Map<String, dynamic> json) =>
      _$LevelMeFromJson(json);
}

@JsonSerializable()
class TestMe {
  List<QuestionMe>? questions;
  bool? finish;
  int? id;

  TestMe({
    required this.questions,
    required this.finish,
    required this.id,
  });

  factory TestMe.fromJson(Map<String, dynamic> json) => _$TestMeFromJson(json);
}

@JsonSerializable()
class QuestionMe {
  String? question;
  int? id;
  String? a;
  String? b;
  String? c;

  QuestionMe({
    required this.question,
    required this.a,
    required this.b,
    required this.c,
    required this.id,
  });
  factory QuestionMe.fromJson(Map<String, dynamic> json) =>
      _$QuestionMeFromJson(json);
}

@JsonSerializable()
class LessonMe {
  String? name;
  int? id;
  String? video;
  String? description;
  bool? checkk;
  bool? finished;
  LessonMe(
      {this.name,
      this.video,
      this.id,
      this.description,
      this.checkk,
      required this.finished});

  factory LessonMe.fromJson(Map<String, dynamic> json) =>
      _$LessonMeFromJson(json);
}
