

import 'package:drift/drift.dart';

/// 各ページごとの設定項目
class PageSettings extends Table{
  /// 各ページの識別子
  IntColumn get pageId => integer()();

  /// 対象ページの自動保存オンオフ
  BoolColumn get primaryAutoSaves => boolean().withDefault(Constant(true))();

  /// 対象ページに対応するレビュー画面の自動保存オンオフ
  BoolColumn get reviewAutoSaves => boolean().withDefault(Constant(false))();
}