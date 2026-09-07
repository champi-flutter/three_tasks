
import 'package:custom_core_types/custom_core_types.dart';
import 'package:three_tasks/entities/e_task/converter/to_e_task.dart';
import 'package:three_tasks/entities/e_task/e_task.dart';
import 'package:three_tasks/infrastructure/gateway/dto/f_task/f_task.dart';

extension EDailyTaskDataEntry on List<FDailyTask>{

  /// [FDailyTask] のリストを [EDailyTask] の [DataEntry] に変換するメソッド
  DataEntry<int, EDailyTask> toDataEntry(int index)=>DataEntry<int, EDailyTask>(
    id: this[index].id,
    value: ToETask.toEDailyTask<FDailyTask>(this[index]),
  );
}