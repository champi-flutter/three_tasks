import 'package:three_tasks/data_foundation/review_base/review.dart';
import 'package:three_tasks/presentation/controller/dto/review_control_parameter/review_control_parameter.dart';
import 'package:three_tasks/presentation/controller/dto/task_control_parameter/task_control_parameter.dart';
import 'package:three_tasks/presentation/view_state/v_task/v_task.dart';
import 'package:three_tasks/use_case/input_data/i_task/i_task.dart';

class TaskInputConverter {
  static ITask toTaskSaveInputData({
    required VTask vTask,
    required TaskControlParameter parameter,
  }) =>
      switch (vTask) {
        // region
        VDailyTask() => toIDailyTask(vTask: vTask, saveParameter: parameter),
        VWeeklyTask() => toIWeeklyTask(vTask: vTask, saveParameter: parameter),
        VMonthlyTask() => toIMonthlyTask(
            vTask: vTask,
            saveParameter: parameter,
          ),
        VYearlyTask() => toIYearlyTask(vTask: vTask, saveParameter: parameter),
        // endregion
      };

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
  //     final ITask iTask = ToITask.toTaskSaveInputData(
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

  static ITask toTaskReviewInputData({
    required VTask vTask,
    required ReviewControlParameter parameter,
  }) =>
      switch (vTask) {
        // region
        VDailyTask() => toIDailyTask(
            vTask: vTask,
            reviewParameter: parameter,
          ),
        VWeeklyTask() => toIWeeklyTask(
            vTask: vTask,
            reviewParameter: parameter,
          ),
        VMonthlyTask() => toIMonthlyTask(
            vTask: vTask,
            reviewParameter: parameter,
          ),
        VYearlyTask() => toIYearlyTask(
            vTask: vTask,
            reviewParameter: parameter,
          ),
        // endregion
      };

  static IDailyTask toIDailyTask({
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

  static IWeeklyTask toIWeeklyTask({
    required VWeeklyTask vTask,
    TaskControlParameter? saveParameter,
    ReviewControlParameter? reviewParameter,
  }) {
    final Review appliedReview = Review(
      result: (reviewParameter?.result) ?? vTask.review.result,
      next: (reviewParameter?.next) ?? vTask.review.next,
    );
    return IWeeklyTask(
      id: vTask.id,
      title: (saveParameter?.newTitle) ?? vTask.title,
      isChecked: (saveParameter?.newChecked) ?? vTask.isChecked,
      labelId: (saveParameter?.newLabelId) ?? vTask.labelId,
      review: appliedReview,
      week: vTask.week,
    );
  }

  static IMonthlyTask toIMonthlyTask({
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

  static IYearlyTask toIYearlyTask({
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
