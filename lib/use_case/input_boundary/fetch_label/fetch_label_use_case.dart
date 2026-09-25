
/// ラベルデータをフェッチするフロー
abstract class FetchLabelUseCase {
  /// ラベルデータをフェッチするフロー
  ///
  /// リポジトリからデータを取得し、Presenter に流す
  Future<void> execute();
}