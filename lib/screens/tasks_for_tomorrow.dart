import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:three_tasks/db/database.dart';
import 'package:three_tasks/main.dart';
import 'package:three_tasks/screens/history_screen.dart';
import 'package:three_tasks/screens/home_screen.dart';

import '../ad_helper.dart';

class TasksForTomorrow extends StatefulWidget {
  const TasksForTomorrow({super.key});

  @override
  State<TasksForTomorrow> createState() => _TasksForTomorrowState();
}

class _TasksForTomorrowState extends State<TasksForTomorrow> {
  List<DayTask> _taskForTomorrow = [];

  // TextEditingController _firstController = TextEditingController();
  // TextEditingController _secondController = TextEditingController();
  // TextEditingController _thirdController = TextEditingController();

  // TextEditingControllerのtextにリスト番号に合ったタスクを入れるためにStringのリストを作成
  List<String> _strTaskForTomorrow = [];

  // 達成しなかったタスク一覧に表示させるタスクのリスト
  List<DayTask> _taskListForDialog = [];

  // String _firstTaskForTomorrow = "";
  // String _secondTaskForTomorrow = "";
  // String _thirdTaskForTomorrow = "";

  // TextEditingController _controller = TextEditingController();

  List<String> _reorderedTask = ["", "", ""];

  List<bool> _isReordered = [false, false, false];

  bool _isEdited = false;

  // bool _isDiscard = true;

  // List<FocusNode> _focusNode = [];
  late FocusNode _focusNode;

  // バナー広告の内容
  BannerAd? _ad;

  // バナー広告がロードされたかどうか
  bool _isAdLoaded = false;

  // インタースティシャル広告の内容
  InterstitialAd? _interstitialAd;

  // todo initState
  @override
  void initState() {
    super.initState();
    // _focusNode = [FocusNode(), FocusNode(), FocusNode()];
    _focusNode = FocusNode();
    // todo バナー広告のロード
    _loadBannerAd();
    // todo タスク取得
    _setItems();
  }

