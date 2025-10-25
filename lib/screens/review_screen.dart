import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:three_tasks/db/database.dart';
import 'package:three_tasks/main.dart';
import 'package:three_tasks/screens/history_screen.dart';

import '../ad_helper.dart';
import 'home_screen.dart';

enum ReviewStatus { date, week, month, year }

enum TimeStatus { now, previous }

bool _isEditedReview = false;

get isEditedReview => _isEditedReview;

class ReviewScreen extends StatefulWidget {
  final ReviewStatus reviewStatus;

  final TimeStatus timeStatus;

  final int toastCount;

  const ReviewScreen(
      {super.key,
      required this.reviewStatus,
      required this.timeStatus,
      required this.toastCount});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  // ステータス
  late ReviewStatus _reviewStatus;

  // List<DayTask> _taskForToday = [];
  // List<WeeklyTask> _taskForThisWeek = [];
  // List<MonthlyTask> _taskForThisMonth = [];
  // List<YearlyTask> _taskForThisYear =[];
  List _reviewTask = [];

  bool _isTaskLoaded = false;

  List<List<TextEditingController>> _controller = [
    [
      TextEditingController(),
      TextEditingController(),
    ],
    [
      TextEditingController(),
      TextEditingController(),
    ],
    [
      TextEditingController(),
      TextEditingController(),
    ],
  ];

  // TextEditingController _firstController = TextEditingController();
  // TextEditingController _secondController = TextEditingController();
  // TextEditingController _thirdController = TextEditingController();

  // TextEditingControllerのtextにリスト番号に合ったタスクを入れるためにStringのリストを作成
  List<String> _strTaskForTomorrow = [];

  // 達成しなかったタスク一覧に表示させるタスクのリスト
  List<DayTask> _taskListForDialog = [];

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

  int _toastCount = 0;

  // タスクが存在するかどうか
  bool _isNotExist= false;

