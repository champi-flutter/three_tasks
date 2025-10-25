import 'package:drift/isolate.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:three_tasks/db/database.dart';
import 'package:three_tasks/main.dart';
import 'package:io/io.dart';

import '../ad_helper.dart';

enum TaskFormat { date, week, month, year }

int _interstitialStackForHistoryScreen = 0;

int get interstitialStackForHistoryScreen => _interstitialStackForHistoryScreen;

class HistoryScreen extends StatefulWidget {
  final TaskFormat formatAtNavigation;

  const HistoryScreen({required this.formatAtNavigation});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

// 変更の場合はこっち
DateTime _theDay = now;

// 参照の場合はこっち
DateTime get theDay => _theDay;

class _HistoryScreenState extends State<HistoryScreen> {
  // 日か週か月か年か
  late TaskFormat _taskFormat;

  DateFormat _dateFormat = DateFormat("yyyy年MM月dd日");
  DateFormat _weekFormat = DateFormat("yyyy年MM月");
  DateFormat _monthFormat = DateFormat("yyyy年MM月");
  DateFormat _yearFormat = DateFormat("yyyy年");

  // 遷移元から受け取るフォーマットを格納
  TaskFormat _navigationFormat = TaskFormat.date;

  // チェックマークの有無
  bool _isFirstSelected = false;
  bool _isSecondSelected = false;
  bool _isThirdSelected = false;

  // Load済みかどうか
  bool _isTaskLoaded = false;

  // 1日のタスクを格納するリスト
  late List<DayTask> _theDayTask;

  // 1週間のタスクを格納するリスト
  late List<WeeklyTask> _theWeekTask;

  // 1ヶ月のタスクを格納するリスト
  late List<MonthlyTask> _theMonthTask;

  // 1年間のタスクを格納するリスト
  late List<YearlyTask> _theYearTask;

  // ユーザがダイアログで変更を希望したかどうか
  late bool _canChangeCheck;

  // 遷移元に変更したかどうかを通知する
  List<bool> _dailyResult = [false, false, false];
  List<bool> _weeklyResult = [false, false, false];
  List<bool> _monthlyResult = [false, false, false];
  List<bool> _yearlyResult = [false, false, false];

  // 選択された日付が未来かどうか
  bool _isFuture = false;

  // popup
  var _selectedValue = "";
  var _menuItem = ["クリップボードにコピー", "タスクのレビュー"];

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
    _theDayTask = [];
    _theWeekTask = [];
    _theMonthTask = [];
    _theYearTask = [];
    _theDay = now;
    _interstitialStackForHistoryScreen++;
    print("${interstitialStackForHistoryScreen}");
    _taskFormat = widget.formatAtNavigation;
    // todo バナー広告のロード
    _loadBannerAd();
    // todo タスク取得
    _callTasks();
    _canChangeCheck = false;
    _navigationFormat = _taskFormat;
    // print("${_theDayTask[0]}");
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

  // todo 各種タスクを取得（initState）
  _callTasks() async {
    switch (_taskFormat) {
      case TaskFormat.date:
        await _callFirstDayTasks();
      case TaskFormat.week:
        await _callFirstWeeklyTasks();
      case TaskFormat.month:
        await _callFirstMonthlyTasks();
      case TaskFormat.year:
        await _callFirstYearlyTasks();
    }

    setState(() {});
  }

  // todo 1日のタスクを取得（initState）
  _callFirstDayTasks() async {
    _theDayTask = await database.allTasksForTheDay;

    // nullでもリストを保てるように空を用意
    if (_theDayTask.length == 0) {
      await database.into(database.dayTasks).insert(
            DayTasksCompanion.insert(
              task: "",
              date: outputFormat.format(theDay),
            ),
          );
      await database.into(database.dayTasks).insert(
            DayTasksCompanion.insert(
              task: "",
              date: outputFormat.format(theDay),
            ),
          );
      await database.into(database.dayTasks).insert(
            DayTasksCompanion.insert(
              task: "",
              date: outputFormat.format(theDay),
            ),
          );

      _theDayTask = await database.allTasksForTheDay;
    }
    _isFirstSelected = _theDayTask[0].isChecked;
    _isSecondSelected = _theDayTask[1].isChecked;
    _isThirdSelected = _theDayTask[2].isChecked;

    if (_theDay.isBefore(now.add(Duration(days: 1)))) {
      _isTaskLoaded = true;
    }
    // setState(() {
    //   _isTaskLoaded = true;
    // });
  }

