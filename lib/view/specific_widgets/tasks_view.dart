import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/entities/view_type/v_task.dart';

/// [TasksView] の表示形式
///  - [TasksViewStyle.checkbox] : チェックボックス付き
///  - [TasksViewStyle.icon] : チェエクボックスなし（アイコン付き）
enum TasksViewStyle {
  checkbox,
  icon
}

/// チェックボックス付きタスク入力欄
class TasksView extends StatelessWidget {
  const TasksView.checkbox({
    required this.taskList,
    required this.onSaveTask,
    required this.onCheckChanged,
    required this.onLabeled,
    required this.onJustEdited,
  })
      : assert(
  onCheckChanged != null,
  "チェックボックス更新時の処理が設定されていません。",
  ),
        tasksViewStyle = TasksViewStyle.checkbox,
        assert(
        onSaveTask != null || onJustEdited != null,
        "自動保存における編集フラグのコールバックが設定されていません。",
        ),
        _isAutoSave = onSaveTask != null;

  const TasksView.icon({
    required this.taskList,
    required this.onSaveTask,
    required this.onLabeled,
    required this.onJustEdited,
  })
      : tasksViewStyle = TasksViewStyle.icon,
        onCheckChanged = null,
        assert(
        onSaveTask != null || onJustEdited != null,
        "自動保存における編集フラグのコールバックが設定されていません。",
        ),
        _isAutoSave = onSaveTask != null;

  final TasksViewStyle tasksViewStyle;

  /// タスクのリスト
  final List<VTask> taskList;

  /// 入力欄に値を入力した状態でフォーカスを外したときの自動保存ロジック
  final Future<void> Function(int position, String value)? onSaveTask;

  /// 自動保存でない場合に、編集を加えたときの処理
  final VoidCallback? onJustEdited;

  /// 自動保存かどうか
  final bool _isAutoSave;

  /// ラベル化処理
  final Future<void> Function(int position, bool value) onLabeled;

  /// チェックボックスの値が更新される時の処理
  final Future<void> Function(int position, bool value)? onCheckChanged;

  @override
  Widget build(BuildContext context) {
    switch (tasksViewStyle) {
      case TasksViewStyle.checkbox:
        return ListView.builder(
          itemCount: 3,
          itemBuilder: (context, position) =>
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0.h),
                child: _CheckableTaskField(
                  position: position,
                  taskTitle: taskList[position].task,
                  isTaskChecked: taskList[position].isChecked,
                  isTaskLabeled: taskList[position].isLabeled(
                    // todo ラベル化タスクリスト（2026/06/16）＞＞
                    labeledTaskList:,
                  ),
                  onSaveTask: _isAutoSave ? (String value) =>
                      onSaveTask!(position, value) : null,
                  onLabeled: (bool value) => onLabeled(position, value),
                  onCheckChanged: _isAutoSave? (bool value) =>
                      onCheckChanged!(position, value) : null,
                ),
              ),
        );
      case TasksViewStyle.icon:
        return ListView.builder(
          itemCount: 3,
          itemBuilder: (context, position) =>
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0.h),
                child: _IconTaskField(
                  position: position,
                  taskTitle: taskList[position].task,
                  isTaskLabeled: taskList[position].isLabeled(
                    // todo ラベル化タスクリスト（2026/06/16）＞＞
                    labeledTaskList:,),
                  onSaveTask: _isAutoSave ? (String value) =>
                      onSaveTask!(position, value) : null,
                  onLabeled: (bool value) => onLabeled(position, value),
                ),
              ),
        );
    }
  }
}

/// 各タスク入力欄
class _TaskField extends HookConsumerWidget {
  const _TaskField({
    required this.position,
    required this.taskTitle,
    required this.onSaveTask,
  });

  /// タスクのリスト番号
  final int position;

  /// タスクタイトル
  final String taskTitle;

  /// タスクを保存する処理
  final Future<void> Function(String)? onSaveTask;

  // フォーカスが外れたことをフラグに、その段階での入力値を保存する処理を起動するハンドラ
  Future<void> _handleSave(String value) async {
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // タスクのコントローラ
    // この text の変更はリビルドのフラグにしない（フラグはフォーカスが外れたこと）
    final TextEditingController taskController =
    useNonReactiveTextController(text: taskTitle);

    // この TextField のフォーカス
    final focusNode = useFocusNode();

    // focusNode の状態を監視
    useEffect(() {
      // フォーカスが解除された際に、そのときの入力値を保存
      Future<void> listenUnfocused() async {
        if (!focusNode.hasFocus) {
          _print(
            "フォーカスが解除された際に、そのときの入力値を保存",
            "保存される入力値: ${taskController.text}",
          );
          // 最後に保存した値から変化しているかどうか
          final bool isChanged = taskController.text != taskTitle;
          // 自動保存オンのときの保存処理
          if (isChanged && onSaveTask != null) {
            // 編集未保存フラグをおろす
            ref.read(editSavingControllerProvider.notifier).onSaved();
            // 自動保存
            await onSaveTask!(taskController.text);
          }
        }
      }

      // リスナーを登録
      focusNode.addListener(listenUnfocused);
      // リスナーを破棄（クリーンアップ）
      return () => focusNode.removeListener(listenUnfocused);
    }, [focusNode]);

    // TextField への入力以外で入力欄に入れる値（taskTitle）が変化した場合（遅延初期化、
    // データ元の変更、など）に対応
    useEffect(() {
      if (taskController.text != taskTitle) {
        _print(
            "TextField への入力以外で入力欄に入れる値（taskTitle）が変化した場合");
        // 入力欄の値を更新
        taskController.text = taskTitle;
      }
      return null;
    }, [taskTitle]);

    // 入力欄本体
    return TextFieldTapRegion(
      // この領域の「外」がタップされたらフォーカスを外す
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      child: TextField(
        maxLines: null,
        decoration: InputDecoration(
          labelText: "タスク${position + 1}",
          // contentPadding: EdgeInsets.all(0),
        ),
        controller: taskController,
        style: TextStyle(fontSize: 17.0.sp),
        textInputAction: TextInputAction.done,
        // エンターキー等で、入力完了によってフォーカスが外れるようにする
        onSubmitted: (_) {
          focusNode.unfocus();
        },
        // 入力欄に文字を入力したときに、編集未保存フラグを立てる。
        onChanged: (String value){
          ref.read(editSavingControllerProvider.notifier).onEdited();
        },
      ),
    );
  }
}

