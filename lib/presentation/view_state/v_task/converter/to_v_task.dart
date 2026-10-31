import 'package:three_tasks/data_foundation/task_base/task_base.dart';
import 'package:three_tasks/domain/entity/e_task/e_task.dart';
import 'package:three_tasks/presentation/view_state/v_task/v_task.dart';

/// [VTask] への変換器
class EToVTask {
  static VDailyTask toVDailyTask(
    EDailyTask dailyTask,
  ) =>
      VDailyTask(
        id: dailyTask.id,
        title: dailyTask.title,
        isChecked: dailyTask.isChecked,
        labelId: dailyTask.labelId,
        review: dailyTask.review,
        date: dailyTask.date,
        isFetched: dailyTask.isFetched,
      );

  static VWeeklyTask toVWeeklyTask(
    EWeeklyTask weeklyTask,
  ) =>
      VWeeklyTask(
        id: weeklyTask.id,
        title: weeklyTask.title,
        isChecked: weeklyTask.isChecked,
        labelId: weeklyTask.labelId,
        week: weeklyTask.week,
        review: weeklyTask.review,
        isFetched: weeklyTask.isFetched,
        canReplace: weeklyTask.isPlaceHolder2,
      );

  static VMonthlyTask toVMonthlyTask(EMonthlyTask monthlyTask) => VMonthlyTask(
        id: monthlyTask.id,
        title: monthlyTask.title,
        isChecked: monthlyTask.isChecked,
        labelId: monthlyTask.labelId,
        review: monthlyTask.review,
        month: monthlyTask.month,
        isFetched: monthlyTask.isFetched,
      );

  static VYearlyTask toVYearlyTask(EYearlyTask yearlyTask) => VYearlyTask(
        id: yearlyTask.id,
        title: yearlyTask.title,
        isChecked: yearlyTask.isChecked,
        labelId: yearlyTask.labelId,
        review: yearlyTask.review,
        year: yearlyTask.year,
        isFetched: yearlyTask.isFetched,
      );
}

// extension VTaskCaster on List<VTask>{
//   List<P> pass<P extends VTask>()=>cast<P>();
// }
