import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/presentation/view_state/v_label/v_label.dart';

part 'labels_view_model.g.dart';

/// todo 「ラベル化したタスク」の表示を管理するクラス（2026/09/08）＞＞
///
/// `ref.watch`で監視する際は、[Token] を用いて、呼び出し元のインスタンスにつき1つの
/// インスタンスを提供する（呼び出し元破棄時に autoDispose される）。
@riverpod
class LabelsViewModel extends _$LabelsViewModel {
  // todo 依存先
  // final ;

  // todo 初期化
  @override
  List<VLabel> build(Token token) {
    _initViewModel();
    return [VLabel.placeholder()];
  }

  /// この VM の新しいインスタンスが生成された時の初期化
  Future<void> _initViewModel() async{

  }

  /// [state] の更新
  void update(List<VLabel> newState) {
    state = newState;
  }
}
