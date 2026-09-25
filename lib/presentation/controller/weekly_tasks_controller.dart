// import 'package:custom_core_types/custom_core_types.dart';
// import 'package:three_tasks/data_foundation/task_base/base_task_updater.dart';
// import 'package:three_tasks/data_foundation/task_base/task_list.dart';
// import 'package:three_tasks/entities/e_task/converter/to_e_task.dart';
// import 'package:three_tasks/entities/e_task/e_task.dart';
// import 'package:three_tasks/presentation/controller/dto/task_control_parameter/converter/set_new_e_task.dart';
// import 'package:three_tasks/presentation/controller/dto/task_control_parameter/task_control_parameter.dart';
// import 'package:three_tasks/presentation/view_state/v_task/converter/v_to_e_task.dart';
// import 'package:three_tasks/presentation/view_state/v_task/v_task.dart';
// import 'package:three_tasks/use_case/input_boundary/save_task_changes/draft/draft_task_changes_use_case.dart';
// import 'package:three_tasks/use_case/input_boundary/save_task_changes/save_weekly_task_changes_use_case.dart';
//
// class WeeklyTasksController {
//   WeeklyTasksController({
//     required SaveWeeklyTaskChangesUseCase saveWeeklyTaskChangesUseCase,
//     required KeepAsDraftUseCase keepAsDraftUseCase,
//   })  : _saveWeeklyTaskChangesUseCase = saveWeeklyTaskChangesUseCase,
//         _keepAsDraftUseCase = keepAsDraftUseCase;
//
//   /// タスク変更保存フローへのアクセス
//   final SaveWeeklyTaskChangesUseCase _saveWeeklyTaskChangesUseCase;
//
//   /// タスク下書きフローへのアクセス
//   final KeepAsDraftUseCase _keepAsDraftUseCase;
//
//   /// [TaskList] 中の指定 [position] のタスクの変更を保存する
//   Future<void> saveAt(
//     int position, {
//     required TaskList<VWeeklyTask> state,
//     required WeeklyTaskUpdater updater,
//   })
//   // 折りたたみ用
//   async {
//     // あとで WeeklyTaskList<EWeeklyTask> に当てはめるリスト
//     final List<EWeeklyTask> tempWeeklyList = [];
//     for (final ListEntry<VWeeklyTask> vTaskEntry in state) {
//       EWeeklyTask eTask = VToETask.toEWeeklyTask(vTaskEntry.value);
//       if (vTaskEntry.index == position) {
//         eTask.update(updater);
//       }
//       // 変更されていない placeholder2 の場合は、tempWeeklyList に add せずにスキップする
//       else if (eTask.cannotReplace) {
//         continue;
//       }
//       tempWeeklyList.add(eTask);
//     }
//     // tempWeeklyList を WeeklyTaskList<EWeeklyTask> に適用する
//     final WeeklyTaskList<EWeeklyTask> updatedETaskList =
//         WeeklyTaskList.fromIterable(tempWeeklyList);
//
//     // SaveTaskChangesUseCase を起動する
//     await _saveWeeklyTaskChangesUseCase.execute(
//       updatedETaskList: updatedETaskList,
//     );
//   }
//
//   // /// 週タスク変更パラメータを指定してタスク変更保存フローを呼び出す
//   // Future<void> saveTaskChanges({
//   //   required List<WeeklyTaskControlParameter> controlInfo,
//   // })
//   // // 折りたたみ用
//   // async {
//   //   //　変更されていない placeholder2 はリストから省く
//   //   controlInfo.removeWhere((parameter) {
//   //     final bool canReplace = parameter.taskOrigin.canReplace;
//   //     final bool isNonChanged = parameter.newTitle == null &&
//   //         parameter.newChecked == null &&
//   //         parameter.newLabelId == null;
//   //     return canReplace && isNonChanged;
//   //   });
//   //
//   //   // [TaskControlParameter] から ETask 型の新しいデータに変換する
//   //   final WeeklyTaskList<EWeeklyTask> updateInfo = controlInfo
//   //       .map<EWeeklyTask>(SetNewETask.toEWeeklyTask)
//   //       .toListAs<WeeklyTaskList<EWeeklyTask>>(
//   //           WeeklyTaskList<EWeeklyTask>.fromIterable);
//   //   await _saveWeeklyTaskChangesUseCase.execute(updatedETaskList: updateInfo);
//   // }
//
//   /// 現時点での週タスクの View State でタスク変更保存フローを呼び出す
//   Future<void> saveCurrentState(
//       {required TaskList<VWeeklyTask> taskState})
//   // 折りたたみ用
//   async {
//     final WeeklyTaskList<EWeeklyTask> eTaskList = taskState
//         .mapValues(VToETask.toEWeeklyTask)
//         .toListAs(WeeklyTaskList<EWeeklyTask>.fromIterable);
//
//     eTaskList.removeWhere((eTaskEntry) => eTaskEntry.value.cannotReplace);
//     await _saveWeeklyTaskChangesUseCase.execute(updatedETaskList: eTaskList);
//   }
//
//   /// タスクを下書きとして保有する
//   Future<void> keepAsDraft({
//     required List<WeeklyTaskControlParameter> controlInfo,
//   })
//   // 折りたたみ用
//   async {
//     // [TaskControlParameter] から ETask 型の新しいデータに変換する
//     final List<ETask> updateInfo =
//         controlInfo.map<ETask>(SetNewETask.toEWeeklyTask).toList();
//     await _keepAsDraftUseCase.execute(taskInfo: updateInfo);
//   }
// }
