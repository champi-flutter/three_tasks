

import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/entities/e_task/e_task.dart';
import 'package:three_tasks/enum/task_recurrence.dart';
import 'package:three_tasks/view_models/view_state/v_task/v_task.dart';


extension ToVTaskList<_ETask extends ETask> on List<_ETask>{


  List<VTask> toVTaskList()=> map(_toVTask).toList();

  VTask _toVTask(_ETask eTask) {
    return switch (eTask) { // region
    EDailyTask(date: final Date date) => VDailyTask(
      id: eTask.id,
      title: eTask.title,
      isChecked: eTask.isChecked,
      labelId: eTask.labelId,
      date: date,
    ),
    EWeeklyTask(week: final UniqueWeek week) => VWeeklyTask(
      id: eTask.id,
      title: eTask.title,
      isChecked: eTask.isChecked,
      labelId: eTask.labelId,
      week: week,
    ),
    EMonthlyTask(month: final Month month) => VMonthlyTask(
      id: eTask.id,
      title: eTask.title,
      isChecked: eTask.isChecked,
      labelId: eTask.labelId,
      month: month,
    ),
    EYearlyTask(year: final int year) => VYearlyTask(
      id: eTask.id,
      title: eTask.title,
      isChecked: eTask.isChecked,
      labelId: eTask.labelId,
      year: year,
    ),
  // endregion
  };
  }
}

extension VTaskCaster on List<VTask>{
  List<P> pass<P extends VTask>()=>cast<P>();
}

/// データの型をエンティティから View State へ変換するプライベートメソッド
Map<Date, List<VDailyTask>> _convertToV(Map<Date, List<EDailyTask>> dMap) {
  // 表示するデータの枠
  final Map<Date, List<VDailyTask>> result = {};
  // データを日付ごとに変換していく
  for (final entry in dMap.entries) {
    // データの型を変換する
    final List<VDailyTask> convertedDataList =
    entry.value.map((EDailyTask eDailyTask) {
      return VDailyTask(
        title: eDailyTask.title,
        date: eDailyTask.date,
        id: eDailyTask.id,
        isChecked: eDailyTask.isChecked,
        labelId: eDailyTask.labelId,
      );
    }).toList();
    result[entry.key] = convertedDataList;
  }
  return result;
}