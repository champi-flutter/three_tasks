
import 'package:three_tasks/domain/entity/e_label/e_label.dart';

abstract class LabelDraftRepository {


  /// 下書きを追加する
  Future<void> draftWith(ELabel eLabel);

  /// 下書きを取得する
  ///
  /// 下書きがない場合は、空のリストを返す。
  List<ELabel> getDraft ();


  void dispose();
}