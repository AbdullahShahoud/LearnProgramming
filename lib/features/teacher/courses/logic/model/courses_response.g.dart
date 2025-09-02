// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courses_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoursesResponseTc _$CoursesResponseTcFromJson(Map<String, dynamic> json) =>
    CoursesResponseTc(
      image: json['image'] as String?,
      level: (json['level'] as List<dynamic>?)
          ?.map((e) => Levels.fromJson(e as Map<String, dynamic>))
          .toList(),
      teacher: (json['teacher'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      time: (json['time'] as num?)?.toInt(),
      name: json['name'] as String?,
      type: json['type'] as String?,
      finalTest: json['finalTest'] == null
          ? null
          : Tests.fromJson(json['finalTest'] as Map<String, dynamic>),
      descrip: json['descrip'] as String?,
      nameTeacher: json['nameTeacher'] as String?,
      num_of_level: (json['num_of_level'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CoursesResponseTcToJson(CoursesResponseTc instance) =>
    <String, dynamic>{
      'descrip': instance.descrip,
      'teacher': instance.teacher,
      'nameTeacher': instance.nameTeacher,
      'num_of_level': instance.num_of_level,
      'image': instance.image,
      'type': instance.type,
      'name': instance.name,
      'time': instance.time,
      'finalTest': instance.finalTest,
      'id': instance.id,
      'level': instance.level,
    };

Tests _$TestsFromJson(Map<String, dynamic> json) => Tests(
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) => Quations.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TestsToJson(Tests instance) => <String, dynamic>{
      'questions': instance.questions,
    };

Quations _$QuationsFromJson(Map<String, dynamic> json) => Quations(
      question: json['question'] as String?,
      c: json['c'] as String?,
      correct_choice: json['correct_choice'] as String?,
      a: json['a'] as String?,
      b: json['b'] as String?,
    );

Map<String, dynamic> _$QuationsToJson(Quations instance) => <String, dynamic>{
      'question': instance.question,
      'a': instance.a,
      'correct_choice': instance.correct_choice,
      'b': instance.b,
      'c': instance.c,
    };

Levels _$LevelsFromJson(Map<String, dynamic> json) => Levels(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      num_of_lesson: (json['num_of_lesson'] as num?)?.toInt(),
      test: json['test'] == null
          ? null
          : Tests.fromJson(json['test'] as Map<String, dynamic>),
      lessons: (json['lessons'] as List<dynamic>?)
          ?.map((e) => Lessons.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LevelsToJson(Levels instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'num_of_lesson': instance.num_of_lesson,
      'lessons': instance.lessons,
      'test': instance.test,
    };

Lessons _$LessonsFromJson(Map<String, dynamic> json) => Lessons(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      video: json['video'] as String?,
    );

Map<String, dynamic> _$LessonsToJson(Lessons instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'video': instance.video,
    };
