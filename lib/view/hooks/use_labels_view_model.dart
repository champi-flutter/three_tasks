

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/data_foundation/label_base/label_list.dart';
import 'package:three_tasks/presentation/view_model/labels_view_model/labels_view_model.dart';
import 'package:three_tasks/presentation/view_state/v_label/v_label.dart';

/// [LabelsViewModel] を監視する Hook
LabelList<VLabel> useLabelsViewModel(WidgetRef ref) {
  // 初回のみ Token を生成して保持
  final Token token = useMemoized(() => ref.generateToken());

  // ViewModel の状態を監視
  return ref.watch(labelsViewModelProvider(token));
}