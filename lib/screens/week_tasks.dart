import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:three_tasks/db/database.dart';
import 'package:three_tasks/main.dart';
import 'package:three_tasks/screens/history_screen.dart';
import 'package:three_tasks/screens/review_screen.dart';

import '../ad_helper.dart';
import 'home_screen.dart';

// 週の初め
int _firstDay = 0;

int get firstDay => _firstDay;

int _firstWeekday = 0;

int get firstWeekday => _firstWeekday;

class TasksForWeek extends StatefulWidget {
  @override
  State<TasksForWeek> createState() => _TasksForWeekState();
}

class _TasksForWeekState extends State<TasksForWeek> {
  // ドロップダウンのmenu
  var _menuItem = ["今週のタスクをレビュー", "先週のタスクをレビュー"];
  var _selectedValue = "";

  List<WeeklyTask> _taskForThisWeek = [];

  // TextEditingControllerのtextにリスト番号に合ったタスクを入れるためにStringのリストを作成
  List<String> _strWeekTask = [];

  // 達成しなかったタスク一覧に表示させるタスクのリスト
  List<WeeklyTask> _taskListForDialog = [];

  // チェックマークの有無
  List<bool> _isSelected = [false, false, false];

  bool _isEdited = false;

  late FocusNode _focusNode;

  // 週の初めの日を継続するかどうか
  bool _isContinued = true;

  // 週の初めの日の月
  int _monthOfFirstDay = 0;
  DateTime _selectedDayAtCalendar = now;

  List<WeeklyTask> _lastWeekTask = [];

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

    print("今週：$thisWeek");
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

  // todo 「今週のタスク」をデータベースから取得するメソッド
  void _setItems() async {
    // todo DateTime.now().dayでは、年と月がわからない。 ＞＞ intlでStringに変換
    // todo DateTime.now().day + 1 では、月の最終日の次の日を正確に取れない。 ＞＞　intlでStringに変換

    if (now.day > 7) {
      _taskForThisWeek = await database.allTasksForThisWeek;
    } else {
      _taskForThisWeek = await database.allTasksForThisWeek;
      if (_taskForThisWeek.length == 0) {
        _taskForThisWeek = await database.allTasksForEndingWeek;
      }
    }
    // 一度開けば""で保存されるので、lengthは0か3。
    print('''now.day: ${now.day}
    length: ${_taskForThisWeek.length}
    一度開けば""で保存されるので、lengthは0か3。''');
    if (_taskForThisWeek.length == 0) {
      var _firstWeeklyTasks = [
        WeeklyTasksCompanion.insert(
          task: "",
          week: thisWeek,
          firstDay: now.day,
        ),
        WeeklyTasksCompanion.insert(
          task: "",
          week: thisWeek,
          firstDay: now.day,
        ),
        WeeklyTasksCompanion.insert(
          task: "",
          week: thisWeek,
          firstDay: now.day,
        ),
      ];
      await database.addBatchWeeklyTaskCompanions(_firstWeeklyTasks);

      if (now.day > 7) {
        _taskForThisWeek = await database.allTasksForThisWeek;
      } else {
        _taskForThisWeek = await database.allTasksForThisWeek;
        if (_taskForThisWeek.length == 0) {
          _taskForThisWeek = await database.allTasksForEndingWeek;
        }
      }
      print(
          "今日の-7日：${DateTime(now.year, now.month, now.day).add(Duration(days: -7)).day}");
      print("    length: ${_taskForThisWeek.length}");
    }

    _strWeekTask = [
      _taskForThisWeek[0].task,
      _taskForThisWeek[1].task,
      _taskForThisWeek[2].task,
    ];
    _isSelected = [
      _taskForThisWeek[0].isChecked,
      _taskForThisWeek[1].isChecked,
      _taskForThisWeek[2].isChecked,
    ];

    _firstDay = _taskForThisWeek[0].firstDay;

    _monthOfFirstDay = _taskForThisWeek[0].month;

    // todo 月の初めは？
    if (now.day - firstDay > 7) {
      _firstDay = 0;
    }

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
    _isContinued = true;
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
            title: const Text("今週のタスク"),
            actions: [
              _reviewButton(),
            ],
          ),

          resizeToAvoidBottomInset: false,

          // todo body
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
                          _tasksForThisWeek(),

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
                    reviewStatus: ReviewStatus.week,
                    timeStatus: s == "今週のタスクをレビュー"
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