  // todo 1週間のタスク取得
  _callFirstWeeklyTasks() async {
    _theWeekTask = await database.allTasksForTheWeek;

    if (_theWeekTask.length == 0) {
      _theWeekTask
        ..add(WeeklyTask(
          task: "",
          week: weeklyOutputFormat.format(theDay),
          month: theDay.month,
          firstDay: 0,
          id: theDay.day + 100000,
          isChecked: false,
        ))
        ..add(WeeklyTask(
          task: "",
          week: weeklyOutputFormat.format(theDay),
          month: theDay.month,
          firstDay: 0,
          id: theDay.day + 100001,
          isChecked: false,
        ))
        ..add(WeeklyTask(
          task: "",
          week: weeklyOutputFormat.format(theDay),
          month: theDay.month,
          firstDay: 0,
          id: theDay.day + 100002,
          isChecked: false,
        ));
    }

    _isFirstSelected = _theWeekTask[0].isChecked;
    _isSecondSelected = _theWeekTask[1].isChecked;
    _isThirdSelected = _theWeekTask[2].isChecked;

    print(
        "theDay.day <= _theWeekTask[0].firstDay+7: ${theDay.day} <= ${_theWeekTask[0].firstDay + 7}: ${theDay.day <= _theWeekTask[0].firstDay + 7}");

    if (_theWeekTask[0].firstDay != 0) {
      print("_theWeekTask[0].firstDay + 7 = ${_theWeekTask[0].firstDay + 7}");
      _isTaskLoaded = true;
    }
    print(
        "(3)_isTaskLoadedは、${_isTaskLoaded}, theDay.month: ${theDay.month}, _theWeekTask[0].month: ${_theWeekTask[0].month}");
  }

  // todo 1ヶ月のタスク取得
  _callFirstMonthlyTasks() async {
    _theMonthTask = await database.allTasksForTheMonth;

    print("${_theMonthTask.length}個あります。");
    print(monthlyOutputFormat.format(theDay));

    if (_theMonthTask.length == 0) {
      var _firstMonthlyTasks = [
        MonthlyTasksCompanion.insert(
          task: "",
          month: monthlyOutputFormat.format(theDay),
        ),
        MonthlyTasksCompanion.insert(
          task: "",
          month: monthlyOutputFormat.format(theDay),
        ),
        MonthlyTasksCompanion.insert(
          task: "",
          month: monthlyOutputFormat.format(theDay),
        ),
      ];
      await database.addBatchMonthlyTaskCompanions(_firstMonthlyTasks);

      _theMonthTask = await database.allTasksForTheMonth;
    }
    print("ID: ${_theMonthTask[0].id}");

    _isFirstSelected = _theMonthTask[0].isChecked;
    _isSecondSelected = _theMonthTask[1].isChecked;
    _isThirdSelected = _theMonthTask[2].isChecked;

    if (theDay.month <= now.month) {
      _isTaskLoaded = true;
    }
    // setState(() {
    //   _isTaskLoaded = true;
    // });
  }

  // todo 1年間のタスク取得
  _callFirstYearlyTasks() async {
    _theYearTask = await database.allTasksForTheYear;

    print("${_theYearTask.length}個あります。");

    if (_theYearTask.length == 0) {
      var _firstYearlyTasks = [
        YearlyTasksCompanion.insert(
          task: "",
          year: yearlyOutputFormat.format(theDay),
        ),
        YearlyTasksCompanion.insert(
          task: "",
          year: yearlyOutputFormat.format(theDay),
        ),
        YearlyTasksCompanion.insert(
          task: "",
          year: yearlyOutputFormat.format(theDay),
        ),
      ];
      await database.addBatchYearlyTaskCompanions(_firstYearlyTasks);

      _theYearTask = await database.allTasksForTheYear;
    }

    _isFirstSelected = _theYearTask[0].isChecked;
    _isSecondSelected = _theYearTask[1].isChecked;
    _isThirdSelected = _theYearTask[2].isChecked;

    if (theDay.year <= now.year) {
      _isTaskLoaded = true;
    }
    // setState(() {
    //   _isTaskLoaded = true;
    // });
  }

