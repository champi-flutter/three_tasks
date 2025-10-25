import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:drift/isolate.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:three_tasks/ad_helper.dart';
import 'package:three_tasks/main.dart';
import 'package:three_tasks/screens/history_screen.dart';
import 'package:three_tasks/screens/month_tasks.dart';
import 'package:three_tasks/screens/review_screen.dart';
import 'package:three_tasks/screens/tasks_for_tomorrow.dart';
import 'package:three_tasks/db/database.dart';
import 'package:three_tasks/screens/week_tasks.dart';
import 'package:three_tasks/screens/year_tasks.dart';
import 'package:url_launcher/url_launcher.dart';

int _interstitialStack = 0;

int get interstitialStack => _interstitialStack;

class HomeScreen extends StatefulWidget {
  // final bool isFirstHomeScreen;

  // const HomeScreen({super.key, required this.isFirstHomeScreen});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // チェックマークの有無
  List<bool> _isSelected = [false, false, false];

  // 週の終わりまで何日かを通知
  late int _left;

  List<DayTask> _taskForToday = [];

  TextEditingController _firstTaskForToday = TextEditingController();
  TextEditingController _secondTaskForToday = TextEditingController();
  TextEditingController _thirdTaskForToday = TextEditingController();

  late FocusNode _focusNode;

  List<WeeklyTask> _taskForThisWeek = [];

  // Popupのmenu
  var _menuItem = ["今日のタスクをレビュー", "昨日のタスクをレビュー"];
  var _selectedValue = "";

  // バナー広告の内容
  BannerAd? _ad;

  // バナー広告がロードされたかどうか
  bool _isAdLoaded = false;

  // インタースティシャル広告の内容
  InterstitialAd? _interstitialAd;

  // 利用規約URL
  static const String termsUrl =
      "https://plaid-hamster-7ba.notion.site/3-1c88508e9d6d800b8213e71939bf526f";

  // プライバシーポリシーURL
  static const String privacyPolicyURL =
      "https://plaid-hamster-7ba.notion.site/3-1c88508e9d6d80c5adb1c6349be867fc";

  // // GooglePlayのURL
  // static const String googlePlayUrl = ;
  // // AppStoreのURL
  // static const String appStoreUrl = ;

  final InAppReview inAppReview = InAppReview.instance;

  late TextEditingController _subjectController;
  late TextEditingController _mailController;

  int _toastCount = 0;

  // アダプティブバナー広告のサイズ
  // Futureで値を取得するまでの間、nullになりうる
  // AdSize? _adSize;

  // アダプティブバナー広告のサイズを取得するメソッド
  // Future<AdSize?> _getAdSize(BuildContext context) async {
  //   // _adSizeに値が入っているなら、それを返す
  //   if (_adSize != null) {
  //     return _adSize;
  //   }
  //
  //   // アダプティブバナー広告のサイズを取得
  //   _adSize = await AdSize.getAnchoredAdaptiveBannerAdSize(
  //     // 画面の向き
  //     MediaQuery.of(context).orientation == Orientation.portrait
  //         ? Orientation.portrait
  //         : Orientation.landscape,
  //     // 横幅
  //     MediaQuery.of(context).size.width.toInt(),
  //   ) as AdSize;
  //
  //   return _adSize;
  // }

  // todo initState
  @override
  void initState() {
    super.initState();

    // isFirstHomeScreen(初回起動かどうか)をHomeScreenクラスから取得
    // var _firstLaunch = widget.isFirstHomeScreen;

    _focusNode = FocusNode();

    _mailController = TextEditingController();
    _subjectController = TextEditingController();

    _interstitialStack++;

    // todo バナー広告のロード
    _loadBannerAd();

    // todo 「今日のタスク」をデータベースから取得
    _getTasksForToday();

    // 起動した段階ではfirstDayは0のまま。

  }

  Future<InitializationStatus> _initGoogleMobileAds() {
    // todo Google Mobile Ads SDK の初期化
    return MobileAds.instance.initialize();
  }