/// チェックボックス付きタスク入力欄
class _CheckableTaskField extends HookConsumerWidget {
  const _CheckableTaskField({
    required this.position,
    required this.taskTitle,
    required this.isTaskChecked,
    required this.isTaskLabeled,
    required this.onSaveTask,
    required this.onLabeled,
    required this.onCheckChanged,
  });

  /// タスクのリスト番号
  final int position;

  /// タスクタイトル
  final String taskTitle;

  /// チェックボックスの値
  final bool isTaskChecked;

  /// ラベル化されているかどうか
  final bool isTaskLabeled;

  /// タスクを保存する処理
  final Future<void> Function(String)? onSaveTask;

  /// ラベル化処理
  final Future<void> Function(bool value) onLabeled;

  /// チェックボックスの値が更新される時の処理
  final Future<void> Function(bool)? onCheckChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // チェックボックスの値
    final isChecked = useState<bool>(isTaskChecked);

    // ラベル化されているかどうか
    final isLabeled = useState<bool>(isTaskLabeled);

    return CheckboxListTile(
      title: _TaskField(
        position: position,
        taskTitle: taskTitle,
        onSaveTask: onSaveTask,
      ),
      value: isChecked.value,
      // チェックボックスが leading （左）側
      controlAffinity: ListTileControlAffinity.leading,
      // チェエクボックス変更時
      onChanged: (bool? value) async {
        if (isChecked.value != value!) {
          isChecked.value = value;

          // 自動保存オンの場合
          if(onCheckChanged != null) {
            // 自動保存
            await onCheckChanged!(value);
          }
          // 自動保存オフの場合
          else{
            // 編集未保存フラグを立てる
            ref.read(editSavingControllerProvider.notifier).onEdited();
          }
        }
      },
      // trailing （右）側の Widget
      secondary: IconButton(
        // ラベル化済みなら塗りつぶし
        icon: isLabeled.value ? Icon(Icons.bookmark)
            : Icon(Icons.bookmark_add_outlined,),
        onPressed: () {
          // todo 確認ダイアログ（2026/06/16）＞＞
          // bool 値を変換
          isLabeled.value = !isLabeled.value;
          // 変換後の bool 値でラベル化処理
          onLabeled(isLabeled.value);
        },
      ),
    );
  }
}

class _IconTaskField extends HookWidget {
  const _IconTaskField({
    required this.position,
    required this.taskTitle,
    required this.isTaskLabeled,
    required this.onSaveTask,
    required this.onLabeled,
  });

  /// タスクのリスト番号
  final int position;

  /// タスクタイトル
  final String taskTitle;

  /// ラベル化されているかどうか
  final bool isTaskLabeled;

  /// タスクを保存する処理
  final Future<void> Function(String value)? onSaveTask;

  /// ラベル化処理
  final Future<void> Function(bool value) onLabeled;

  @override
  Widget build(BuildContext context) {
    // ラベル化されているかどうか
    final isLabeled = useState<bool>(isTaskLabeled);

    return ListTile(
      leading: const Icon(Icons.task),
      title: _TaskField(
        position: position,
        taskTitle: taskTitle,
        onSaveTask: onSaveTask,
      ),
      trailing: IconButton(
        // ラベル化済みなら塗りつぶし
        icon: isLabeled.value ? Icon(Icons.bookmark)
            : Icon(Icons.bookmark_add_outlined,),
        onPressed: () {
          // todo 確認ダイアログ（2026/06/16）＞＞
          // bool 値を変換
          isLabeled.value = !isLabeled.value;
          // 変換後の bool 値でラベル化処理
          onLabeled(isLabeled.value);
        },
      ),
    );
  }
}


/// printメソッド [tasks_view.dart]
void _print(String s1, [String? s2, String? s3, String? s4, String? s5]) {
  if (kDebugMode) {
    print("");
    print("[tasks_view.dart]　" + s1);
    if (s2 != null) print("[tasks_view.dart]　" + s2);
    if (s3 != null) print("[tasks_view.dart]　" + s3);
    if (s4 != null) print("[tasks_view.dart]　" + s4);
    if (s5 != null) print("[tasks_view.dart]　" + s5);
    print("");
  }
}
