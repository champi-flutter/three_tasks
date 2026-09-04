import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/di/providers.dart';
import 'package:three_tasks/entities/view_type/v_label/v_labeled_task.dart';
import 'package:three_tasks/entities/view_type/v_task/v_task.dart';
import 'package:three_tasks/use_case/services/labeled_tasks_service.dart';

part 'labeled_tasks_view_model.g.dart';

/// 「ラベル化したタスク」の表示を管理するクラス
@riverpod
class LabeledTasksViewModel extends _$LabeledTasksViewModel {
  // todo 依存先
  /// [LabeledTasksService] のインスタンスを参照する内部的な getter
  ///
  /// このクラスはインスタンスを保有せず、毎回この getter で参照する。
  LabeledTasksService get _readLabeledTasksService =>
      ref.read(labeledTasksServiceProvider);

  /// ローディング機能へのアクセス
  LoadingService get _loader => ref.read(loadingServiceProvider);

  // todo 初期化
  @override
  List<VLabeledTask> build() {
    _initViewModel();
    return [VLabeledTask.placeholder()];
  }

  // region idWithSameTitleAs
  // /// 指定タイトル（[title]）と合致するラベルの ID を返す
  // ///
  // /// ない場合は、 `null` を返す。
  // int? idWithSameTitleAs(String title) {
  //   for (VLabeledTask labeledTask in state) {
  //     // 合致するラベルのIDを返す
  //     if (labeledTask.label == title) {
  //       return labeledTask.labelId;
  //     }
  //   }
  //   return null;
  // }
  // endregion

  /// このクラスの初期化
  void _initViewModel() {
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
  /// 指定タスクをラベル化するメソッド
  ///
  /// 新規ラベルの ID を返す。
  ///
  /// 例外が発生した場合は、`null` を返す。
  Future<int?> labeling({required VTask vTask}) => _loader
      .loadAsync<int?>(() => _readLabeledTasksService.labeling(vTask: vTask));

  /// タスクを既存のラベルに登録
  ///
  /// 指定ラベル（[labelId]）に、指定タスクのID（[vTask.id]）を追加する。
  ///
  /// 指定タスクの [DTask.labelId] に指定ラベルを登録する。
  Future<void> addToLabel({
    required VTask vTask,
    required int labelId,
  }) =>
      loadAsync(() async {
        await _readLabeledTasksService.addToLabel(
            vTask: vTask, labelId: labelId);
      });

  /// ラベル化解除メソッド
  ///
  /// 指定タスク（[vTask]）がこの段階で属しているラベルから、このタスクのIDを除外する。
  Future<void> unlabeling({
    required VTask vTask,
  }) =>
      loadAsync(() async {
        await _readLabeledTasksService.unlabeling(vTask: vTask);
      });

  // todo dispose
  /// このクラスのオブジェクトが破棄される際に呼び出す明示的な破棄
  void disposeViewModel() {
    _disposeSubscription();
  }
}
