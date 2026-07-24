/// TasksView のラベル化マークの値の型
class TaskLabelList {
  /// タスク1のラベルのID
  final int? label1;

  /// タスク2のラベルのID
  final int? label2;

  /// タスク3のラベルのID
  final int? label3;

  /// タスク1のラベル化マークの値
  bool get isLabeled1 => label1 != null;

  /// タスク2のラベル化マークの値
  bool get isLabeled2 => label2 != null;

  /// タスク3のラベル化マークの値
  bool get isLabeled3 => label3 != null;

  const TaskLabelList(this.label1, this.label2, this.label3);

  /// ラベル化マークの値を変更
  TaskLabelList label (int position, int? value){
    assert(position >= 0 && position <= 2, "無効な数値です（TaskLabelList.label）");
    switch(position){
      case 0:
        return TaskLabelList(value, label2, label3);
      case 1:
        return TaskLabelList(label1, value, label3);
      case 2:
        return TaskLabelList(label1, label2, value);
      default:
        return TaskLabelList(label1, label2, label3);
    }
  }
}