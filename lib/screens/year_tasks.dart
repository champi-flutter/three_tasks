import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:three_tasks/db/database.dart';
import 'package:three_tasks/main.dart';
import 'package:three_tasks/screens/history_screen.dart';
import 'package:three_tasks/screens/review_screen.dart';

import '../ad_helper.dart';
import 'home_screen.dart';

class TasksForYear extends StatefulWidget {
  @override
  State<TasksForYear> createState() => _TasksForYearState();
}

class _TasksForYearState extends State<TasksForYear> {
  // Popupのmenu
  var _menuItem = ["今年のタスクをレビュー", "去年のタスクをレビュー"];
  var _selectedValue = "";

  List<YearlyTask> _taskForThisYear = [];

  // TextEditingControllerのtextにリスト番号に合ったタスクを入れるためにStringのリストを作成
  List<String> _strYearTask = [];

  // 達成しなかったタスク一覧に表示させるタスクのリスト
  List<YearlyTask> _taskListForDialog = [];

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

  // todo 「今月のタスク」をデータベースから取得するメソッド
  void _setItems() async {
    _taskForThisYear = await database.allTasksForThisYear;
    // 一度開けば""で保存されるので、lengthは0か3。
    if (_taskForThisYear.length == 0) {
      var _firstYearlyTasks = [
        YearlyTasksCompanion.insert(
          task: "",
          year: thisYear,
        ),
        YearlyTasksCompanion.insert(
          task: "",
          year: thisYear,
        ),
        YearlyTasksCompanion.insert(
          task: "",
          year: thisYear,
        ),
      ];
      await database.addBatchYearlyTaskCompanions(_firstYearlyTasks);

      _taskForThisYear = await database.allTasksForThisYear;
    }

    _strYearTask = [
      _taskForThisYear[0].task,
      _taskForThisYear[1].task,
      _taskForThisYear[2].task,
    ];
    _isSelected = [
      _taskForThisYear[0].isChecked,
      _taskForThisYear[1].isChecked,
      _taskForThisYear[2].isChecked,
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
            centerTitle: true,
            title: const Text("今年のタスク"),
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

                          // todo 今年のタスク
                          _tasksForThisYear(),

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
                // todo インタースティシャル広告
                if (interstitialStack % 4 == 0 && _interstitialAd == null) {
                  _loadInterstitialAd();
                }
              },
              child: const Text("破棄"),
            ),
          ],
        );
      },
    );
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
                    reviewStatus: ReviewStatus.year,
                    timeStatus: s == "今年のタスクをレビュー"
                        ? TimeStatus.now
                        : TimeStatus.previous,
                    toastCount: _toastCount,
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
  Widget _tasksForThisYear() {
    return Column(
      children: [
        ListView.builder(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemCount: _taskForThisYear.length,
          itemBuilder: (context, int position) =>
              _tasksForThisYearList(position),
        ),
      ],
    );
  }

  // todo リストタイル
  _tasksForThisYearList(position) {
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
            text: _strYearTask[position],
            // text: "$position"
          ),
          style: TextStyle(fontSize: 17.0.sp),
          maxLines: null,
          // focusNode: _focusNode,
          decoration: InputDecoration(labelText: "タスク${position + 1}"),
          onChanged: (text) {
            _editTaskForThisYear(text, position: position);
            _isEdited = true;
          },
          textInputAction: TextInputAction.done,
        ),
      ),
    );
  }

  // todo 「今週のタスク」変更処理
  _editTaskForThisYear(text, {required position}) {
    _strYearTask[position] = text;
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
    var _firstTaskForThisYear = YearlyTask(
      task: _strYearTask[0],
      year: thisYear,
      id: _taskForThisYear[0].id,
      isChecked: _isSelected[0],
      result: _taskForThisYear[0].result,
      improvement: _taskForThisYear[0].improvement,
    );
    var _secondTaskForThisYear = YearlyTask(
      task: _strYearTask[1],
      year: thisYear,
      id: _taskForThisYear[1].id,
      isChecked: _isSelected[1],
      result: _taskForThisYear[1].result,
      improvement: _taskForThisYear[1].improvement,
    );
    var _thirdTaskForThisYear = YearlyTask(
      task: _strYearTask[2],
      year: thisYear,
      id: _taskForThisYear[2].id,
      isChecked: _isSelected[2],
      result: _taskForThisYear[2].result,
      improvement: _taskForThisYear[2].improvement,
    );

    await database.updateYearlyTask(_firstTaskForThisYear);
    await database.updateYearlyTask(_secondTaskForThisYear);
    await database.updateYearlyTask(_thirdTaskForThisYear);

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
          _taskListForDialog = await database.allYearlyTasksNotAchieved;
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

  Widget _taskListDialog(List<YearlyTask> taskList) {
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
                taskList[position].year,
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

  Widget _taskNotAchievement(task, year) {
    return ListTile(
      dense: true,
      subtitle: Text(year),
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
                formatAtNavigation: TaskFormat.year,
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