  // todo バナー広告をロードするメソッド in initState
  _loadBannerAd() {
    // await _initGoogleMobileAds();
    BannerAd(
      size: AdSize.banner,
      adUnitId: AdHelper.bannerAdUnitId,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          // Loadが完了したらリビルド
          setState(() {
            _ad = ad as BannerAd;
            _isAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          // 失敗時の処理
          ad.dispose();
          print(
            "Ad load failed (code = ${error.code} message = ${error.message})",
          );
        },
      ),
      request: AdRequest(),
    ).load();
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

  // todo インタースティシャル広告をロードするメソッド
  _loadInterstitialAd() {
    print("${interstitialStack}");
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback;
          ad.show();
          // Loadが完了したらリビルド
          setState(() {
            _interstitialAd = ad;
          });
        },
        onAdFailedToLoad: (error) {
          // 失敗時の処理
          print(
            "Ad load failed (code = ${error.code} message = ${error.message})",
          );
        },
      ),
      request: AdRequest(),
    );
  }

  // todo 「明日のタスク」をデータベースから取得するメソッド
  void _setItems() async {
    // todo DateTime.now().dayでは、年と月がわからない。 ＞＞ intlでStringに変換
    // todo DateTime.now().day + 1 では、月の最終日の次の日を正確に取れない。 ＞＞　intlでStringに変換

    _taskForTomorrow = await database.allTasksForTomorrow;
    // 一度開けば""で保存されるので、lengthは0か3。
    if (_taskForTomorrow.length == 0) {
      // _taskForTomorrow = [
      //   DayTask(task: "", date: tomorrow),
      //   DayTask(task: "", date: tomorrow),
      //   DayTask(task: "", date: tomorrow),
      // ];

      await database.batch((batch) {
        batch.insertAll(database.dayTasks, [
          DayTasksCompanion.insert(task: "", date: tomorrow),
          DayTasksCompanion.insert(task: "", date: tomorrow),
          DayTasksCompanion.insert(task: "", date: tomorrow),
        ]);
      });

      // await database.into(database.dayTasks).insert(
      //       DayTasksCompanion.insert(task: "", date: tomorrow),
      //     );
      // await database.into(database.dayTasks).insert(
      //       DayTasksCompanion.insert(task: "", date: tomorrow),
      //     );
      // await database.into(database.dayTasks).insert(
      //       DayTasksCompanion.insert(task: "", date: tomorrow),
      //     );

      // await database.addDayTask(_taskForTomorrow[0]);
      // await database.addDayTask(_taskForTomorrow[1]);
      // await database.addDayTask(_taskForTomorrow[2]);

      _taskForTomorrow = await database.allTasksForTomorrow;
    }

    // _firstController.text = _taskForTomorrow[0].task;
    // _secondController.text = _taskForTomorrow[1].task;
    // _thirdController.text = _taskForTomorrow[2].task;

    _strTaskForTomorrow = [
      _taskForTomorrow[0].task,
      _taskForTomorrow[1].task,
      _taskForTomorrow[2].task,
    ];

    setState(() {});
  }

  @override
  void dispose() {
    // _focusNode
    //   ..[0].dispose()
    //   ..[1].dispose()
    //   ..[2].dispose();
    _focusNode.dispose();
    _ad?.dispose();
    _isAdLoaded = false;
    super.dispose();
  }

  // todo build
  @override
  Widget build(BuildContext context) {
    // todo 「明日のタスク」をデータベースから取得
    // _setItems();

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
            // todo インタースティシャル広告
            if (interstitialStack % 4 == 0 && _interstitialAd == null) {
              _loadInterstitialAd();
            }
          }
        },
        child: Scaffold(
          // todo AppBar
          appBar: AppBar(
            toolbarHeight: 56.h,
            // foregroundColor: _isGetColor
            //     ? Color(_themeColor[0].onPrimaryNum)
            //     : Theme.of(context).primaryColor,
            // backgroundColor: _isGetColor
            //     ? Color(_themeColor[0].primaryNum)
            //     : Theme.of(context).canvasColor,
            centerTitle: true,
            title: const Text("明日のタスク"),
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

                          // todo 明日のタスク
                          _tasksForTomorrow(),

                          // todo 余白
                          SizedBox(height: 30.0.h.h),

                          // ボタンは揃えて配置
                          Padding(
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
          content: Text("現在の編集を破棄しますか？"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("編集を続ける"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(super.context);
                // todo インタースティシャル広告
                if (interstitialStack % 4 == 0 && _interstitialAd == null) {
                  _loadInterstitialAd();
                }
              },
              child: Text("破棄"),
            ),
          ],
        );
      },
    );
  }

  // todo 「明日のタスク」Widget
  // todo ListViewにしたら未記入のリストができない。＞＞ nullじゃなくて text:"" にすればいい。
  Widget _tasksForTomorrow() {
    return Column(
      children: [
        ReorderableListView.builder(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemCount: _taskForTomorrow.length,
          itemBuilder: (context, int position) =>
              _tasksForTomorrowList(position),
          onReorder: (int oldIndex, int newIndex) {
            _onReorder(_taskForTomorrow, oldIndex, newIndex);
            _isEdited = true;
          },
        ),
      ],
    );
  }

  // todo リストタイル
  _tasksForTomorrowList(position) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0.h.h),
      key: Key("$position"),
      child: ListTile(
        leading: const Icon(Icons.task),
        title: TextField(
          // todo controllerどうする？　＞＞　TextEditingControllerのtextにStringのリストを入れる
          controller: TextEditingController(
            // text: _strTaskForTomorrow(position: position),
            text: _isReordered[position]
                ? _reorderedTask[position]
                : _strTaskForTomorrow[position],
            // text: "$position"
          ),
          style: TextStyle(fontSize: 17.0.sp),
          maxLines: null,
          // focusNode: _focusNode,
          decoration: InputDecoration(labelText: "タスク${position + 1}"),
          onChanged: (text) {
            _editTaskForTomorrow(text, position: position);
            _isEdited = true;
          },
          textInputAction: TextInputAction.next,
        ),
      ),
    );
  }

  // todo 並べ替え処理
  void _onReorder(List<DayTask> task, int oldIndex, int newIndex) {
    // final movedTask = task[oldIndex].task;
    // final changedTask = task[newIndex].task;

    print("oldIndexは、 ${oldIndex}, newIndexは、 ${newIndex} です。");

    // リストの並べ替え
    if (oldIndex < newIndex) {
      newIndex -= 1;
      print("oldIndex: ${oldIndex}, newIndex: ${newIndex}");
    }
    final removedTask = task.removeAt(oldIndex);
    task.insert(newIndex, removedTask);
    // print("${task}");
    // print("${[...task]}");
    // task = [...task..insert(newIndex, removedTask)];
    // print("${task}");

    _reorderedTask[oldIndex] = task[oldIndex].task;
    _reorderedTask[newIndex] = task[newIndex].task;

    _isReordered[oldIndex] = true;
    _isReordered[newIndex] = true;

    print((oldIndex - newIndex).abs());
    if ((oldIndex - newIndex).abs() >= 2) {
      // 本来ならnewIndexの方が大きい場合と小さい場合に分けて、間の数だけ繰り返し処理を行うべき
      _reorderedTask[1] = task[1].task;
      _isReordered[1] = true;
    }

    setState(() {});

    // _strTaskForTomorrow[newIndex] = movedTask;
    // _strTaskForTomorrow[oldIndex] = changedTask;

    // todo reorderした後の表示がおかしい（_strTaskForTomorrowは変更されているのに表示に反映されてない）　＞＞ _reorderedTaskを使う
    // todo positionはreorder前後で変わらない
    // todo タスク1 → タスク3の並べ替えもおかしい（reorderにおいて、値の入れ替えは不適切）　＞＞　oldIndexとnewIndexが逆（公式のミス？）
  }

  // todo 「明日のタスク」変更処理
  _editTaskForTomorrow(text, {required position}) {
    _strTaskForTomorrow[position] = text;
    _isReordered[position] = false;
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
          Fluttertoast.showToast(
            msg: "タスクを保存しました。",
            gravity: ToastGravity.TOP,
            textColor: Theme.of(context).colorScheme.secondary,
            backgroundColor: Theme.of(context).colorScheme.onSecondary,
          );
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
    // この段階で表示されているリストの内容（task, date, id）をデータベースに上書き保存
    var firstTaskForTomorrow = DayTask(
      task: _strTaskForTomorrow[0],
      date: tomorrow,
      id: _taskForTomorrow[0].id,
      isChecked: _taskForTomorrow[0].isChecked,
    );
    var secondTaskForTomorrow = DayTask(
      task: _strTaskForTomorrow[1],
      date: tomorrow,
      id: _taskForTomorrow[1].id,
      isChecked: _taskForTomorrow[1].isChecked,
    );
    var thirdTaskForTomorrow = DayTask(
      task: _strTaskForTomorrow[2],
      date: tomorrow,
      id: _taskForTomorrow[2].id,
      isChecked: _taskForTomorrow[2].isChecked,
    );

    await database.updateDayTask(firstTaskForTomorrow);
    await database.updateDayTask(secondTaskForTomorrow);
    await database.updateDayTask(thirdTaskForTomorrow);

    setState(() {
      _isEdited = false;
    });

    _taskForTomorrow = await database.allTasksForTomorrow;

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
          _taskListForDialog = await database.allTasksNotAchieved;
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
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  HistoryScreen(formatAtNavigation: TaskFormat.date),
            ),
          );
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

  Widget _taskListDialog(List<DayTask> taskList) {
    return SimpleDialog(
      title: Text("達成されなかったタスク"),
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
                taskList[position].date,
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
              child: Icon(Icons.clear),
              elevation: 2,
            ),
          ),
        )
      ],
    );
  }

  Widget _taskNotAchievement(task, date) {
    return ListTile(
      dense: true,
      subtitle: Text(date),
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
          // クリップボードにコピーする処理
          Clipboard.setData(ClipboardData(text: task));
          Navigator.pop(context);
        },
        icon: Icon(Icons.copy),
      ),
    );
  }

// String _strTaskForTomorrow({required position}) {
//   var result;
//   switch (position) {
//     case 0:
//       result = _firstTaskForTomorrow;
//       break;
//     case 1:
//       result = _secondTaskForTomorrow;
//       break;
//     case 2:
//       result = _thirdTaskForTomorrow;
//       break;
//   }
//   return result;
// }
}
