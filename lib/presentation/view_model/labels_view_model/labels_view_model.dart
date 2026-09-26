import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/data_foundation/label_base/label_list.dart';
import 'package:three_tasks/di/use_case_providers/use_case_providers.dart';
import 'package:three_tasks/presentation/view_state/v_label/v_label.dart';
import 'package:three_tasks/use_case/input_boundary/fetch_label/fetch_label_use_case.dart';

part 'labels_view_model.g.dart';

/// 「ラベル化したタスク」の表示を管理するクラス
///
/// `ref.watch`で監視する際は、[Token] を用いて、呼び出し元のインスタンスにつき1つの
/// インスタンスを提供する（呼び出し元破棄時に autoDispose される）。
///
/// Fetch が完了するまで、[VLabel.placeholder] が返される。
@riverpod
class LabelsViewModel extends _$LabelsViewModel {
  // todo 初期化
  @override
  LabelList<VLabel>? build(Token token) {
    _initViewModel();

    return null;
  }

  /// Token（[build] の引数）を指定して、[FetchLabelUseCase] を参照する getter
  FetchLabelUseCase get _fetchLabelUseCase =>
      ref.read(fetchLabelUseCaseProvider(token));

  /// この VM の新しいインスタンスが生成された時の初期化
  Future<void> _initViewModel() async {
    await _fetchLabelUseCase.execute();
  }

  /// [state] の更新
  void update(LabelList<VLabel> newState) {
    state = newState;
  }
}
