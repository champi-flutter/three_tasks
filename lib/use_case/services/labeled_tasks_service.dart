import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:three_tasks/di/providers.dart';
import 'package:three_tasks/entities/data_type/d_labeled_task.dart';
import 'package:three_tasks/entities/view_type/v_labeled_task.dart';
import 'package:three_tasks/use_case/repository_interface/data_repository.dart';

/// 「ラベル化したタスク」サービスクラス
class LabeledTasksService {
  // todo コンストラクタ
  LabeledTasksService(this._ref){
    _initService();
  }

  // todo 依存先
  final Ref _ref;

  /// [DataRepository] のインスタンスを参照する内部的な getter
  ///
  /// このクラスはインスタンスを保有せず、毎回この getter で参照する。
  DataRepository get _readRepository => _ref.read(dataRepositoryProvider);

  // todo 初期化
  /// このクラスの初期化
  void _initService(){
    // 古い購読を破棄
    _disposeSubscription();
    // 購読を開始
    _initSubscription();
  }

  // todo キャッシュ
  /// 購読の枠
  StreamSubscription<List<DLabeledTask>>? _labeledTasksSubscription;

  /// データのストリームを管理するコントローラ
  final StreamController<List<VLabeledTask>> _labeledTasksController =
      BehaviorSubject<List<VLabeledTask>>();

  /// 「ラベル化したタスク」のキャッシュが更新された際に、その情報を流すストリーム
  Stream<List<VLabeledTask>> get labeledTasksStream =>
      _labeledTasksController.stream;

  /// 購読を開始
  void _initSubscription() {
    _labeledTasksSubscription =
        _readRepository.labeledTasksStream.listen(_handleLabeledTasksUpdating);
  }

  /// 購読を破棄
  void _disposeSubscription(){
    _labeledTasksSubscription?.cancel();
  }

  /// 受信データを表示用のデータ型に変換して、ストリームに流すハンドラ
  void _handleLabeledTasksUpdating(List<DLabeledTask> newDataList) {
    try {
      // 受信データを表示用のデータ型に変換
      final List<VLabeledTask> convertedData =
          [...newDataList].map((DLabeledTask newData) {
        return VLabeledTask(
          label: newData.label,
          taskId: newData.taskId,
          dailyIdList: newData.dailyIdList,
          weeklyIdList: newData.weeklyIdList,
          monthlyIdList: newData.monthlyIdList,
          yearlyIdList: newData.yearlyIdList,
        );
      }).toList();
      // 変換後のデータをストリームに流す
      _labeledTasksController.add([...convertedData]);
    } catch (e) {
      // todo エラーハンドリング（2026/06/02）＞＞
    }
  }

  // todo dispose
  /// このクラスのオブジェクトが破棄される際に呼び出す明示的な破棄
  void disposeService(){
    _disposeSubscription();
  }
}
