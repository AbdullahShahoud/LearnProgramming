// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courses_me_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseMeListResponse _$CourseMeListResponseFromJson(
        Map<String, dynamic> json) =>
    CourseMeListResponse(
      CourseMeResponse: (json['CourseMeResponse'] as List<dynamic>?)
          ?.map((e) => CourseMeWrapper.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourseMeListResponseToJson(
        CourseMeListResponse instance) =>
    <String, dynamic>{
      'CourseMeResponse': instance.CourseMeResponse,
    };

CourseMeWrapper _$CourseMeWrapperFromJson(Map<String, dynamic> json) =>
    CourseMeWrapper(
      course: json['course'] == null
          ? null
          : CoursesMeResponse.fromJson(json['course'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CourseMeWrapperToJson(CourseMeWrapper instance) =>
    <String, dynamic>{
      'course': instance.course,
    };

CoursesMeResponse _$CoursesMeResponseFromJson(Map<String, dynamic> json) =>
    CoursesMeResponse(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      time: (json['time'] as num?)?.toInt(),
      type: json['type'] as String?,
      checkk: json['checkk'] as bool?,
      image: json['image'] as String?,
      nameTeacher: json['nameTeacher'] as String?,
      descrip: json['descrip'] as String?,
      finished: json['finished'] as bool?,
      level: (json['level'] as List<dynamic>?)
          ?.map((e) => LevelMe.fromJson(e as Map<String, dynamic>))
          .toList(),
      finalTest: TestMe.fromJson(json['finalTest'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CoursesMeResponseToJson(CoursesMeResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'nameTeacher': instance.nameTeacher,
      'type': instance.type,
      'time': instance.time,
      'descrip': instance.descrip,
      'finalTest': instance.finalTest,
      'checkk': instance.checkk,
      'level': instance.level,
      'finished': instance.finished,
    };

LevelMe _$LevelMeFromJson(Map<String, dynamic> json) => LevelMe(
      lessons: (json['lessons'] as List<dynamic>?)
          ?.map((e) => LessonMe.fromJson(e as Map<String, dynamic>))
          .toList(),
      checkk: json['checkk'] as bool?,
      id: (json['id'] as num?)?.toInt(),
      finished: json['finished'] as bool?,
      test: json['test'] == null
          ? null
          : TestMe.fromJson(json['test'] as Map<String, dynamic>),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$LevelMeToJson(LevelMe instance) => <String, dynamic>{
      'lessons': instance.lessons,
      'checkk': instance.checkk,
      'id': instance.id,
      'test': instance.test,
      'name': instance.name,
      'finished': instance.finished,
    };

TestMe _$TestMeFromJson(Map<String, dynamic> json) => TestMe(
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) => QuestionMe.fromJson(e as Map<String, dynamic>))
          .toList(),
      finish: json['finish'] as bool?,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TestMeToJson(TestMe instance) => <String, dynamic>{
      'questions': instance.questions,
      'finish': instance.finish,
      'id': instance.id,
    };

QuestionMe _$QuestionMeFromJson(Map<String, dynamic> json) => QuestionMe(
      question: json['question'] as String?,
      a: json['a'] as String?,
      b: json['b'] as String?,
      c: json['c'] as String?,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$QuestionMeToJson(QuestionMe instance) =>
    <String, dynamic>{
      'question': instance.question,
      'id': instance.id,
      'a': instance.a,
      'b': instance.b,
      'c': instance.c,
    };

LessonMe _$LessonMeFromJson(Map<String, dynamic> json) => LessonMe(
      name: json['name'] as String?,
      video: json['video'] as String?,
      id: (json['id'] as num?)?.toInt(),
      description: json['description'] as String?,
      checkk: json['checkk'] as bool?,
      finished: json['finished'] as bool?,
    );

Map<String, dynamic> _$LessonMeToJson(LessonMe instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'video': instance.video,
      'description': instance.description,
      'checkk': instance.checkk,
      'finished': instance.finished,
    };
