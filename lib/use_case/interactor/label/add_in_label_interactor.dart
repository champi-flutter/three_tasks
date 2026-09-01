

import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/entities/view_type/v_task.dart';
import 'package:three_tasks/use_case/input_boundary/label/add_in_label_use_case.dart';
import 'package:three_tasks/use_case/repository_interface/data_repository.dart';

/// タスク ID をラベルに追加するフローを実装するクラス
class AddInLabelInteractor with NotificationFromUseCase implements AddInLabelUseCase {


  /// Gateway へのアクセス
  final DataRepository _repository;

  /// 通知機能呼び出し口
  @override
  final NotificationService notificationService;

  /// todo タスク ID をラベルに追加するフローを実装（2026/09/01）＞＞
  ///  - [DataRepository] に、 [targetVTask] の ID の対象ラベルへの追加を依頼する
  ///  - ラベルキャッシュの更新処理を呼び出す
  @override
  Future<void> execute({
    required VTask targetVTask,
    required int targetLabelId,
  })
  // 折りたたみ用
  async{
    // TODO: implement execute
    throw UnimplementedError();
  }
}