  // todo 「今日のタスク」をデータベースから取得するメソッド
  void _getTasksForToday() async {
    // // todo 一旦リセット
    // await database.managers.monthlyTasks.delete();
    // await database.managers.yearlyTasks.delete();
    // 今日のタスクだけを抽出するクエリメソッド
    _taskForToday = await database.allTasksForToday;

    if (_taskForToday.length == 0) {
      await database.batch((batch) {
        batch.insertAll(database.dayTasks, [
          DayTasksCompanion.insert(task: "", date: today),
          DayTasksCompanion.insert(task: "", date: today),
          DayTasksCompanion.insert(task: "", date: today),
        ]);
      });

      // await database.into(database.dayTasks).insert(
      //       DayTasksCompanion.insert(task: "", date: today),
      //     );
      // await database.into(database.dayTasks).insert(
      //       DayTasksCompanion.insert(task: "", date: today),
      //     );
      // await database.into(database.dayTasks).insert(
      //       DayTasksCompanion.insert(task: "", date: today),
      //     );

      _taskForToday = await database.allTasksForToday;
    }

    _firstTaskForToday.text = _taskForToday[0].task;
    _secondTaskForToday.text = _taskForToday[1].task;
    _thirdTaskForToday.text = _taskForToday[2].task;

    _isSelected = [
      _taskForToday[0].isChecked,
      _taskForToday[1].isChecked,
      _taskForToday[2].isChecked,
    ];

    // todo 週のタスクの終了日の通知のために週のタスクをクエリ
    _taskForThisWeek = await database.allTasksForThisWeek;

    _left = _taskForThisWeek.length == 0 ? 32 : _taskForThisWeek[0].firstDay + 7 - now.day;

    // todo 週のタスクの通知
    if (0 <= _left && _left < 8) {
      Fluttertoast.showToast(
        msg: _left == 0 ? "今週のタスクは今日が最終日です！" : "今週のタスクの終了まで、あと${_left}日です。",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        backgroundColor: Theme.of(context).colorScheme.error,
        textColor: Theme.of(context).colorScheme.onError,
      );
    }
    print("_left = ${_left}");

    setState(() {});
  }

