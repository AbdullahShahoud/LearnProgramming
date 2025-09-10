import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:learn_programtion/features/courses/logic/model/courses_me_response.dart';
part 'coursees_state.freezed.dart';

@freezed
class CoursesState<T> with _$CoursesState<T> {
  const factory CoursesState.initialCoursesMe() = _InitialCoursesMe;
  const factory CoursesState.loadingCoursesMe() = LoadingCoursesMe;
  const factory CoursesState.successCoursesMe(T data) = SuccessCoursesMe<T>;
  const factory CoursesState.errorCoursesMe({required String error}) =
      ErrorCoursesMe;

  const factory CoursesState.courseSelectedMe(
      CourseMeWrapper selectedCourseMe) = CourseSelectedMe;
  const factory CoursesState.lessonSelectedMe(LessonMe selectedlesson) =
      LessonSelectedMe;
  const factory CoursesState.levelSelectedMe(LevelMe selectedlevel) =
      LevelSelectedMe;
  const factory CoursesState.sendQuationInitial() = _SendQuationInitial;
  const factory CoursesState.sendQuationLoading() = SendQuationLoading;
  const factory CoursesState.sendQuationSuccess(String data) =
      SendQuationSuccess;
  const factory CoursesState.sendQuationError({required String error}) =
      SendQuationError;

  const factory CoursesState.finishedInitial() = _FinishedInitial;
  const factory CoursesState.finishedLoading() = FinishedLoading;
  const factory CoursesState.finishedSuccess(String data) = FinishedSuccess;
  const factory CoursesState.finishedError({required String error}) =
      FinishedError;

  const factory CoursesState.listCoursesInitial() = _ListCoursesInitial;
  const factory CoursesState.listCoursesLoading() = ListCoursesLoading;
  const factory CoursesState.listCoursesSuccess(T data) = ListCoursesSuccess<T>;
  const factory CoursesState.listCoursesError({required String error}) =
      ListCoursesError;

  const factory CoursesState.checkCoursesLoading() = CheckCoursesLoading;
  const factory CoursesState.checkCoursesSuccess(T data) =
      CheckCoursesSuccess<T>;
  const factory CoursesState.checkCoursesError({required String error}) =
      CheckCoursesError;

  const factory CoursesState.deleteCoursesLoading() = DeleteCoursesLoading;
  const factory CoursesState.deleteCoursesSuccess(T data) =
      DeleteCoursesSuccess<T>;
  const factory CoursesState.deleteCoursesError({required String error}) =
      DeleteCoursesError;
      const factory CoursesState.soulionTestLoading() = SoulionTestLoading;
  const factory CoursesState.soulionTestSuccess(T data) =
      SoulionTestSuccess<T>;
  const factory CoursesState.soulionTestError({required String error}) =
      SoulionTestError;
}
