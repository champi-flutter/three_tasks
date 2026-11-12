
/// 保留されているラベルの変更の保存を確定するフロー
abstract class SavePendingLabelUseCase {
  Future<void> execute();
}