  // todo build
  @override
  Widget build(BuildContext context) {
    // 初回起動状態を解除
    // _launchApp();

    return Scaffold(
      // todo appBar
      appBar: AppBar(
        toolbarHeight: 56.h,
        centerTitle: true,
        title: const Text("今日のタスク"),
        actions: [
          // todo AppBar右側サイドバー、ポップアップメニュー
          _reviewButton(),
        ],
      ),
      // todo drawer
      drawer: Drawer(
        // shadowColor: Theme.of(context).brightness == Brightness.light
        //     ? Colors.blue
        //     : Colors.red,
        // shadowColor: _isGetColor ? Color(_themeColor[0].onPrimaryNum) : Theme.of(context).primaryColor,
        child: ListView(
          children: [
            SizedBox(
              height: 80.h,
              // color:
              //     _isGetColor ? Color(_themeColor[0].primaryNum) : Colors.blue,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    "メニュー",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
            ),
            // todo フィードバック
            _feedback(),
            // todo 利用規約
            _termsOfUse(),
            // todo プライバシーポリシー
            _privacyPolicyOfUse(),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Focus(
          focusNode: _focusNode,
          child: Center(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => _focusNode.requestFocus(),
                  // onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                  behavior: HitTestBehavior.opaque,
                  child: Column(
                    children: [
                      // todo 余白
                      SizedBox(height: 30.0.h.h),

                      // todo 今日のタスク
                      _tasksForToday(),

                      // todo 余白
                      SizedBox(height: 30.0.h.h),

                      // ボタンは縁をそろえて配置
                      Padding(
                        padding: EdgeInsets.all(4.0.r),
                        child: Column(
                          children: [
                            // todo 明日のタスク　ボタン
                            _tomorrowButton(),

                            // todo 余白
                            // SizedBox(height: 20.0),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // todo 今週のタスク　ボタン
                                Expanded(flex: 1, child: _weekButton()),

                                // todo 今月のタスク　ボタン
                                Expanded(flex: 1, child: _monthButton()),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // todo 今年のタスク　ボタン
                                Expanded(flex: 1, child: _yearButton()),

                                // todo 履歴　ボタン
                                Expanded(flex: 1, child: _historyButton()),
                              ],
                            ),
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
    );
  }

  // todo 初回起動時に初回起動でなくなった状態に設定
  _launchApp() async {
    // final prefs = await SharedPreferences.getInstance();
    // await prefs.setBool("launched", false);
  }

  // フィードバック
  Widget _feedback() {
    return Padding(
      padding: EdgeInsets.only(bottom: 4.0.h),
      child: ExpansionTile(
        textColor: Theme.of(context).colorScheme.onPrimary,
        collapsedBackgroundColor: Theme.of(context).cardColor,
        title: Text(
          "フィードバック",
          style: TextStyle(fontSize: 18.sp),
        ),
        children: [
          // todo InAppReview動かない（2025/05/15）＞＞
          TextButton(
            child: Text(
              "ご意見・ご感想",
              style: TextStyle(fontSize: 18.sp),
            ),
            onPressed: () => _launchStoreReview(context),
          ),
          TextButton(
            child: Text(
              "不具合を報告",
              style: TextStyle(fontSize: 18.sp),
            ),
            onPressed: () => showDialog(
              context: context,
              builder: (context) => _reportError(),
            ),
          ),
        ],
      ),
    );
  }

  // ご意見・ご感想
  Future<void> _launchStoreReview(BuildContext context) async {
    try {
      if (await inAppReview.isAvailable()) {
        print(
            "inAppReview.requestReview()メソッド: ${inAppReview.requestReview().toString()}");
        await inAppReview.requestReview();
      }
      print("ストアは開きましたか？");
      print("inAppReview.isAvailable(): ${await inAppReview.isAvailable()}");
      // else {
      //   final url = Platform.isAndroid ? googlePlayUrl : appStoreUrl;
      //   if (!await launchUrl(Uri.parse(url))) {
      //     throw "Cannot launch the store URL";
      //   }
      // }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('''ストアを開けませんでした！！
        ${e}''')),
      );
      print('''ストアを開けませんでした！！
        ${e}''');
    }
  }

  // 不具合を報告
  Widget _reportError() {
    return SimpleDialog(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0.w),
          child: Column(
            children: [
              TextFormField(
                maxLines: null,
                controller: _subjectController,
                decoration: InputDecoration(
                  labelText: "件名",
                  enabledBorder: UnderlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () => _subjectController.clear(),
                    icon: Icon(Icons.clear),
                  ),
                ),
                textInputAction: TextInputAction.next,
              ),
              TextFormField(
                maxLines: null,
                controller: _mailController,
                decoration: InputDecoration(
                  labelText: "本文",
                  enabledBorder: UnderlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () => _mailController.clear(),
                    icon: Icon(Icons.clear),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: EdgeInsets.only(right: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () async {
                  final email = Email(
                    subject: _subjectController.text,
                    body: _mailController.text,
                    recipients: ["yongshushitian97@gmail.com"],
                    isHTML: false,
                  );
                  await FlutterEmailSender.send(email);
                },
                child: Text("送信する"),
                style: ElevatedButton.styleFrom(
                  elevation: 3.0,
                ),
              ),
              const SizedBox(
                width: 12.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.onPrimary,
                  foregroundColor: Theme.of(context).colorScheme.primary,
                  elevation: 3.0,
                ),
                onPressed: () => Navigator.pop(context),
                child: Text("戻る"),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // 利用規約
  Widget _termsOfUse() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0.h),
      child: ListTile(
        tileColor: Theme.of(context).cardColor,
        title: TextButton(
          style: TextButton.styleFrom(
            alignment: Alignment.centerLeft,
            foregroundColor:
                Theme.of(context).colorScheme.brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
          ),
          onPressed: () => _openUrl(context, termsUrl),
          child: Text(
            "利用規約",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }

  // プライバシーポリシー
  Widget _privacyPolicyOfUse() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0.h),
      child: ListTile(
        tileColor: Theme.of(context).cardColor,
        title: TextButton(
          style: TextButton.styleFrom(
            alignment: Alignment.centerLeft,
            foregroundColor:
                Theme.of(context).colorScheme.brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
          ),
          onPressed: () => _openUrl(context, privacyPolicyURL),
          child: Text(
            "プライバシーポリシー",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }

  _openUrl(BuildContext context, String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("URLを開くことができませんでした：$url")),
      );
    }
  }

  // todo 今日のタスク
  Widget _tasksForToday() {
    return Column(
      children: [
        // todo 今日のタスク1
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0.h.h),
          child: CheckboxListTile(
            title: TextField(
              maxLines: null,
              decoration: InputDecoration(
                labelText: "タスク1",
                // contentPadding: EdgeInsets.all(0),
              ),
              controller: _firstTaskForToday,
              style: TextStyle(fontSize: 17.0.sp),
              // todo テキストが変更された場合
              onChanged: (text) => _editTaskForToday(
                text,
                id: _taskForToday[0].id,
                editTask: _taskForToday[0],
                // isChecked: _taskForToday[0].isChecked,
              ),
              textInputAction: TextInputAction.done,
            ),
            value: _isSelected[0],
            onChanged: (newValue) {
              _editTaskForToday(
                _firstTaskForToday.text,
                id: _taskForToday[0].id,
                isChecked: newValue,
                editTask: _taskForToday[0],
              );
              setState(() {
                _isSelected[0] = newValue!;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
        ),

        // todo 今日のタスク2
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0.h.h),
          child: CheckboxListTile(
            title: TextField(
              maxLines: null,
              decoration: const InputDecoration(labelText: "タスク2"),
              controller: _secondTaskForToday,
              style: TextStyle(fontSize: 17.0.sp),
              // todo 今日のタスク2に変更があった場合
              onChanged: (text) => _editTaskForToday(
                text,
                id: _taskForToday[1].id,
                editTask: _taskForToday[1],
                // isChecked: _taskForToday[1].isChecked,
              ),
              textInputAction: TextInputAction.done,
            ),
            value: _isSelected[1],
            onChanged: (newValue) {
              _editTaskForToday(
                _secondTaskForToday.text,
                id: _taskForToday[1].id,
                isChecked: newValue,
                editTask: _taskForToday[1],
              );
              setState(() {
                _isSelected[1] = newValue!;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
        ),

        // todo 今日のタスク3
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0.h.h),
          child: CheckboxListTile(
            title: TextField(
              maxLines: null,
              decoration: const InputDecoration(labelText: "タスク3"),
              controller: _thirdTaskForToday,
              style: TextStyle(fontSize: 17.0.sp),
              // todo 今日のタスク3に変更があった場合
              onChanged: (text) => _editTaskForToday(
                text,
                id: _taskForToday[2].id,
                editTask: _taskForToday[2],
                // isChecked: _taskForToday[2].isChecked,
              ),
              textInputAction: TextInputAction.done,
            ),
            value: _isSelected[2],
            onChanged: (newValue) {
              _editTaskForToday(
                _thirdTaskForToday.text,
                id: _taskForToday[2].id,
                isChecked: newValue,
                editTask: _taskForToday[2],
              );
              setState(() {
                _isSelected[2] = newValue!;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
        ),
      ],
    );
  }

  // todo 「今日のタスク」変更処理
  _editTaskForToday(text,
      {required id, isChecked, required DayTask editTask}) async {
    print("今日は${today}です。");
    print("result: ${editTask.result}");

    // データ行を指定
    var dayTask = DayTask(
      task: text,
      date: today,
      id: id,
      isChecked: isChecked ?? false,
      result: editTask.result,
      improvement: editTask.improvement,
    );

    // 例外処理を含む
    try {
      // todo 主キーがないのでupdateできない。　＞＞ 自動生成されるIDを取得
      await database.updateDayTask(dayTask);
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
  }

  // todo レビュー画面遷移ボタンWidget
  Widget _reviewButton() {
    return PopupMenuButton(
      initialValue: _selectedValue,
      onSelected: (String? s) {
        setState(() {
          _selectedValue = s!;
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
              _interstitialStack++;
              _toastCount = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReviewScreen(
                    reviewStatus: ReviewStatus.date,
                    timeStatus: s == "今日のタスクをレビュー"
                        ? TimeStatus.now
                        : TimeStatus.previous,
                    toastCount: _toastCount,
                  ),
                ),
              );

              if (isEditedReview) {
                _taskForToday = await database.allTasksForToday;
              }

              setState(() {
                print("レビュー: ${_taskForToday[0].result}");
              });
            },
          );
        }).toList();
      },
    );
  }

  // todo 「明日のタスクを設定」ボタン
  Widget _tomorrowButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 8.0.w),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          // ボタンの大きさ
          minimumSize: Size(double.infinity, 90.h),
          // カラー
          // foregroundColor: _isGetColor
          //     ? Color(_themeColor[0].onPrimaryNum)
          //     : Theme.of(context).primaryColor,
          // backgroundColor: _isGetColor
          //     ? Color(_themeColor[0].primaryNum)
          //     : Theme.of(context).canvasColor,
        ),
        onPressed: () async {
          _focusNode.unfocus();
          _interstitialStack++;
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TasksForTomorrow(),
            ),
          );
        },
        child: Text(
          "明日のタスクを設定",
          style: TextStyle(
            fontSize: 25.sp,
            // color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _weekButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0.h, horizontal: 8.0.w),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0),
          // ボタンの大きさ
          minimumSize: Size(double.infinity, 90.h),
          // カラー
          // foregroundColor: _isGetColor
          //     ? Color(_themeColor[0].onPrimaryNum)
          //     : Theme.of(context).primaryColor,
          // backgroundColor: _isGetColor
          //     ? Color(_themeColor[0].primaryNum)
          //     : Theme.of(context).canvasColor,
        ),
        onPressed: () {
          _focusNode.unfocus();
          _interstitialStack++;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TasksForWeek()),
          );
        },
        child: Text(
          "今週のタスク",
          style: TextStyle(
            fontSize: 25.0.sp,
            // color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _monthButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0.h, horizontal: 8.0.w),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0),
          // ボタンの大きさ
          minimumSize: Size(double.infinity, 90.h),
          // カラー
          // foregroundColor: _isGetColor
          //     ? Color(_themeColor[0].onPrimaryNum)
          //     : Theme.of(context).primaryColor,
          // backgroundColor: _isGetColor
          //     ? Color(_themeColor[0].primaryNum)
          //     : Theme.of(context).canvasColor,
        ),
        onPressed: () {
          _focusNode.unfocus();
          _interstitialStack++;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TasksForMonth(),
            ),
          );
        },
        child: Text(
          "今月のタスク",
          style: TextStyle(
            fontSize: 25.0.sp,
            // color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _yearButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0.h, horizontal: 8.0.w),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0),
          // ボタンの大きさ
          minimumSize: Size(double.infinity, 90.h),
          // カラー
          // foregroundColor: _isGetColor
          //     ? Color(_themeColor[0].onPrimaryNum)
          //     : Theme.of(context).primaryColor,
          // backgroundColor: _isGetColor
          //     ? Color(_themeColor[0].primaryNum)
          //     : Theme.of(context).canvasColor,
        ),
        onPressed: () {
          _focusNode.unfocus();
          _interstitialStack++;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TasksForYear(),
            ),
          );
        },
        child: Text(
          "今年のタスク",
          style: TextStyle(
            fontSize: 25.0.sp,
            // color: Colors.black,
          ),
        ),
      ),
    );
  }

  // todo 「履歴」ボタンWidget
  Widget _historyButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0.h, horizontal: 8.0.w),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          // ボタンの大きさ
          minimumSize: Size(double.infinity, 90.h),
          // カラー
          // foregroundColor: _isGetColor
          //     ? Color(_themeColor[0].onPrimaryNum)
          //     : Theme.of(context).primaryColor,
          // backgroundColor: _isGetColor
          //     ? Color(_themeColor[0].primaryNum)
          //     : Theme.of(context).canvasColor,
        ),
        onPressed: () async {
          _focusNode.unfocus();
          _interstitialStack++;
          // 履歴画面でcheckboxが更新される可能性がある
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HistoryScreen(
                formatAtNavigation: TaskFormat.date,
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
          "履歴",
          style: TextStyle(
            fontSize: 25.0.sp,
            // color: Colors.black,
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

  // todo dispose
  @override
  void dispose() {
    _focusNode.dispose();
    _ad?.dispose();
    _isAdLoaded = false;
    _interstitialAd?.dispose();
    _interstitialStack = 0;
    _subjectController.dispose();
    _mailController.dispose();
    super.dispose();
  }

  // todo バナー広告をロードするメソッド in initState
  _loadBannerAd() async {
    await _initGoogleMobileAds();
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
        height: 100.0.h,
        alignment: Alignment.center,
        child: _isAdLoaded ? AdWidget(ad: _ad!) : null,
      );
    });
  }

// todo アダプティブバナー広告Widget
// Widget _adaptiveBannerAd() {
//   // _getAdSizeでcontextを使用するため、Builderで作成
//   return Builder(builder: (context) {
//       return Container(
//         alignment: Alignment.center,
//         // サイズ（取得前は0、取得後はそのサイズに）
//         height:
//         _adSize != null ? _adSize!.height.toDouble() : 0,
//         width: _adSize != null ? _adSize!.width.toDouble() : 0,
//
//         // todo アダプティブバナー広告を作成
//         // サイズがFutureで返ってくるので、バナーはFutureBuilderで作成
//         child: FutureBuilder(
//           future: _getAdSize(context),
//           builder: (context, snapshot) {
//             // 非同期処理が完了した状態なら
//             if (snapshot.connectionState ==
//                 ConnectionState.done) {
//               // エラー処理
//               if (snapshot.hasError) {
//                 return Center(
//                   child: Text(
//                     snapshot.error.toString(),
//                     textAlign: TextAlign.center,
//                     textScaler: TextScaler.linear(1.3),
//                   ),
//                 );
//               }
//
//               // todo 広告がLoad済みかどうか（2025/02/27）
//               // Load済みじゃない（!_isAdLoaded）なら、_adの初期化を行う
//               if (!_isAdLoaded) {
//                 _ad = BannerAd(
//                   size: _adSize!,
//                   adUnitId: AdHelper.bannerAdUnitId,
//                   listener: BannerAdListener(
//                     onAdLoaded: (_) {
//                       // Loadが完了したらリビルド
//                       setState(() {
//                         _isAdLoaded = true;
//                       });
//                     },
//                     onAdFailedToLoad: (ad, error) {
//                       // 失敗時の処理
//                       ad.dispose();
//                       print(
//                         "Ad load failed (code = ${error
//                             .code} message = ${error.message})",
//                       );
//                     },
//                   ),
//                   request: AdRequest(),
//                 );
//
//                 _ad.load();
//                 return Container();
//                 // setStateはここで(Loadして、広告サイズのcontainerを用意してから)回るってこと？
//               }
//               // todo Loadされた広告を表示
//               return AdWidget(ad: _ad);
//             }
//             // 非同期処理が未完了なら何も表示させない
//             else {
//               return Container();
//             }
//           },
//         ),
//       );
//     });
// }
}

// todo いつかやるべきタスクリスト
