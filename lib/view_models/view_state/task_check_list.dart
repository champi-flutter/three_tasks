
/// TasksView のチェックボックスの値の型
class TaskCheckList {
  /// タスク1のチェックボックスの値
  final bool check1;

  /// タスク2のチェックボックスの値
  final bool check2;

  /// タスク3のチェックボックスの値
  final bool check3;

  const TaskCheckList(this.check1, this.check2, this.check3);

  /// チェックボックスの値を変更
  TaskCheckList check (int position, bool value){
    assert(position >= 0 && position <= 2, "無効な数値です（TaskCheckList.check）");
    switch(position){
      case 0:
        return TaskCheckList(value, check2, check3);
      case 1:
        return TaskCheckList(check1, value, check3);
      case 2:
        return TaskCheckList(check1, check2, value);
      default:
        return TaskCheckList(check1, check2, check3);
    }
  }
}