

import 'package:drift/drift.dart';

/// 各ページごとの設定項目
class PageSettings extends Table{
  /// 各ページの識別子
  IntColumn get pageId => integer()();

  /// 自動保存オンオフ
  BoolColumn get autoSave => boolean().withDefault(Constant(true))();
}