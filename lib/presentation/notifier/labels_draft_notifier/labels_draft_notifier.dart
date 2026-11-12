


import 'package:three_tasks/presentation/view_state/v_label/v_label.dart';

abstract class LabelsDraftNotifier {

  /// 下書きを追加する
  Future<void> draftWith(VLabel vLabel);
}