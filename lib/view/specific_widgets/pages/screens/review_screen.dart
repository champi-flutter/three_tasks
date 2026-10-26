import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/main.dart';
import 'package:three_tasks/presentation/view_model/setting_view_model/page_settings_view_model/page_settings_view_model.dart';
import 'package:three_tasks/view/specific_widgets/buttons/auto_save_switch.dart';
import '../../../screens/history_screen.dart';
import '../../../screens/todays_screen.dart';

// enum ReviewStatus { date, week, month, year }
//
// enum TimeStatus { now, previous }
//
// bool _isEditedReview = false;
//
// get isEditedReview => _isEditedReview;

class ReviewScreen extends ConsumerWidget {

  const ReviewScreen({
    required this.controlledPageIndex,
  });

  final int controlledPageIndex;

  // todo build
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // この画面のスコープの Token
    final Token reviewScreenToken = ref.generateToken();

    // この画面に未保存の編集があるかどうか
    final isEdited = ref.watch(editViewModelProvider(reviewScreenToken));

    // PageSettingsViewModel を監視する
    final settingsVMState = ref.watch(pageSettingsViewModelProvider);

    return settingsVMState.when(
      onReceived: (data){
        final bool willAutoSave = data[controlledPageIndex].reviewAutoSaves;
        return SafeArea(
        child: AlertUnsavedScope(
          scopeToken: reviewScreenToken,
          // 自動保存オフのとき、アラートを有効にする
          isAlertValid: !willAutoSave,
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
              title: UtilizedText(
                "レビュー",
                fontSize: 21,
              ),
              actions: [
                // 自動保存オンオフスイッチ
                AutoSaveSwitch.review(
                  pageIndex: controlledPageIndex,
                  // スイッチ切り替え時の保存処理
                  onSwitched: (bool value) async {
                    // 自動保存オフ => オン の場合
                    if (value) {
                      // todo 自動保存オフからオンに切り替えた時の処理（2026/10/26）＞＞
                    }
                    // 自動保存オン => オフ の場合
                    else {
                      // 追加の処理はなし
                    }
                  },
                ),
                _saveButton(),
              ],
            ),

            // resizeToAvoidBottomInset: false,

            // todo レビュー画面の body（2026/10/26）＞＞
            body: SingleChildScrollView(
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
                  ],
                ),
              ),
            ),
          ),
        ),
      );
      },
      onLoading: (placeholder) {
        return Container();
      },
      // エラーや例外が発生した場合は、NotificationView（riverpod_wrapper）
      // で表示される
      onError: (placeholder, _) {
        return Container();
      },
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
