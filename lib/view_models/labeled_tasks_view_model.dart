import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:three_tasks/di/providers.dart';
import 'package:three_tasks/entities/view_type/v_labeled_task.dart';
import 'package:three_tasks/entities/view_type/v_task.dart';
import 'package:three_tasks/use_case/services/labeled_tasks_service.dart';

part 'labeled_tasks_view_model.g.dart';

/// 「ラベル化したタスク」の表示を管理するクラス
@riverpod
class LabeledTasksViewModel extends _$LabeledTasksViewModel{
  // todo 依存先
  /// [LabeledTasksService] のインスタンスを参照する内部的な getter
  ///
  /// このクラスはインスタンスを保有せず、毎回この getter で参照する。
  LabeledTasksService get _readLabeledTasksService =>
      ref.read(labeledTasksServiceProvider);


  // todo 初期化
  @override
  List<VLabeledTask> build(){
    _initViewModel();
    return [];
  }
  /// このクラスの初期化
  void _initViewModel(){
    // 古い購読を破棄
    _disposeSubscription();
    // 購読を開始
    _initSubscription();
  }

  // todo キャッシュ関連
  /// 「ラベル化したタスク」のリスト
  List<VLabeledTask> _labeledTaskList = [];

  // todo getter（2026/06/02）＞＞

  /// キャッシュの変更の通知の購読
  StreamSubscription<List<VLabeledTask>>? _labeledTasksSubscription;

  /// 購読開始メソッド
  void _initSubscription() {
    _labeledTasksSubscription = _readLabeledTasksService.labeledTasksStream
        .listen(_handleLabeledTasksUpdating);
  }

  /// 新しいキャッシュを受信した際のハンドラ
  void _handleLabeledTasksUpdating(List<VLabeledTask> newDataList) {
    _labeledTaskList = [...newDataList];
  }

  /// 購読を破棄
  void _disposeSubscription() {
    _labeledTasksSubscription?.cancel();
  }

  // todo 書き換え
  Future<void> labeling({required VTask vTask}) async {
    await _readLabeledTasksService.labeling(vTask: vTask);
  }

  // todo dispose
  /// このクラスのオブジェクトが破棄される際に呼び出す明示的な破棄
  void disposeViewModel() {
    _disposeSubscription();
  }
}
