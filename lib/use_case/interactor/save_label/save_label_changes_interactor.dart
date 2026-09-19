

import 'package:custom_core_types/custom_core_types.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/entities/e_task/e_task.dart';
import 'package:three_tasks/entities/view_state/v_task/v_task.dart';
import 'package:three_tasks/use_case/input_boundary/save_label/save_label_changes_use_case.dart';
import 'package:three_tasks/use_case/input_parameter/label_update_parameter/label_update_parameter.dart';
import 'package:three_tasks/use_case/repository_interface/data_repository.dart';

/// タスク ID をラベルに追加するフローを実装するクラス
class SaveLabelChangesInteractor with NotificationFromUseCase implements SaveLabelChangesUseCase {


  /// Gateway へのアクセス
  final DataRepository _repository;

  /// 通知機能呼び出し口
  @override
  final NotificationService notificationService;

  /// タスク ID をラベルに追加するフローを実装
  /// todo ラベル情報変更保存フローに変更（2026/09/09）＞＞
  ///  - [DataRepository] に、 [targetVTask] の ID の対象ラベルへの追加を依頼する
  ///  - ラベルキャッシュの更新処理を呼び出す
  @override
  Future<void> execute({
    required LabelUpdateParameter updateParameter,
  })
  // 折りたたみ用
  async{
    // リポジトリにタスクIDの指定ラベルへの追加を依頼する
    final Result<void, Exception> result = await _repository.addTaskIdToLabel(dTask: dTask, labelId: labelId);
  }
}