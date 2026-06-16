import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:three_tasks/db/database.dart';
import 'package:three_tasks/main.dart';
import 'package:three_tasks/view/screens/review_screen.dart';
import 'history_screen.dart';

class MonthlyTasksScreen extends StatelessWidget  {
  // ドロップダウンのmenu
  var _menuItem = ["今月のタスクをレビュー", "先月のタスクをレビュー"];
  var _selectedValue = "";

  List<MonthlyTask> _taskForThisMonth = [];

  // TextEditingControllerのtextにリスト番号に合ったタスクを入れるためにStringのリストを作成
  List<String> _strMonthTask = [];

  // 達成しなかったタスク一覧に表示させるタスクのリスト
  List<MonthlyTask> _taskListForDialog = [];

  // チェックマークの有無
  List<bool> _isSelected = [false, false, false];

  bool _isEdited = false;

  late FocusNode _focusNode;

  // バナー広告の内容
  BannerAd? _ad;

  // バナー広告がロードされたかどうか
  bool _isAdLoaded = false;

  // インタースティシャル広告の内容
  InterstitialAd? _interstitialAd;

  int _toastCount = 0;

  // todo initState
  @override
  void initState() {
    super.initState();
    // _focusNode = [FocusNode(), FocusNode(), FocusNode()];
    _focusNode = FocusNode();
    // todo タスク取得
    _setItems();
  }

  // todo バナー広告Widget in build
  Widget _bannerAd() {
    return Builder(builder: (context) {
      // if (!_isAdLoaded) {
      //   return Center(
      //     child: Text(
      //       "Ads Not loaded.",
      //       textAlign: TextAlign.center,
      //       textScaler: TextScaler.linear(1.3),
      //     ),
      //   );
      // }
      // todo Loadされた広告を表示
      return Container(
        width: _isAdLoaded ? _ad!.size.width.toDouble() : double.infinity,
        height: 100.0,
        alignment: Alignment.center,
        child: _isAdLoaded ? AdWidget(ad: _ad!) : null,
      );
    });
  }

  // todo 「今月のタスク」をデータベースから取得するメソッド
  void _setItems() async {
    _taskForThisMonth = await database.allTasksForThisMonth;
    // 一度開けば""で保存されるので、lengthは0か3。
    if (_taskForThisMonth.length == 0) {
      var _firstMonthlyTasks = [
        MonthlyTasksCompanion.insert(
          task: "",
          month: thisMonth,
        ),
        MonthlyTasksCompanion.insert(
          task: "",
          month: thisMonth,
        ),
        MonthlyTasksCompanion.insert(
          task: "",
          month: thisMonth,
        ),
      ];
      await database.addBatchMonthlyTaskCompanions(_firstMonthlyTasks);

      _taskForThisMonth = await database.allTasksForThisMonth;
    }

    _strMonthTask = [
      _taskForThisMonth[0].task,
      _taskForThisMonth[1].task,
      _taskForThisMonth[2].task,
    ];
    _isSelected = [
      _taskForThisMonth[0].isChecked,
      _taskForThisMonth[1].isChecked,
      _taskForThisMonth[2].isChecked,
    ];
    setState(() {});
  }

  // todo 何をdisposeするか　＞＞
  @override
  void dispose() {
    // _focusNode
    //   ..[0].dispose()
    //   ..[1].dispose()
    //   ..[2].dispose();
    _focusNode.dispose();
    _ad?.dispose();
    _isAdLoaded = false;
    _interstitialAd?.dispose();
    super.dispose();
  }