  // todo initState
  @override
  void initState() {
    // _focusNode = [FocusNode(), FocusNode(), FocusNode()];
    _focusNode = FocusNode();
    _toastCount = widget.toastCount;
    _reviewStatus = widget.reviewStatus;
    // todo バナー広告のロード
    _loadBannerAd();

    // todo タスク取得
    _setItems();
    super.initState();
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

    print("ーーー _adの初期化完了 ーーー");
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

  // todo タスクをデータベースから取得するメソッド
  _setItems() async {
    switch (_reviewStatus) {
      case ReviewStatus.date:
        if (widget.timeStatus == TimeStatus.now) {
          _reviewTask = await database.allTasksForToday;
        } else {
          _reviewTask = await database.allTasksForYesterday;
          if (_reviewTask.length == 0) {
            if (_toastCount == 0) {
              _toastCount++;
              Fluttertoast.showToast(
                msg: '''タスクが見つかりませんでした
              (´・ω・｀)''',
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.TOP,
                textColor: Theme.of(context).colorScheme.secondary,
                backgroundColor: Theme.of(context).colorScheme.onSecondary,
              );
              // todo インタースティシャル広告
              if (interstitialStack % 4 == 0 && _interstitialAd == null) {
                _loadInterstitialAd();
              }
            } else if (_toastCount == 1) {
              Fluttertoast.showToast(
                msg: "だからないって(　˙-˙　)",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.TOP,
                textColor: Theme.of(context).colorScheme.secondary,
                backgroundColor: Theme.of(context).colorScheme.onSecondary,
              );
              _toastCount++;
            } else if (_toastCount == 2) {
              Fluttertoast.showToast(msg: "( ´・ω) (´・ω・) (・ω・｀) (ω・｀ ) ",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.TOP,
                textColor: Theme.of(context).colorScheme.secondary,
                backgroundColor: Theme.of(context).colorScheme.onSecondary,);
              _toastCount = 0;
            }
            _isNotExist = true;
            _reviewTask = ["", "", ""];
          }
        }

      case ReviewStatus.week:
        if (widget.timeStatus == TimeStatus.now) {
          _reviewTask = await database.allTasksForThisWeek;
        } else {
          _reviewTask = await database.allTasksForLastWeek;
          print("_reviewTask!!!!!!!!!");
          print("_reviewTask!!!!!!!!!: ${_reviewTask.length}");
          if (_reviewTask.length == 0) {
            if (_toastCount == 0) {
              _toastCount++;
              Fluttertoast.showToast(
                msg: '''タスクが見つかりませんでした
              (´・ω・｀)''',
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.TOP,
                textColor: Theme.of(context).colorScheme.secondary,
                backgroundColor: Theme.of(context).colorScheme.onSecondary,
              );
            } else if (_toastCount == 1) {
              Fluttertoast.showToast(
                msg: "だからないって(　˙-˙　)",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.TOP,
                textColor: Theme.of(context).colorScheme.secondary,
                backgroundColor: Theme.of(context).colorScheme.onSecondary,
              );
              _toastCount++;
            } else if (_toastCount == 2) {
              Fluttertoast.showToast(msg: "( ´・ω) (´・ω・) (・ω・｀) (ω・｀ ) ",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.TOP,
                textColor: Theme.of(context).colorScheme.secondary,
                backgroundColor: Theme.of(context).colorScheme.onSecondary,);
              _toastCount = 0;
            }
            _isNotExist = true;
            _reviewTask = ["", "", ""];
          }
        }
      case ReviewStatus.month:
        if (widget.timeStatus == TimeStatus.now) {
          _reviewTask = await database.allTasksForThisMonth;
        } else {
          _reviewTask = await database.allTasksForLastMonth;
          if (_reviewTask.length == 0) {
            // todo ToastMessage「タスクが見つかりませんでした(´・ω・｀)」
            if (_toastCount == 0) {
              _toastCount++;
              Fluttertoast.showToast(
                msg: '''タスクが見つかりませんでした
              (´・ω・｀)''',
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.TOP,
                textColor: Theme.of(context).colorScheme.secondary,
                backgroundColor: Theme.of(context).colorScheme.onSecondary,
              );
              // todo インタースティシャル広告
              if (interstitialStack % 4 == 0 && _interstitialAd == null) {
                _loadInterstitialAd();
              }
            } else if (_toastCount == 1) {
              Fluttertoast.showToast(
                msg: "だからないって(　˙-˙　)",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.TOP,
                textColor: Theme.of(context).colorScheme.secondary,
                backgroundColor: Theme.of(context).colorScheme.onSecondary,
              );
              _toastCount++;
            } else if (_toastCount == 2) {
              Fluttertoast.showToast(msg: "( ´・ω) (´・ω・) (・ω・｀) (ω・｀ ) ",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.TOP,
                textColor: Theme.of(context).colorScheme.secondary,
                backgroundColor: Theme.of(context).colorScheme.onSecondary,);
              _toastCount = 0;
            }
            _isNotExist = true;
            _reviewTask = ["", "", ""];
          }
        }
      case ReviewStatus.year:
        if (widget.timeStatus == TimeStatus.now) {
          _reviewTask = await database.allTasksForThisYear;
        } else {
          _reviewTask = await database.allTasksForLastYear;
          if (_reviewTask.length == 0) {
            if (_toastCount == 0) {
              _toastCount++;
              Fluttertoast.showToast(
                msg: '''タスクが見つかりませんでした
              (´・ω・｀)''',
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.TOP,
                textColor: Theme.of(context).colorScheme.secondary,
                backgroundColor: Theme.of(context).colorScheme.onSecondary,
              );
              // todo インタースティシャル広告
              if (interstitialStack % 4 == 0 && _interstitialAd == null) {
                _loadInterstitialAd();
              }
            } else if (_toastCount == 1) {
              Fluttertoast.showToast(
                msg: "だからないって(　˙-˙　)",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.TOP,
                textColor: Theme.of(context).colorScheme.secondary,
                backgroundColor: Theme.of(context).colorScheme.onSecondary,
              );
              _toastCount++;
            } else if (_toastCount == 2) {
              Fluttertoast.showToast(msg: "( ´・ω) (´・ω・) (・ω・｀) (ω・｀ ) ",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.TOP,
                textColor: Theme.of(context).colorScheme.secondary,
                backgroundColor: Theme.of(context).colorScheme.onSecondary,);
              _toastCount = 0;
            }
            _isNotExist = true;
            _reviewTask = ["", "", ""];
          }
        }
    }
    _isTaskLoaded = true;
    if (!_isNotExist){
      _toastCount = 0;
    }

    setState(() {
      for (int i = 0; i < 3; i++) {
        // タスクが存在しない場合
        if (_isNotExist){
          _controller[i][0].text = "";
          _controller[i][1].text = "";
        } else {
          _controller[i][0].text = _reviewTask[i].result ?? "";
          _controller[i][1].text = _reviewTask[i].improvement ?? "";
        }
      }
    });
  }

  // todo dispose
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
    // for (int j = 0; j < 4; j++) {
    //   for (int k = 0; k < 2; k++) {
    //     _controller[j][k].dispose();
    //   }
    // }
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
          if (_isNotExist){
            Navigator.of(context).pop(_toastCount);
            print("　　　　_toastCount = $_toastCount");
          }
          else if (_isEdited) {
            _onPopped();
          } else {
            Navigator.pop(context, _toastCount);
            // todo インタースティシャル広告
            if (interstitialStack % 4 == 0 &&
                _interstitialAd == null &&
                _toastCount == 0) {
              _loadInterstitialAd();
            }
          }
        },
        child: Scaffold(
          // todo AppBar
          appBar: AppBar(
            // foregroundColor: _isGetColor
            //     ? Color(_themeColor[0].onPrimaryNum)
            //     : Theme.of(context).primaryColor,
            // backgroundColor: _isGetColor
            //     ? Color(_themeColor[0].primaryNum)
            //     : Theme.of(context).canvasColor,
            centerTitle: true,
            title: const Text("レビュー"),
            actions: [
              _saveButton(),
            ],
          ),

          // resizeToAvoidBottomInset: false,

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
                          SizedBox(height: 20.0.h),

                          // todo タスク
                          _reviewTasks(),
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
                Navigator.pop(super.context, 0);
                // todo インタースティシャル広告
                if (interstitialStack % 4 == 0 &&
                    _interstitialAd == null &&
                    _toastCount == 0) {
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
            "インタースティシャル広告読み込み失敗 (code = ${error.code} message = ${error.message})",
          );
        },
      ),
      request: AdRequest(),
    );
  }

  // todo レビューWidget
  Widget _reviewTasks() {
    return Column(
      children: [
        ListView.builder(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemCount: _reviewTask.length,
          itemBuilder: (context, int position) => _reviewTasksList(position),
        ),
      ],
    );
  }

  // todo リストタイル
  _reviewTasksList(position) {
    // _controller[position][0].text = _reviewTask[position].result ?? "";
    // _controller[position][1].text = _reviewTask[position].improvement ?? "";
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      key: Key("$position"),
      child: ListTile(
        title: Text(
          _isNotExist? "・":"・${_reviewTask[position].task}",
          style: TextStyle(fontSize: 15.0.sp),
          maxLines: null,
        ),
        subtitle: Column(
          children: [
            Card(
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 4.r),
                title: Text(
                  "結果",
                  style: TextStyle(
                    fontSize: 18.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // todo 結果TextField
                subtitle: _isNotExist?Container(
                  height: 40.h,
                ):TextField(
                  style: TextStyle(fontSize: 14.5.sp),
                  controller: _controller[position][0],
                  maxLines: null,
                  onChanged: (text) {
                    _isEdited = true;
                  },
                  textInputAction: TextInputAction.next,
                ),
              ),
              color: _isNotExist? Colors.white54:null,
            ),
            Card(
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 4.r),
                title: Text(
                  "改善点",
                  style: TextStyle(
                    fontSize: 18.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // todo 改善点TextField
                subtitle: _isNotExist?Container(
                  height: 40.h,
                ):TextField(
                  style: TextStyle(fontSize: 14.5.sp),
                  controller: _controller[position][1],
                  maxLines: null,
                  onChanged: (text) {
                    _isEdited = true;
                  },
                  textInputAction: TextInputAction.done,
                ),
              ),
              color: _isNotExist? Colors.white54:null,
            ),
          ],
        ),
      ),
    );
  }

  // todo 「保存」ボタン
  Widget _saveButton() {
    return TextButton(
      onPressed: _isNotExist? null:() async {
        // _focusNode
        //   ..[0].unfocus()
        //   ..[1].unfocus()
        //   ..[2].unfocus();
        _focusNode.unfocus();
        await _saveTasks();
        Fluttertoast.showToast(msg: "レビューを保存しました。",
          gravity: ToastGravity.TOP,
          textColor: Theme.of(context).colorScheme.secondary,
          backgroundColor: Theme.of(context).colorScheme.onSecondary,);
      },
      child: Text(
        "保存",
        style: TextStyle(
          color: _isNotExist? Colors.grey:Theme.of(context).colorScheme.onSurface,
          fontSize: 18.sp,
        ),
      ),
    );
  }

  // todo 保存メソッド（タスクがないときは走らない）
  _saveTasks() async {
    // この段階で表示されているリストの内容（task, date, id）をデータベースに上書き保存
    switch (_reviewStatus) {
      case ReviewStatus.date:
        var _taskForReview = [
          DayTask(
            task: _reviewTask[0].task,
            date: _reviewTask[0].date,
            id: _reviewTask[0].id,
            isChecked: _reviewTask[0].isChecked,
            result: _controller[0][0].text,
            improvement: _controller[0][1].text,
          ),
          DayTask(
            task: _reviewTask[1].task,
            date: _reviewTask[0].date,
            id: _reviewTask[1].id,
            isChecked: _reviewTask[1].isChecked,
            result: _controller[1][0].text,
            improvement: _controller[1][1].text,
          ),
          DayTask(
            task: _reviewTask[2].task,
            date: _reviewTask[0].date,
            id: _reviewTask[2].id,
            isChecked: _reviewTask[2].isChecked,
            result: _controller[2][0].text,
            improvement: _controller[2][1].text,
          ),
        ];
        await database.updateDayTask(_taskForReview[0]);
        await database.updateDayTask(_taskForReview[1]);
        await database.updateDayTask(_taskForReview[2]);
      case ReviewStatus.week:
        var _taskForReview = [
          WeeklyTask(
            task: _reviewTask[0].task,
            week: _reviewTask[0].week,
            month: _reviewTask[0].month,
            firstDay: _reviewTask[0].firstDay,
            id: _reviewTask[0].id,
            isChecked: _reviewTask[0].isChecked,
            result: _controller[0][0].text,
            improvement: _controller[0][1].text,
          ),
          WeeklyTask(
            task: _reviewTask[1].task,
            week: _reviewTask[1].week,
            month: _reviewTask[1].month,
            firstDay: _reviewTask[1].firstDay,
            id: _reviewTask[1].id,
            isChecked: _reviewTask[1].isChecked,
            result: _controller[1][0].text,
            improvement: _controller[1][1].text,
          ),
          WeeklyTask(
            task: _reviewTask[2].task,
            week: _reviewTask[2].week,

            month: _reviewTask[2].month,
            firstDay: _reviewTask[2].firstDay,
            id: _reviewTask[2].id,
            isChecked: _reviewTask[2].isChecked,
            result: _controller[2][0].text,
            improvement: _controller[2][1].text,
          ),
        ];
        await database.updateWeeklyTask(_taskForReview[0]);
        await database.updateWeeklyTask(_taskForReview[1]);
        await database.updateWeeklyTask(_taskForReview[2]);
      case ReviewStatus.month:
        var _taskForReview = [
          MonthlyTask(
            task: _reviewTask[0].task,
            month: _reviewTask[0].month,
            id: _reviewTask[0].id,
            isChecked: _reviewTask[0].isChecked,
            result: _controller[0][0].text,
            improvement: _controller[0][1].text,
          ),
          MonthlyTask(
            task: _reviewTask[1].task,
            month: _reviewTask[1].month,
            id: _reviewTask[1].id,
            isChecked: _reviewTask[1].isChecked,
            result: _controller[1][0].text,
            improvement: _controller[1][1].text,
          ),
          MonthlyTask(
            task: _reviewTask[2].task,
            month: _reviewTask[2].month,
            id: _reviewTask[2].id,
            isChecked: _reviewTask[2].isChecked,
            result: _controller[2][0].text,
            improvement: _controller[2][1].text,
          ),
        ];
        await database.updateMonthlyTask(_taskForReview[0]);
        await database.updateMonthlyTask(_taskForReview[1]);
        await database.updateMonthlyTask(_taskForReview[2]);
      case ReviewStatus.year:
        var _taskForReview = [
          YearlyTask(
            task: _reviewTask[0].task,
            year: _reviewTask[0].year,
            id: _reviewTask[0].id,
            isChecked: _reviewTask[0].isChecked,
            result: _controller[0][0].text,
            improvement: _controller[0][1].text,
          ),
          YearlyTask(
            task: _reviewTask[1].task,
            year: _reviewTask[1].year,
            id: _reviewTask[1].id,
            isChecked: _reviewTask[1].isChecked,
            result: _controller[1][0].text,
            improvement: _controller[1][1].text,
          ),
          YearlyTask(
            task: _reviewTask[2].task,
            year: _reviewTask[2].year,
            id: _reviewTask[2].id,
            isChecked: _reviewTask[2].isChecked,
            result: _controller[2][0].text,
            improvement: _controller[2][1].text,
          ),
        ];
        await database.updateYearlyTask(_taskForReview[0]);
        await database.updateYearlyTask(_taskForReview[1]);
        await database.updateYearlyTask(_taskForReview[2]);
    };

    _isEditedReview = true;

    setState(() {
      _isEdited = false;
    });

    // print("${}");
  }

  // todo 「履歴を参照」ボタン
  Widget _referButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
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
