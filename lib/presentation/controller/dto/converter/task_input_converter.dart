import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/data_foundation/value_object/review.dart';
import 'package:three_tasks/presentation/controller/dto/review_control_parameter/review_control_parameter.dart';
import 'package:three_tasks/presentation/controller/dto/task_control_parameter/task_control_parameter.dart';
import 'package:three_tasks/presentation/view_state/v_task/v_task.dart';
import 'package:three_tasks/use_case/input_data/i_task/i_task.dart';

class TaskInputConverter {
  /// タスク View State とタスク変更パラメータから、タスク InputData に変換する
  static ITask toTaskSaveInputData({
    required VTask vTask,
    required TaskControlParameter parameter,
  })
  // 折りたたみ用
  {
    switch (vTask) {
      // region
      case VDailyTask():
        return _toIDailyTask(vTask: vTask, saveParameter: parameter);
      case VWeeklyTask():
        throw ArgumentError(
          "[TaskInputConverter.toTaskSaveInputData] パラメータが週タスクに対応していません。",
        );
      case VMonthlyTask():
        return _toIMonthlyTask(
          vTask: vTask,
          saveParameter: parameter,
        );
      case VYearlyTask():
        return _toIYearlyTask(vTask: vTask, saveParameter: parameter);
      // endregion
    }
  }

  /// 週タスク View State と週タスク変更パラメータから、週タスク InputData に変換する
  static IWeeklyTask toWeeklyTaskSaveInputData({
    required VWeeklyTask vTask,
    required WeeklyTaskControlParameter parameter,
  }) => _toIWeeklyTask(vTask: vTask, saveParameter: parameter);

  // static TaskList<ITask> toTaskListSaveInputData({
  //   required TaskList<VTask> taskState,
  //   required int position,
  //   required TaskControlParameter parameter,
  // })
  // {
  //
  //   // あとで TaskList<ITask> に当てはめるリスト
  //   final List<ITask> tempTaskList = [];
  //   // あとで WeeklyTaskList<IWeeklyTask> に当てはめるリスト
  //   final Map<UniqueWeek, List<IWeeklyTask>> tempWeeklyTaskListMap = {};
  //   // 渡された情報を tempTaskList （または tempWeeklyTaskList ）に当てはめるプロセス
  //   for (final ListEntry<VTask> vTaskEntry in taskState) {
  //     // 対象インデックスのタスクなら引数のパラメータを、
  //     // そうでない場合は空のパラメータをあたはめる
  //     final appliedParameter =
  //     (vTaskEntry.index == position) ? parameter : TaskControlParameter();
  //     final ITask iTask = _toITask.toTaskSaveInputData(
  //       vTask: vTaskEntry.value,
  //       parameter: appliedParameter,
  //     );
  //
  //     // 週タスクの場合
  //     if (iTask is IWeeklyTask) {
  //       tempWeeklyTaskListMap.addNullable(key: iTask.week, value: iTask);
  //     }
  //     // 週タスク以外の場合
  //     else {
  //       tempTaskList.add(iTask);
  //     }
  //   }
  // }

  /// タスク View State とレビュー変更パラメータから、タスク InputData に変換する
  static ITask toTaskReviewInputData({
    required VTask vTask,
    required ReviewControlParameter parameter,
  }) =>
      switch (vTask) {
        // region
        VDailyTask() => _toIDailyTask(
            vTask: vTask,
            reviewParameter: parameter,
          ),
        VWeeklyTask() => _toIWeeklyTask(
            vTask: vTask,
            reviewParameter: parameter,
          ),
        VMonthlyTask() => _toIMonthlyTask(
            vTask: vTask,
            reviewParameter: parameter,
          ),
        VYearlyTask() => _toIYearlyTask(
            vTask: vTask,
            reviewParameter: parameter,
          ),
        // endregion
      };

  /// タスク View State をそのままタスク InputData に変換する
  static ITask toITaskWithoutChange({required VTask vTask}) {
    return switch (vTask) {
    // region
      VDailyTask() => toIDailyTaskWithoutChange(vTask: vTask),
      VWeeklyTask() => toIWeeklyTaskWithoutChange(vTask: vTask),
      VMonthlyTask() => toIMonthlyTaskWithoutChange(vTask: vTask),
      VYearlyTask() => toIYearlyTaskWithoutChange(vTask: vTask),
    // endregion
    };
  }