  // todo dispose
  @override
  void dispose() {
    _isTaskLoaded = false;
    _ad?.dispose();
    _isAdLoaded = false;
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
          final finallyResult = switch (_navigationFormat) {
            TaskFormat.date => _dailyResult,
            TaskFormat.week => _weeklyResult,
            TaskFormat.month => _monthlyResult,
            TaskFormat.year => _yearlyResult,
          };
          // todo インタースティシャル広告
          if (interstitialStackForHistoryScreen % 4 == 0 &&
              _interstitialAd == null) {
            _loadInterstitialAd();
          }
          Navigator.pop(
            context,
            finallyResult,
          );
        },
        child: Scaffold(
          // todo AppBar
          appBar: AppBar(
            toolbarHeight: 56.h,
            title: const Text("履歴"),
            centerTitle: true,
          ),
          // todo body
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // todo カレンダー
                      SizedBox(
                        height: 450.h.h,
                        child: TableCalendar(
                          shouldFillViewport: true,
                          headerStyle: HeaderStyle(formatButtonVisible: false),
                          focusedDay: theDay,
                          currentDay: theDay,
                          firstDay: DateTime.utc(2000, 1, 1),
                          lastDay: DateTime.utc(2100, 12, 31),
                          onDaySelected: (
                            DateTime selectedDay,
                            DateTime focusedDay,
                          ) =>
                              _selectDate(selectedDay, focusedDay),
                        ),
                      ),

                      // todo 年月日の表示
                      Padding(
                        padding: EdgeInsets.all(10.0.r.r),
                        child: SizedBox(
                          height: 50.h,
                          width: 290.w,
                          child: Card(
                            color: Theme.of(context).colorScheme.primary,
                            elevation: 2.5,
                            child: TextButton(
                              onPressed: () async => await _selectFormat(),
                              child: Text(
                                _textOfTheDay(),
                                // _isTaskLoaded ? _textOfTheDay() : "",
                                style: TextStyle(
                                  fontSize: 17.0.sp,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      // todo タスクと達成
                      // こいつがinitStateのときにInvalid Value（2025/03/02） ＞＞　setStateし忘れ
                      _tasksWithAchievement(),
                    ],
                  ),
                ),
              ),
              // todo バナー広告
              _bannerAd(),
            ],
          ),
        ),
      ),
    );
  }

  // todo インタースティシャル広告をロードするメソッド
  _loadInterstitialAd() {
    print("${interstitialStackForHistoryScreen}");
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

  // todo カレンダーの日付を選択したときのメソッド
  _selectDate(DateTime selectedDay, DateTime focusedDay) async {
    // // todo インタースティシャル広告
    // _loadInterstitialAd();

    print("(1)_isTaskLoadedが ${_isTaskLoaded}");

    // 明後日以降のタスクは読み込まない
    _isTaskLoaded = false;
    // ユーザがダイアログで変更を希望したかどうか
    _canChangeCheck = false;

    _theDay = focusedDay;
    // 未来のタスクならcheckboxにアクセスできないようにする
    _isFuture = _theDay.isAfter(now);

    print("theDay: ${theDay.day}");

    // 未来の値を無理やり作らないようにしたい（2025/03/02）＞＞　未来のタスクはどのみち取得しようがない

    // todo dbから選択されている日付のタスクを抽出する
    await _callTasksForTheChangedDay();
    // print("${_theDayTask[0].task}");
  }

  _callTasksForTheChangedDay() async {
    print("1");
    switch (_taskFormat) {
      case TaskFormat.date:
        print("タスクフォーマット: $_taskFormat");
        await _callFirstDayTasks();
      case TaskFormat.week:
        print("タスクフォーマット: $_taskFormat");
        await _callFirstWeeklyTasks();
      case TaskFormat.month:
        print("タスクフォーマット: $_taskFormat");
        await _callFirstMonthlyTasks();
      case TaskFormat.year:
        print("タスクフォーマット: $_taskFormat");
        await _callFirstYearlyTasks();
    }
    setState(() {});
  }

  String _textOfTheDay() {
    switch (_taskFormat) {
      case TaskFormat.date:
        return "${_dateFormat.format(theDay)} のタスク";
      case TaskFormat.week:
        print("(2)_isTaskLoadedは、 ${_isTaskLoaded} （firstDayは、 ${_theWeekTask[0].month}月${_theWeekTask[0].firstDay}日）");
        if (_isTaskLoaded) {
          if (_theWeekTask[0].firstDay == 0) {
            return "non-value";
          } else {
            if (_theWeekTask[0].firstDay + 6 <=
                DateTime(_theDay.year, _theWeekTask[0].month + 1, 1)
                    .add(Duration(days: -1))
                    .day) {
              print(
                  "月の日数は、${DateTime(_theDay.year, _theWeekTask[0].month + 1, 1).add(Duration(days: -1)).day}");
              return "${_weekFormat.format(theDay)}${_theWeekTask[0].firstDay}日〜${_theWeekTask[0].firstDay + 6}日 のタスク";
            } else {
              // 7 - (月末 - 開始日 + 1)　日が終了日
              final int endDate = 7 -
                  DateTime(_theDay.year, _theWeekTask[0].month + 1, 1)
                      .add(Duration(days: -1))
                      .day +
                  _theWeekTask[0].firstDay -
                  1;
              return "${_weekFormat.format(theDay)}${_theWeekTask[0].firstDay}日〜${endDate}日 のタスク";
            }
          }
        } else {
          return "non_value";
        }
      case TaskFormat.month:
        return "${_monthFormat.format(theDay)} のタスク";
      case TaskFormat.year:
        return "${_yearFormat.format(theDay)} のタスク";
    }
  }

  // todo フォーマット変更メソッド
  _selectFormat() async {
    await showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            children: [
              SizedBox(
                height: 240,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: ElevatedButton(
                          onPressed: _taskFormat != TaskFormat.date
                              ? () {
                                  _isTaskLoaded = false;
                                  _canChangeCheck = false;
                                  Navigator.pop(context);
                                  _taskFormat = TaskFormat.date;
                                }
                              : null,
                          child: const Text(
                            "1日のタスク",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: ElevatedButton(
                          onPressed: _taskFormat != TaskFormat.week
                              ? () {
                                  _isTaskLoaded = false;
                                  _canChangeCheck = false;
                                  Navigator.pop(context);
                                  _taskFormat = TaskFormat.week;
                                }
                              : null,
                          child: const Text(
                            "1週間のタスク",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: ElevatedButton(
                          onPressed: _taskFormat != TaskFormat.month
                              ? () {
                                  _isTaskLoaded = false;
                                  _canChangeCheck = false;
                                  _taskFormat = TaskFormat.month;
                                  Navigator.pop(context);
                                }
                              : null,
                          child: const Text(
                            "1ヶ月のタスク",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: ElevatedButton(
                          onPressed: _taskFormat != TaskFormat.year
                              ? () {
                                  _isTaskLoaded = false;
                                  _canChangeCheck = false;
                                  Navigator.pop(context);
                                  _taskFormat = TaskFormat.year;
                                }
                              : null,
                          child: const Text(
                            "1年間のタスク",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
    await _callTasksForTheChangedDay();
  }

  Widget _tasksWithAchievement() {
    switch (_taskFormat) {
      case TaskFormat.date:
        return _dayTasksWithAchievement();
      case TaskFormat.week:
        return _weeklyTasksWithAchievement();
      case TaskFormat.month:
        return _monthlyTasksWithAchievement();
      case TaskFormat.year:
        return _yearlyTasksWithAchievement();
    }
  }

  // todo その日のタスクと達成メソッド
  Widget _dayTasksWithAchievement() {
    // List<DayTask> _theDayTasks = [];

    return Column(
      children: [
        // todo その日のタスク1
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: CheckboxListTile(
            title: Text(
              // "a",
              // nullの場合を考慮して三項条件演算子をもちいる ＞＞ initState時にnullの時間が必ず生まれるので条件分岐ではなく、事前に空を用意
              // ＞＞ Load済みかどうかを格納するフィールドを用意
              _isTaskLoaded ? _theDayTask[0].task : "",
              style: TextStyle(
                fontSize: 14.sp,
              ),
            ),
            value: _isFirstSelected,

            onChanged: (newValue) async {
              // todo 確認ダイアログ
              if (!_canChangeCheck && !_isFuture) {
                await showDialog(
                  context: context,
                  builder: (context) => _checkboxAlertDialog(),
                );
              }

              if (_canChangeCheck) {
                setState(() {
                  _isFirstSelected = newValue!;
                });
                _changeTaskAchievement(
                  position: 0,
                  isChecked: _isFirstSelected,
                );
              }
            },
            controlAffinity: ListTileControlAffinity.leading,
            // todo コピペ機能
            secondary: _isTaskLoaded
                ? _copyOrSeeReviews(position: 0, format: _taskFormat)
                : null,
          ),
        ),

        // todo その日のタスク2
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: CheckboxListTile(
            title: _isTaskLoaded
                ? Text(
                    // "b",
                    _theDayTask[1].task,
                    style: TextStyle(
                      fontSize: 14.sp,
                    ),
                  )
                : Text("読み込み中..."),
            value: _isSecondSelected,
            onChanged: (newValue) async {
              // todo 確認ダイアログ
              if (!_canChangeCheck && !_isFuture) {
                await showDialog(
                  context: context,
                  builder: (context) => _checkboxAlertDialog(),
                );
              }

              if (_canChangeCheck) {
                setState(() {
                  _isSecondSelected = newValue!;
                });
                _changeTaskAchievement(
                  position: 1,
                  isChecked: _isSecondSelected,
                );
              }
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: _isTaskLoaded
                ? _copyOrSeeReviews(
                    position: 1,
                    format: _taskFormat,
                  )
                : null,
          ),
        ),

        // todo その日のタスク3
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: CheckboxListTile(
            title: Text(
              // "c",
              _isTaskLoaded ? _theDayTask[2].task : "",
              style: TextStyle(
                fontSize: 14.sp,
              ),
            ),
            value: _isThirdSelected,
            onChanged: (newValue) async {
              // todo 確認ダイアログ
              if (!_canChangeCheck && !_isFuture) {
                await showDialog(
                  context: context,
                  builder: (context) => _checkboxAlertDialog(),
                );
              }

              if (_canChangeCheck) {
                setState(() {
                  _isThirdSelected = newValue!;
                });
                _changeTaskAchievement(
                  position: 2,
                  isChecked: _isThirdSelected,
                );
              }
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: _isTaskLoaded
                ? _copyOrSeeReviews(
                    position: 2,
                    format: _taskFormat,
                  )
                : null,
          ),
        ),
      ],
    );
  }

  // todo その週のタスクと達成メソッド
  Widget _weeklyTasksWithAchievement() {
    // List<DayTask> _theDayTasks = [];

    return Column(
      children: [
        // todo その週のタスク1
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: CheckboxListTile(
            title: Text(
              // "a",
              // nullの場合を考慮して三項条件演算子をもちいる ＞＞ initState時にnullの時間が必ず生まれるので条件分岐ではなく、事前に空を用意
              // ＞＞ Load済みかどうかを格納するフィールドを用意
              _isTaskLoaded ? _theWeekTask[0].task : "",
            ),
            value: _isFirstSelected,

            onChanged: (newValue) async {
              // todo 確認ダイアログ
              if (!_canChangeCheck && !_isFuture) {
                await showDialog(
                  context: context,
                  builder: (context) => _checkboxAlertDialog(),
                );
              }

              if (_canChangeCheck) {
                setState(() {
                  _isFirstSelected = newValue!;
                });
                _changeTaskAchievement(
                  position: 0,
                  isChecked: _isFirstSelected,
                );
              }
            },
            controlAffinity: ListTileControlAffinity.leading,
            // todo コピペ機能
            secondary: _isTaskLoaded
                ? _copyOrSeeReviews(
                    position: 0,
                    format: _taskFormat,
                  )
                : null,
          ),
        ),

        // todo その週のタスク2
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: CheckboxListTile(
            title: Text(
              // "b",
              _isTaskLoaded ? _theWeekTask[1].task : "読み込み中...",
            ),
            value: _isSecondSelected,
            onChanged: (newValue) async {
              // todo 確認ダイアログ
              if (!_canChangeCheck && !_isFuture) {
                await showDialog(
                  context: context,
                  builder: (context) => _checkboxAlertDialog(),
                );
              }

              if (_canChangeCheck) {
                setState(() {
                  _isSecondSelected = newValue!;
                });
                _changeTaskAchievement(
                  position: 1,
                  isChecked: _isSecondSelected,
                );
              }
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: _isTaskLoaded
                ? _copyOrSeeReviews(
                    position: 1,
                    format: _taskFormat,
                  )
                : null,
          ),
        ),

        // todo その週のタスク3
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: CheckboxListTile(
            title: Text(
              // "c",
              _isTaskLoaded ? _theWeekTask[2].task : "",
            ),
            value: _isThirdSelected,
            onChanged: (newValue) async {
              // todo 確認ダイアログ
              if (!_canChangeCheck && !_isFuture) {
                await showDialog(
                  context: context,
                  builder: (context) => _checkboxAlertDialog(),
                );
              }

              if (_canChangeCheck) {
                setState(() {
                  _isThirdSelected = newValue!;
                });
                _changeTaskAchievement(
                  position: 2,
                  isChecked: _isThirdSelected,
                );
              }
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: _isTaskLoaded
                ? _copyOrSeeReviews(
                    position: 2,
                    format: _taskFormat,
                  )
                : null,
          ),
        ),
      ],
    );
  }

  // todo その月のタスクと達成メソッド
  Widget _monthlyTasksWithAchievement() {
    // List<DayTask> _theDayTasks = [];

    return Column(
      children: [
        // todo その月のタスク1
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: CheckboxListTile(
            title: Text(
              // "a",
              // nullの場合を考慮して三項条件演算子をもちいる ＞＞ initState時にnullの時間が必ず生まれるので条件分岐ではなく、事前に空を用意
              // ＞＞ Load済みかどうかを格納するフィールドを用意
              _isTaskLoaded ? _theMonthTask[0].task : "",
            ),
            // tristate: true,
            // value: _theDay.isBefore(now.add(Duration(days: 1)))
            //     ? _isFirstSelected
            //     : null,
            value: _isFirstSelected,

            onChanged: (newValue) async {
              // todo 確認ダイアログ
              if (!_canChangeCheck && !_isFuture) {
                await showDialog(
                  context: context,
                  builder: (context) => _checkboxAlertDialog(),
                );
              }

              if (_canChangeCheck) {
                setState(() {
                  _isFirstSelected = newValue!;
                });
                _changeTaskAchievement(
                  position: 0,
                  isChecked: _isFirstSelected,
                );
              }
            },
            controlAffinity: ListTileControlAffinity.leading,
            // todo コピペ機能
            secondary: _isTaskLoaded
                ? _copyOrSeeReviews(
                    position: 0,
                    format: _taskFormat,
                  )
                : null,
          ),
        ),

        // todo その月のタスク2
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: CheckboxListTile(
            title: Text(
              // "b",
              _isTaskLoaded ? _theMonthTask[1].task : "読み込み中...",
            ),
            // tristate: true,
            // value: _theDay.isBefore(now.add(Duration(days: 1)))
            //     ? _isSecondSelected
            //     : null,
            value: _isSecondSelected,
            onChanged: (newValue) async {
              // todo 確認ダイアログ
              if (!_canChangeCheck && !_isFuture) {
                await showDialog(
                  context: context,
                  builder: (context) => _checkboxAlertDialog(),
                );
              }

              if (_canChangeCheck) {
                setState(() {
                  _isSecondSelected = newValue!;
                });
                _changeTaskAchievement(
                  position: 1,
                  isChecked: _isSecondSelected,
                );
              }
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: _isTaskLoaded
                ? _copyOrSeeReviews(
                    position: 1,
                    format: _taskFormat,
                  )
                : null,
          ),
        ),

        // todo その月のタスク3
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: CheckboxListTile(
            title: Text(
              // "c",
              _isTaskLoaded ? _theMonthTask[2].task : "",
            ),
            // tristate: true,
            // value: _theDay.isBefore(now.add(Duration(days: 1)))
            //     ? _isThirdSelected
            //     : null,
            value: _isThirdSelected,
            onChanged: (newValue) async {
              // todo 確認ダイアログ
              if (!_canChangeCheck && !_isFuture) {
                await showDialog(
                  context: context,
                  builder: (context) => _checkboxAlertDialog(),
                );
              }

              if (_canChangeCheck) {
                setState(() {
                  _isThirdSelected = newValue!;
                });
                _changeTaskAchievement(
                  position: 2,
                  isChecked: _isThirdSelected,
                );
              }
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: _isTaskLoaded
                ? _copyOrSeeReviews(
                    position: 2,
                    format: _taskFormat,
                  )
                : null,
          ),
        ),
      ],
    );
  }

  // todo その年のタスクと達成メソッド
  Widget _yearlyTasksWithAchievement() {
    // List<DayTask> _theDayTasks = [];

    return Column(
      children: [
        // todo その年のタスク1
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: CheckboxListTile(
            title: Text(
              // "a",
              // nullの場合を考慮して三項条件演算子をもちいる ＞＞ initState時にnullの時間が必ず生まれるので条件分岐ではなく、事前に空を用意
              // ＞＞ Load済みかどうかを格納するフィールドを用意
              _isTaskLoaded ? _theYearTask[0].task : "",
            ),
            // tristate: true,
            // value: _theDay.isBefore(now.add(Duration(days: 1)))
            //     ? _isFirstSelected
            //     : null,
            value: _isFirstSelected,

            onChanged: (newValue) async {
              // todo 確認ダイアログ
              if (!_canChangeCheck && !_isFuture) {
                await showDialog(
                  context: context,
                  builder: (context) => _checkboxAlertDialog(),
                );
              }

              if (_canChangeCheck) {
                setState(() {
                  _isFirstSelected = newValue!;
                });
                _changeTaskAchievement(
                  position: 0,
                  isChecked: _isFirstSelected,
                );
              }
            },
            controlAffinity: ListTileControlAffinity.leading,
            // todo コピペ機能
            secondary: _isTaskLoaded
                ? _copyOrSeeReviews(
                    position: 0,
                    format: _taskFormat,
                  )
                : null,
          ),
        ),

        // todo その年のタスク2
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: CheckboxListTile(
            title: Text(
              // "b",
              _isTaskLoaded ? _theYearTask[1].task : "読み込み中...",
            ),
            // tristate: true,
            // value: _theDay.isBefore(now.add(Duration(days: 1)))
            //     ? _isSecondSelected
            //     : null,
            value: _isSecondSelected,
            onChanged: (newValue) async {
              // todo 確認ダイアログ
              if (!_canChangeCheck && !_isFuture) {
                await showDialog(
                  context: context,
                  builder: (context) => _checkboxAlertDialog(),
                );
              }

              if (_canChangeCheck) {
                setState(() {
                  _isSecondSelected = newValue!;
                });
                _changeTaskAchievement(
                  position: 1,
                  isChecked: _isSecondSelected,
                );
              }
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: _isTaskLoaded
                ? _copyOrSeeReviews(
                    position: 1,
                    format: _taskFormat,
                  )
                : null,
          ),
        ),

        // todo その年のタスク3
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: CheckboxListTile(
            title: Text(
              // "c",
              _isTaskLoaded ? _theYearTask[2].task : "",
            ),
            // tristate: true,
            // value: _theDay.isBefore(now.add(Duration(days: 1)))
            //     ? _isThirdSelected
            //     : null,
            value: _isThirdSelected,
            onChanged: (newValue) async {
              // todo 確認ダイアログ
              if (!_canChangeCheck && !_isFuture) {
                await showDialog(
                  context: context,
                  builder: (context) => _checkboxAlertDialog(),
                );
              }

              if (_canChangeCheck) {
                setState(() {
                  _isThirdSelected = newValue!;
                });
                _changeTaskAchievement(
                  position: 2,
                  isChecked: _isThirdSelected,
                );
              }
            },
            controlAffinity: ListTileControlAffinity.leading,
            secondary: _isTaskLoaded
                ? _copyOrSeeReviews(
                    position: 2,
                    format: _taskFormat,
                  )
                : null,
          ),
        ),
      ],
    );
  }

  // todo checkboxがタップされた際のダイアログ
  _checkboxAlertDialog() {
    return AlertDialog(
      content: const Text(
        "過去のタスクを達成を変更してもいいですか？",
      ),
      actions: [
        TextButton(
          onPressed: () {
            _canChangeCheck = true;
            Navigator.pop(context);
          },
          child: const Text("OK"),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("キャンセル"),
        ),
      ],
    );
  }

  // todo Checkboxが変更されたときの処理
  _changeTaskAchievement({required position, required isChecked}) async {
    switch (_taskFormat) {
      case TaskFormat.date:
        // データ行を指定
        var changedTask = DayTask(
          task: _theDayTask[position].task,
          date: outputFormat.format(theDay),
          id: _theDayTask[position].id,
          isChecked: isChecked,
          result: _theDayTask[position].result,
          improvement: _theDayTask[position].improvement,
        );

        // 例外処理を含む
        try {
          // todo 主キーがないのでupdateできない。　＞＞ 自動生成されるIDを取得
          await database.updateDayTask(changedTask);
        } on SqliteException catch (e) {
          showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                content: Text("$e"),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("OK"),
                  ),
                ],
              );
            },
          );
        } on DriftRemoteException catch (e) {
          showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                content: Text("$e"),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("OK"),
                  ),
                ],
              );
            },
          );
        }
        if (_theDay.day == now.day) {
          _dailyResult[position] = true;
        }
      case TaskFormat.week:
        // データ行を指定
        var changedTask = WeeklyTask(
            task: _theWeekTask[position].task,
            week: _theWeekTask[position].week,
            month: _theWeekTask[position].month,
            firstDay: _theWeekTask[position].firstDay,
            id: _theWeekTask[position].id,
            isChecked: isChecked,
            result: _theWeekTask[position].result,
            improvement: _theWeekTask[position].improvement);

        // 例外処理を含む
        try {
          // todo 主キーがないのでupdateできない。　＞＞ 自動生成されるIDを取得
          await database.updateWeeklyTask(changedTask);
        } on SqliteException catch (e) {
          showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                content: Text("$e"),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("OK"),
                  ),
                ],
              );
            },
          );
        } on DriftRemoteException catch (e) {
          showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                content: Text("$e"),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("OK"),
                  ),
                ],
              );
            },
          );
        }
        final l = now.day - _theWeekTask[position].firstDay;
        if (l >= 0 && l < 7) {
          _weeklyResult[position] = true;
        }
      case TaskFormat.month:
        // データ行を指定
        var changedTask = MonthlyTask(
          task: _theMonthTask[position].task,
          month: _theMonthTask[position].month,
          id: _theMonthTask[position].id,
          isChecked: isChecked,
          result: _theMonthTask[position].result,
          improvement: _theMonthTask[position].improvement,
        );

        // 例外処理を含む
        try {
          // todo 主キーがないのでupdateできない。　＞＞ 自動生成されるIDを取得
          await database.updateMonthlyTask(changedTask);
        } on SqliteException catch (e) {
          showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                content: Text("$e"),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("OK"),
                  ),
                ],
              );
            },
          );
        } on DriftRemoteException catch (e) {
          showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                content: Text("$e"),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("OK"),
                  ),
                ],
              );
            },
          );
        }
        if (_theDay.month == now.month) {
          _monthlyResult[position] = true;
        }
      case TaskFormat.year:
        // データ行を指定
        var changedTask = YearlyTask(
          task: _theYearTask[position].task,
          year: _theYearTask[position].year,
          id: _theYearTask[position].id,
          isChecked: isChecked,
          result: _theYearTask[position].result,
          improvement: _theYearTask[position].improvement,
        );

        // 例外処理を含む
        try {
          // todo 主キーがないのでupdateできない。　＞＞ 自動生成されるIDを取得
          await database.updateYearlyTask(changedTask);
        } on SqliteException catch (e) {
          showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                content: Text("$e"),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("OK"),
                  ),
                ],
              );
            },
          );
        } on DriftRemoteException catch (e) {
          showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                content: Text("$e"),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("OK"),
                  ),
                ],
              );
            },
          );
        }
        if (_theDay.year == now.year) {
          _yearlyResult[position] = true;
        }
    }
    print("タスクが変更されました");
  }

  Widget _copyOrSeeReviews({required position, required TaskFormat format}) {
    return PopupMenuButton(
      initialValue: _selectedValue,
      onSelected: (s) {
        setState(() {
          _selectedValue = s;
        });
      },
      itemBuilder: (context) {
        return _menuItem.map((String s) {
          return PopupMenuItem(
            child: Text(s),
            value: s,
            onTap: () async {
              if (s == "クリップボードにコピー") {
                Fluttertoast.showToast(
                  msg: "クリップボードにコピーしました",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.TOP,
                  textColor: Theme.of(context).colorScheme.secondary,
                  backgroundColor: Theme.of(context).colorScheme.onSecondary,
                );
                _copyTask(
                  task: _theDayTask[position].task,
                  // todo クリップボードにコピーしました（2025/03/05）
                );
              } else {
                showDialog(
                  context: context,
                  builder: (context) {
                    return SimpleDialog(
                      children: [
                        Card(
                          child: ListTile(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            title: const Text(
                              "結果",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // todo 結果TextField
                            subtitle: Text("${switch (format) {
                              TaskFormat.date => _theDayTask[position].result,
                              TaskFormat.week => _theWeekTask[position].result,
                              TaskFormat.month =>
                                _theMonthTask[position].result,
                              TaskFormat.year => _theYearTask[position].result,
                            }}"),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            title: const Text(
                              "改善点",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // todo 改善点TextField
                            subtitle: Text("${switch (format) {
                              TaskFormat.date =>
                                _theDayTask[position].improvement,
                              TaskFormat.week =>
                                _theWeekTask[position].improvement,
                              TaskFormat.month =>
                                _theMonthTask[position].improvement,
                              TaskFormat.year =>
                                _theYearTask[position].improvement,
                            }}"),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: FloatingActionButton(
                              mini: true,
                              onPressed: () => Navigator.pop(context),
                              child: const Icon(Icons.clear),
                              elevation: 2,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }
              // setState(() {
              //   _selectedValue = "";
              // });
            },
          );
        }).toList();
      },
    );
  }

  // todo コピペメソッド
  _copyTask({task}) {
    Clipboard.setData(ClipboardData(text: task!));
  }
}
