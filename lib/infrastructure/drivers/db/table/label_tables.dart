
import 'package:drift/drift.dart';

/// 2026/06/01 追加: ラベリングされたタスク
class LabeledTasks extends Table {
  // 主キー
  IntColumn get labeledId => integer().autoIncrement()();

  // ラベル
  TextColumn get label => text()();

  // 採用された日単位タスクの ID のリスト
  BlobColumn get dailyIdList =>
      blob().withDefault(Constant(Uint8List.fromList([])))();

  // 採用された週単位タスクの ID のリスト
  BlobColumn get weeklyIdList =>
      blob().withDefault(Constant(Uint8List.fromList([])))();

  // 採用された月単位タスクの ID のリスト
  BlobColumn get monthlyIdList =>
      blob().withDefault(Constant(Uint8List.fromList([])))();

  // 採用された年単位タスクの ID のリスト
  BlobColumn get yearlyIdList =>
      blob().withDefault(Constant(Uint8List.fromList([])))();
}