  /// タスク View State をそのままタスク InputData に変換する
  static IDailyTask toIDailyTaskWithoutChange({required VDailyTask vTask}) =>
      _toIDailyTask(vTask: vTask);

  /// タスク View State をそのままタスク InputData に変換する
  static IWeeklyTask toIWeeklyTaskWithoutChange({required VWeeklyTask vTask}) =>
      _toIWeeklyTask(vTask: vTask);

  /// タスク View State をそのままタスク InputData に変換する
  static IMonthlyTask toIMonthlyTaskWithoutChange({required VMonthlyTask vTask}) =>
      _toIMonthlyTask(vTask: vTask);

  /// タスク View State をそのままタスク InputData に変換する
  static IYearlyTask toIYearlyTaskWithoutChange({required VYearlyTask vTask}) =>
      _toIYearlyTask(vTask: vTask);

  static IDailyTask _toIDailyTask({
    required VDailyTask vTask,
    TaskControlParameter? saveParameter,
    ReviewControlParameter? reviewParameter,
  }) {
    final Review appliedReview = Review(
      result: (reviewParameter?.result) ?? vTask.review.result,
      next: (reviewParameter?.next) ?? vTask.review.next,
    );
    return IDailyTask(
      id: vTask.id,
      title: (saveParameter?.newTitle) ?? vTask.title,
      isChecked: (saveParameter?.newChecked) ?? vTask.isChecked,
      labelId: (saveParameter?.newLabelId) ?? vTask.labelId,
      review: appliedReview,
      date: vTask.date,
    );
  }

  static IWeeklyTask _toIWeeklyTask({
    required VWeeklyTask vTask,
    WeeklyTaskControlParameter? saveParameter,
    ReviewControlParameter? reviewParameter,
  }) {
    final Review appliedReview = Review(
      result: (reviewParameter?.result) ?? vTask.review.result,
      next: (reviewParameter?.next) ?? vTask.review.next,
    );
    // 週の開始日を変更しているかどうかを確認する
    final Date? newStart = saveParameter?.newStart;
    final UniqueWeek appliedWeek = (newStart != null)
        ? UniqueWeek.fromDate(
            currentDate: newStart,
            firstDate: newStart,
          )
        : vTask.week;
    return IWeeklyTask(
      id: vTask.id,
      title: (saveParameter?.newTitle) ?? vTask.title,
      isChecked: (saveParameter?.newChecked) ?? vTask.isChecked,
      labelId: (saveParameter?.newLabelId) ?? vTask.labelId,
      review: appliedReview,
      week: appliedWeek,
    );
  }

  static IMonthlyTask _toIMonthlyTask({
    required VMonthlyTask vTask,
    TaskControlParameter? saveParameter,
    ReviewControlParameter? reviewParameter,
  }) {
    final Review appliedReview = Review(
      result: (reviewParameter?.result) ?? vTask.review.result,
      next: (reviewParameter?.next) ?? vTask.review.next,
    );
    return IMonthlyTask(
      id: vTask.id,
      title: (saveParameter?.newTitle) ?? vTask.title,
      isChecked: (saveParameter?.newChecked) ?? vTask.isChecked,
      labelId: (saveParameter?.newLabelId) ?? vTask.labelId,
      review: appliedReview,
      month: vTask.month,
    );
  }

  static IYearlyTask _toIYearlyTask({
    required VYearlyTask vTask,
    TaskControlParameter? saveParameter,
    ReviewControlParameter? reviewParameter,
  }) {
    final Review appliedReview = Review(
      result: (reviewParameter?.result) ?? vTask.review.result,
      next: (reviewParameter?.next) ?? vTask.review.next,
    );
    return IYearlyTask(
      id: vTask.id,
      title: (saveParameter?.newTitle) ?? vTask.title,
      isChecked: (saveParameter?.newChecked) ?? vTask.isChecked,
      labelId: (saveParameter?.newLabelId) ?? vTask.labelId,
      review: appliedReview,
      year: vTask.year,
    );
  }

  TaskInputConverter._();
}
