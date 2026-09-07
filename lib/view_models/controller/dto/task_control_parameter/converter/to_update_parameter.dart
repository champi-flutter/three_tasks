
import 'package:three_tasks/entities/e_task/converter/to_e_task.dart';
import 'package:three_tasks/use_case/input_parameter/task_update_parameter.dart';
import 'package:three_tasks/view_models/controller/dto/task_control_parameter/task_control_parameter.dart';
import 'package:three_tasks/view_models/view_state/v_task/v_task.dart';

class ToUpdateParameter {
  static TaskUpdateParameter toUpdateParameter<V extends VTask>(TaskControlParameter controlParameter)=>TaskUpdateParameter(
    // todo （2026/09/07）＞＞
    targetTask: ToETask.toETask<V>(controlParameter.targetTask),
    newTitle: ,
    newChecked: ,
    newLabelId: ,
  );
}