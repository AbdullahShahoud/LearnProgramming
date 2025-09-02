import 'package:freezed_annotation/freezed_annotation.dart';
part 'courser_cubit_state.freezed.dart';

@freezed
class CourserCubitTeacherState<T> with _$CourserCubitTeacherState<T> {
  const factory CourserCubitTeacherState.initialCourses() = _InitialCourses;
  const factory CourserCubitTeacherState.loadinCourses() = LoadingCourses;
  const factory CourserCubitTeacherState.successCourses(T data) =
      SuccessCourses<T>;
  const factory CourserCubitTeacherState.errorCourses({required String error}) =
      ErrorCourses;

       const factory CourserCubitTeacherState.loadinCoursesAdd() = LoadingCoursesAdd;
  const factory CourserCubitTeacherState.successCoursesAdd(T data) =
      SuccessCoursesAdd<T>;
  const factory CourserCubitTeacherState.errorCoursesAdd({required String error}) =
      ErrorCoursesAdd;

       const factory CourserCubitTeacherState.loadinCoursesEdit() = LoadingCoursesEdit;
  const factory CourserCubitTeacherState.successCoursesEdit(T data) =
      SuccessCoursesEdit<T>;
  const factory CourserCubitTeacherState.errorCoursesEdit({required String error}) =
      ErrorCoursesEdit;

          const factory CourserCubitTeacherState.loadinLevelAdd() = LoadingLevelAdd;
  const factory CourserCubitTeacherState.successLevelAdd(T data) =
      SuccessLevelAdd<T>;
  const factory CourserCubitTeacherState.errorLevelAdd({required String error}) =
      ErrorLevelAdd;

       const factory CourserCubitTeacherState.loadinLevelEdit() = LoadingLevelEdit;
  const factory CourserCubitTeacherState.successLevelEdit(T data) =
      SuccessLevelEdit<T>;
  const factory CourserCubitTeacherState.errorLevelEdit({required String error}) =
      ErrorLevelEdit;


              const factory CourserCubitTeacherState.loadinLessionAdd() = LoadingLessionAdd;
  const factory CourserCubitTeacherState.successLessionAdd(T data) =
      SuccessLessionAdd<T>;
  const factory CourserCubitTeacherState.errorLessionAdd({required String error}) =
      ErrorLessionAdd;

       const factory CourserCubitTeacherState.loadinLessionEdit() = LoadingLessionEdit;
  const factory CourserCubitTeacherState.successLessionEdit(T data) =
      SuccessLessionEdit<T>;
  const factory CourserCubitTeacherState.errorLessionEdit({required String error}) =
      ErrorLessionEdit;

                  const factory CourserCubitTeacherState.loadinTestAdd() = LoadingTestAdd;
  const factory CourserCubitTeacherState.successTestAdd(T data) =
      SuccessTestAdd<T>;
  const factory CourserCubitTeacherState.errorTestAdd({required String error}) =
      ErrorTestAdd;

       const factory CourserCubitTeacherState.loadinTestEdit() = LoadingTestEdit;
  const factory CourserCubitTeacherState.successTestEdit(T data) =
      SuccessTestEdit<T>;
  const factory CourserCubitTeacherState.errorTestEdit({required String error}) =
      ErrorTestEdit;
}
