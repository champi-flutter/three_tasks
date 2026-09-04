import 'package:flutter/material.dart';
import 'package:three_tasks/view/screens/home_screen.dart';
import 'package:three_tasks/view/screens/monthly_tasks_screen.dart';
import 'package:three_tasks/view/screens/tomorrows_screen.dart';
import 'package:three_tasks/view/screens/weekly_tasks_screen.dart';
import 'package:three_tasks/view/screens/yearly_tasks_screen.dart';

/// スワイプで遷移する画面の列挙型
enum ScreenType {
  today._(appBarTitle: "今日のタスク", chipsName: "今日のタスク"),
  tomorrow._(appBarTitle: "明日のタスク", chipsName: "明日のタスク"),
  week._(appBarTitle: "今週のタスク", chipsName: "週タスク"),
  month._(appBarTitle: "今月のタスク", chipsName: "月タスク"),
  year._(appBarTitle: "今年のタスク", chipsName: "年タスク");

  const ScreenType._({required this.appBarTitle, required this.chipsName});

  /// AppBar のタイトル
  final String appBarTitle;

  /// `ChoiceChip` の文字
  final String chipsName;

  /// 画面クラスのコンストラクタ
  Widget get constructor => switch (this) {
        ScreenType.today => HomeScreen(),
        ScreenType.tomorrow => TomorrowsScreen(),
        ScreenType.week => WeeklyTasksScreen(),
        ScreenType.month => MonthlyTasksScreen(),
        ScreenType.year => YearlyTasksScreen(),
      };

  // todo provider を指定できるようにしたいが、型を指定できないので意味がなくなる（2026/06/29）＞＞
}