  // todo レビュー画面遷移ボタン(previous)Widget
  Widget _reviewButtonForPrevious() {
    return TextButton(
      onPressed: () async {
        // _focusNode
        //   ..[0].unfocus()
        //   ..[1].unfocus()
        //   ..[2].unfocus();
        _focusNode.unfocus();
        _toastCount = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReviewScreen(
              reviewStatus: ReviewStatus.week,
              timeStatus: TimeStatus.previous,
              toastCount: _toastCount,
            ),
          ),
        );
      },
      child: const Text("先週のタスクをレビュー"),
      // child: Text(
      //   "レビュー",
      //   style: TextStyle(
      //     color: Colors.white,
      //     fontSize: 18,
      //   ),
      // ),
    );
  }

  // todo 「今週のタスク」Widget
  Widget _tasksForThisWeek() {
    return Column(
      children: [
        ListView.builder(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemCount: _taskForThisWeek.length,
          itemBuilder: (context, int position) =>
              _tasksForThisWeekList(position),
        ),
      ],
    );
  }

  // todo リストタイル
  _tasksForThisWeekList(position) {
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
            text: _strWeekTask[position],
            // text: "$position"
          ),
          style: TextStyle(fontSize: 17.0.sp),
          maxLines: null,
          // focusNode: _focusNode,
          decoration: InputDecoration(labelText: "タスク${position + 1}"),
          onChanged: (text) {
            _editTaskForThisWeek(text, position: position);
            _isEdited = true;
          },

          textInputAction: TextInputAction.done,
        ),
      ),
    );
  }

  // todo 「今週のタスク」変更処理
  _editTaskForThisWeek(text, {required position}) {
    _strWeekTask[position] = text;
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
    // 日付を変更せずに保存する場合
    bool _isWithoutChanging = false;
    if (firstDay != 0) {
      await showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("週の初めの日（${_monthOfFirstDay}月${_firstDay}日）"),
              content: const Text("週の初めの日を変更しますか？"),
              actions: [
                // TextButton(
                //   child: const Text("はい"),
                //   onPressed: () {
                //     _saved = true;
                //     _firstDay = now.day;
                //     _isContinued = false;
                //     Navigator.of(context).pop();
                //   },
                // ),
                TextButton(
                  child: const Text("日付を選択"),
                  onPressed: () async {
                    // 先月の日数
                    // final numOfDaysLastMonth =
                    //     DateTime(now.year, now.month, 0).day;
                    _lastWeekTask = await database.allTasksForLastWeek;
                    final unableDay = _lastWeekTask.length != 0
                        ? _lastWeekTask[0].firstDay + 6
                        : 0;
                    final selectedDay =
                        //DateTime.now().add(Duration(days: 1)).day;
                        await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.utc(2000, 1, 1),
                      lastDate: DateTime.utc(2100, 12, 31),
                      barrierDismissible: false,

                      // 無効な日付
                      selectableDayPredicate: (DateTime date) {
                        if (date.isAfter(now) ||
                            date.isBefore(now.add(Duration(days: -6)))) {
                          return false;
                        }
                        return true;
                      },
                      // todo DatePickerの色（2025/05/12）＞＞
                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: ColorScheme(
                              brightness: Theme.of(context).brightness,
                              // 選択している日付の丸と固有のWidget（TextButtonやTextField等）の色
                              // initialDateのテキストの丸の外枠も
                              primary: Theme.of(context).colorScheme.primary,
                              // 選択している日付のテキストの丸の外枠
                              onPrimary:
                                  Theme.of(context).colorScheme.onPrimary,
                              // 関係ない
                              secondary: Colors.red,
                              // 関係ない
                              onSecondary: Colors.blue,
                              // 多分関係ない
                              error: Colors.red,
                              // 多分関係ない
                              onError: Colors.blue,
                              // ヘッダーの背景色
                              surface: Theme.of(context).colorScheme.secondary,
                              // ダイアログ内（ヘッダーも含む）のテキストやアイコンの色
                              onSurface:
                                  Theme.of(context).colorScheme.onSecondary,
                            ),
                          ),
                          child: child!,
                        );
                      },
                    );
                    if (selectedDay != null) {
                      Navigator.of(context).pop();
                      _selectedDayAtCalendar = selectedDay;
                      _firstDay = selectedDay.day;
                      _monthOfFirstDay = selectedDay.month;
                    }

                    // await showDialog(
                    //     context: context,
                    //     builder: (context) {
                    //       return Container(
                    //         width: 0.9.sw,
                    //         height: double.infinity,
                    //         // todo これでもカレンダーが表示されない。
                    //         child: DatePickerDialog(
                    //           initialDate: DateTime.now(),
                    //           firstDate: DateTime.utc(2000, 1, 1),
                    //           lastDate: DateTime.utc(2100, 12, 31),
                    //         ),
                    //         // child: SimpleDialog(
                    //         //   title: Text("週の初めの日をいつにしますか？"),
                    //         //   children: [
                    //         //     Column(
                    //         //       children: [
                    //         //         Container(
                    //         //           child: TableCalendar(
                    //         //             headerStyle:
                    //         //                 HeaderStyle(formatButtonVisible: false),
                    //         //             focusedDay: theDay,
                    //         //             currentDay: theDay,
                    //         //             firstDay: DateTime.utc(2000, 1, 1),
                    //         //             lastDay: DateTime.utc(2100, 12, 31),
                    //         //             onDaySelected: (
                    //         //               DateTime selectedDay,
                    //         //               DateTime focusedDay,
                    //         //             ) {
                    //         //               _selectedDay = selectedDay.day;
                    //         //             },
                    //         //           ),
                    //         //         ),
                    //         //         Row(
                    //         //           children: [
                    //         //             ElevatedButton(
                    //         //               child: Text("決定"),
                    //         //               onPressed:
                    //         //                   _selectedDay <= DateTime.now().day
                    //         //                       ? () {
                    //         //                           _saved = true;
                    //         //                           _firstDay = _selectedDay;
                    //         //                           Navigator.of(context)
                    //         //                               .popUntil((route) =>
                    //         //                                   route.isFirst);
                    //         //                         }
                    //         //                       : null,
                    //         //             ),
                    //         //             ElevatedButton(
                    //         //               child: Text("戻る"),
                    //         //               onPressed: () {
                    //         //                 Navigator.of(context).pop();
                    //         //               },
                    //         //             ),
                    //         //           ],
                    //         //         ),
                    //         //       ],
                    //         //     ),
                    //         //   ],
                    //         // ),
                    //       );
                    //     });
                  },
                ),
                TextButton(
                  child: Text("変更せずに保存"),
                  onPressed: () {
                    _isWithoutChanging = true;
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    } else {
      // _isContinued = false;
      _firstDay = now.day;
    }
    // この段階で表示されているリストの内容（task, date, id）をデータベースに上書き保存
    var _firstTaskForThisWeek = WeeklyTask(
      task: _strWeekTask[0],
      week: _isWithoutChanging
          ? _taskForThisWeek[0].week
          : DateFormat("yyyy-MM-${firstDay}").format(_selectedDayAtCalendar),
      month: _isWithoutChanging ? _taskForThisWeek[0].month : _monthOfFirstDay,
      firstDay: _isWithoutChanging ? _taskForThisWeek[0].firstDay : firstDay,
      id: _taskForThisWeek[0].id,
      isChecked: _isSelected[0],
      result: _taskForThisWeek[0].result,
      improvement: _taskForThisWeek[0].improvement,
    );
    var _secondTaskForThisWeek = WeeklyTask(
      task: _strWeekTask[1],
      week: _isWithoutChanging
          ? _taskForThisWeek[1].week
          : DateFormat("yyyy-MM-${firstDay}").format(_selectedDayAtCalendar),
      month: _isWithoutChanging ? _taskForThisWeek[1].month : _monthOfFirstDay,
      firstDay: _isWithoutChanging ? _taskForThisWeek[1].firstDay : firstDay,
      id: _taskForThisWeek[1].id,
      isChecked: _isSelected[1],
      result: _taskForThisWeek[1].result,
      improvement: _taskForThisWeek[1].improvement,
    );
    var _thirdTaskForThisWeek = WeeklyTask(
      task: _strWeekTask[2],
      week: _isWithoutChanging
          ? _taskForThisWeek[2].week
          : DateFormat("yyyy-MM-${firstDay}").format(_selectedDayAtCalendar),
      month: _isWithoutChanging ? _taskForThisWeek[2].month : _monthOfFirstDay,
      firstDay: _isWithoutChanging ? _taskForThisWeek[2].firstDay : firstDay,
      id: _taskForThisWeek[2].id,
      isChecked: _isSelected[2],
      result: _taskForThisWeek[2].result,
      improvement: _taskForThisWeek[2].improvement,
    );

    await database.updateWeeklyTask(_firstTaskForThisWeek);
    await database.updateWeeklyTask(_secondTaskForThisWeek);
    await database.updateWeeklyTask(_thirdTaskForThisWeek);

    await Fluttertoast.showToast(
      msg: "タスクを保存しました。",
      toastLength: await Toast.LENGTH_SHORT,
      gravity: await ToastGravity.TOP,
      textColor: Theme.of(context).colorScheme.secondary,
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
    );

    setState(() {
      _isEdited = false;
      _isContinued = true;
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
          print("${_taskForThisWeek[0].week}");
          _taskListForDialog = await database.allWeeklyTasksNotAchieved;
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

  Widget _taskListDialog(List<WeeklyTask> taskList) {
    return SimpleDialog(
      title: const Text("達成されなかったタスク"),
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 16.0.h),
          child: Container(
            width: 30.w,
            height: 500.sp,
            child: ListView.separated(
              physics: ScrollPhysics(),
              // shrinkWrap: true,
              itemCount: taskList.length,
              itemBuilder: (context, int position) => _taskNotAchievement(
                taskList[position].task,
                taskList[position].week,
              ),
              separatorBuilder: (context, index) => const Divider(
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

  Widget _taskNotAchievement(task, week) {
    return ListTile(
      dense: true,
      subtitle: Text(week),
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
                formatAtNavigation: TaskFormat.week,
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
