// import 'package:custom_core_types/custom_core_types.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
//
// part 'c_task.freezed.dart';
//
// /// Cache 用タスク DTO
// sealed class CTask {
//   String get title;
//   int get id;
//   bool get isChecked;
//   int get labelId;
// }
//
// /// Cache 用 日単位タスク DTO
// @freezed
// abstract class CDailyTask with _$CDailyTask implements CTask {
//   const CDailyTask._();
//
//   const factory CDailyTask({
//     required String title,
//     required Date date,
//     required int id,
//     required bool isChecked,
//     required int labelId,
//   }) = _CDailyTask;
// }
//
// /// Cache 用 週単位タスク DTO
// @freezed
// abstract class CWeeklyTask with _$CWeeklyTask implements CTask {
//   const CWeeklyTask._();
//
//   const factory CWeeklyTask({
//     required String title,
//     required UniqueWeek week,
//     required int id,
//     required bool isChecked,
//     required int labelId,
//   }) = _CWeeklyTask;
// }
//
// /// Cache 用 月単位タスク DTO
// @freezed
// abstract class CMonthlyTask with _$CMonthlyTask implements CTask {
//   const CMonthlyTask._();
//
//   const factory CMonthlyTask({
//     required String title,
//     required Month month,
//     required int id,
//     required bool isChecked,
//     required int labelId,
//   }) = _CMonthlyTask;
// }
//
// /// Cache 用 年単位タスク DTO
// @freezed
// abstract class CYearlyTask with _$CYearlyTask implements CTask {
//   const CYearlyTask._();
//
//   const factory CYearlyTask({
//     required String title,
//     required int year,
//     required int id,
//     required bool isChecked,
//     required int labelId,
//   }) = _CYearlyTask;
// }