  // todo build
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (
          bool didPop,
          result,
        ) {
          if (didPop) return;
          if (_isEdited) {
            _onPopped();
          } else {
            Navigator.pop(context);
          }
        },
        child: Scaffold(
          // todo AppBar
          appBar: AppBar(
            toolbarHeight: 56.h,
            centerTitle: true,
            title: const Text("今月のタスク"),
            actions: [
              _reviewButton(),
            ],
          ),

          resizeToAvoidBottomInset: false,

          body: SingleChildScrollView(
            child: Focus(
              focusNode: _focusNode,
              child: Center(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: _focusNode.requestFocus,
                      // onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                      behavior: HitTestBehavior.opaque,
                      child: Column(
                        children: [
                          // todo 余白
                          SizedBox(height: 30.0.h.h),

                          // todo 今週のタスク
                          _tasksForThisMonth(),

                          // todo 余白
                          SizedBox(height: 30.0.h.h),

                          // ボタンは揃えて配置
                          Container(
                            padding: EdgeInsets.all(4.0.r),
                            child: Column(
                              children: [
                                // todo 「下書き保存」ボタン
                                _saveButton(),

                                // todo 「達成されなかったタスク一覧」ボタン
                                _setButton(),

                                // todo 「履歴を参照」ボタン
                                _referButton(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // todo バナー広告
                    _bannerAd(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // todo appBarの戻るボタンWidget
  _onPopped() {
    // todo 確認ダイアログ
    // todo 編集してないときはダイアログなしにする　＞＞ _isEditedを使う
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text("現在の編集を破棄しますか？"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("編集を続ける"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(super.context);
              },
              child: const Text("破棄"),
            ),
          ],
        );
      },
    );
  }

  // todo レビュー画面遷移ボタンWidget
  Widget _reviewButton() {
    return PopupMenuButton(
      initialValue: _selectedValue,
      onSelected: (s) {
        setState(() {
          _selectedValue = s;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0.w),
        child: Icon(
          Icons.receipt_long,
          size: 30.0.dm,
        ),
      ),
      itemBuilder: (context) {
        return _menuItem.map((String s) {
          return PopupMenuItem(
            child: Text(s),
            value: s,
            onTap: () async {
              // _focusNode
              //   ..[0].unfocus()
              //   ..[1].unfocus()
              //   ..[2].unfocus();
              _focusNode.unfocus();
              _toastCount = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReviewScreen(
                    reviewStatus: ReviewStatus.month,
                    timeStatus: s == "今月のタスクをレビュー"
                        ? TimeStatus.now
                        : TimeStatus.previous,
                  ),
                ),
              );
            },
          );
        }).toList();
      },
    );
  }

  // todo 「今週のタスク」Widget
  Widget _tasksForThisMonth() {
    return Column(
      children: [
        ListView.builder(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemCount: _taskForThisMonth.length,
          itemBuilder: (context, int position) =>
              _tasksForThisMonthList(position),
        ),
      ],
    );
  }

  // todo リストタイル
  _tasksForThisMonthList(position) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0.h.h),
      key: Key("$position"),
      child: CheckboxListTile(
        value: _isSelected[position],
        onChanged: (newValue) {
          setState(() {
            _isEdited = true;
            _isSelected[position] = newValue!;
          });
        },
        controlAffinity: ListTileControlAffinity.leading,
        title: TextField(
          // controllerどうする？　＞＞　TextEditingControllerのtextにStringのリストを入れる
          controller: TextEditingController(
            // text: _strTaskForTomorrow(position: position),
            text: _strMonthTask[position],
            // text: "$position"
          ),
          style: TextStyle(fontSize: 17.0.sp),
          maxLines: null,
          // focusNode: _focusNode,
          decoration: InputDecoration(labelText: "タスク${position + 1}"),
          onChanged: (text) {
            _editTaskForThisMonth(text, position: position);
            _isEdited = true;
          },
          textInputAction: TextInputAction.done,
        ),
      ),
    );
  }

  // todo 「今週のタスク」変更処理
  _editTaskForThisMonth(text, {required position}) {
    _strMonthTask[position] = text;
    // setState(() {});
  }

  // todo 「下書き保存」ボタン
  Widget _saveButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0.h, horizontal: 8.0.w),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 90.h),
        ),
        onPressed: () async {
          // _focusNode
          //   ..[0].unfocus()
          //   ..[1].unfocus()
          //   ..[2].unfocus();
          _focusNode.unfocus();
          await _saveTasks();
          // todo ToastMessage「タスクを保存しました。」
        },
        child: Text(
          "下書き保存",
          style: TextStyle(
            fontSize: 25.0.sp,
          ),
        ),
      ),
    );
  }

  // todo 下書き保存メソッド
  _saveTasks() async {
    // この段階で表示されているリストの内容をデータベースに上書き保存
    var _firstTaskForThisMonth = MonthlyTask(
      task: _strMonthTask[0],
      month: thisMonth,
      id: _taskForThisMonth[0].id,
      isChecked: _isSelected[0],
      result: _taskForThisMonth[0].result,
      improvement: _taskForThisMonth[0].improvement,
    );
    var _secondTaskForThisMonth = MonthlyTask(
      task: _strMonthTask[1],
      month: thisMonth,
      id: _taskForThisMonth[1].id,
      isChecked: _isSelected[1],
      result: _taskForThisMonth[1].result,
      improvement: _taskForThisMonth[1].improvement,
    );
    var _thirdTaskForThisMonth = MonthlyTask(
      task: _strMonthTask[2],
      month: thisMonth,
      id: _taskForThisMonth[2].id,
      isChecked: _isSelected[2],
      result: _taskForThisMonth[2].result,
      improvement: _taskForThisMonth[2].improvement,
    );

    await database.updateMonthlyTask(_firstTaskForThisMonth);
    await database.updateMonthlyTask(_secondTaskForThisMonth);
    await database.updateMonthlyTask(_thirdTaskForThisMonth);

    Fluttertoast.showToast(
      msg: "タスクを保存しました。",
      gravity: ToastGravity.TOP,
      textColor: Theme.of(context).colorScheme.secondary,
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
    );

    setState(() {
      _isEdited = false;
    });

    // print("${}");
  }

  // todo 「達成されなかったタスク一覧」ボタン
  Widget _setButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0.h, horizontal: 8.0.w),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 90.h),
        ),
        onPressed: () async {
          // _focusNode
          //   ..[0].unfocus()
          //   ..[1].unfocus()
          //   ..[2].unfocus();
          _focusNode.unfocus();
          _taskListForDialog = await database.allMonthlyTasksNotAchieved;
          // 空を排除
          _taskListForDialog.removeWhere((value) => value.task == "");
          showDialog(
            // 別のところを押した時に戻らないようにする
            barrierDismissible: false,
            context: context,
            builder: (context) => _taskListDialog(_taskListForDialog),
          );
        },
        child: Text(
          "達成されなかったタスク一覧",
          style: TextStyle(
            fontSize: 25.0.sp,
          ),
        ),
      ),
    );
  }

  Widget _taskListDialog(List<MonthlyTask> taskList) {
    return SimpleDialog(
      title: const Text("達成されなかったタスク"),
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 16.0.h),
          child: Container(
            width: 30.w,
            height: 500.h,
            child: ListView.separated(
              physics: ScrollPhysics(),
              // shrinkWrap: true,
              itemCount: taskList.length,
              itemBuilder: (context, int position) => _taskNotAchievement(
                taskList[position].task,
                taskList[position].month,
              ),
              separatorBuilder: (context, index) => Divider(
                indent: 8,
                endIndent: 8,
                thickness: 2.0,
              ),
            ),
          ),
        ),
        // todo 戻るボタン
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: FloatingActionButton(
              mini: true,
              onPressed: () => Navigator.pop(context),
              child: const Icon(Icons.clear),
              elevation: 2,
            ),
          ),
        )
      ],
    );
  }

  Widget _taskNotAchievement(task, month) {
    return ListTile(
      dense: true,
      subtitle: Text(month),
      title: Text(
        "$task",
        style: TextStyle(fontSize: 12.0.sp),
      ),
      trailing: IconButton(
        onPressed: () {
          Fluttertoast.showToast(
            msg: "クリップボードにコピーしました",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
          );
          Clipboard.setData(ClipboardData(text: task));
          Navigator.pop(context);
        },
        icon: const Icon(Icons.copy),
      ),
    );
  }

  // todo 「履歴を参照」ボタン
  Widget _referButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0.h, horizontal: 8.0.w),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 90.h),
        ),
        onPressed: () async {
          // _focusNode
          //   ..[0].unfocus()
          //   ..[1].unfocus()
          //   ..[2].unfocus();
          _focusNode.unfocus();
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HistoryScreen(
                formatAtNavigation: TaskFormat.month,
              ),
            ),
          );
          for (int i = 0; i < 3; i++) {
            if (result[i]) {
              _updateCheck(i);
            }
          }
        },
        child: Text(
          "履歴を参照",
          style: TextStyle(
            fontSize: 25.0.sp,
          ),
        ),
      ),
    );
  }

  // 履歴画面で値を変更した場合の処理
  _updateCheck(int i) {
    setState(() {
      _isSelected[i] = !_isSelected[i];
    });
  }

// todo 1週間経つ前に通知
}
