

class PageSettingControlParameter {
  const PageSettingControlParameter({
    this.primaryAutoSaves,
    this.reviewAutoSaves,
  });

  /// 対象ページの自動保存オンオフ
  final bool? primaryAutoSaves;

  /// 対象ページに対応するレビュー画面の自動保存オンオフ
  final bool? reviewAutoSaves;
}
