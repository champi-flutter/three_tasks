import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:three_tasks/view/screens/home_screen.dart';

import 'db/database.dart';

late MyDatabase database;

final now = DateTime.now();
DateFormat outputFormat = DateFormat("yyyy-MM-dd");
final today = outputFormat.format(now);
// final tomorrow = outputFormat.format(DateTime(now.year, now.month, now.day + 1,),);
final tomorrow = outputFormat.format(
  now.add(Duration(days: 1)),
);

// この時点では、firstDayは0
DateFormat weeklyOutputFormat = DateFormat("yyyy-MM-${now.day}");
final thisWeek = weeklyOutputFormat.format(now);
DateFormat monthlyOutputFormat = DateFormat("yyyy-MM");
final thisMonth = monthlyOutputFormat.format(now);
DateFormat yearlyOutputFormat = DateFormat("yyyy");
final thisYear = yearlyOutputFormat.format(now);

void main() {
  // todo shared_preferencesは、shared_preferences_async/_with_catheに移行する必要あり

  // SharedPreferencesのインスタンスを非同期で取得
  // final prefs = await SharedPreferences.getInstance();
  // // 適当なキー名でbool型のデータを取得
  // // prefs.getBool("launched")は、初回起動時にはsetされていないためnullになる。
  // // 二回目以降は、"launched"というfalseのデータが、HomeScreenのbuildメソッドでsetされている。
  // bool _isFirstLaunch = prefs.getBool("launched") ?? true;
  database = MyDatabase();

  // // todo Mobile Ads SDKの初期化
  // WidgetsFlutterBinding.ensureInitialized();
  // MobileAds.instance.initialize();

  runApp(ProviderScope(
    child: MyApp(
        // isFirstLaunch: _isFirstLaunch,
    
        ),
  ));
}

class MyApp extends StatelessWidget {
  // final bool isFirstLaunch;

  // const MyApp({
  //   super.key,
  //   required this.isFirstLaunch,
  // });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // designSize: Size(411, 913),
      designSize: Size(412, 915),
      minTextAdapt: false,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp(
        title: "3タスクス",
        theme: ThemeData(
          colorScheme: ColorScheme(
            brightness: Brightness.light,
            // 主要なWidgetの背景など
            primary: Colors.green,
            // 主要なWidget内の文字、アイコンなど
            onPrimary: Colors.white,
            // ダイアログのボタン背景など
            secondary: Colors.greenAccent,
            // ダイアログのボタン内の文字、アイコンなど
            onSecondary: Colors.black,
            error: Colors.black,
            onError: Colors.greenAccent,
            // AppBar背景など
            surface: Colors.green,
            // TextFieldの下線、AppBarの文字など
            onSurface: Colors.white,
          ),
          useMaterial3: false,
          fontFamily: "KosugiMaru",
          datePickerTheme: const DatePickerThemeData(),
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme(
            brightness: Brightness.dark,
            primary: Colors.teal,
            onPrimary: Colors.black,
            secondary: Colors.teal,
            onSecondary: Colors.white,
            error: Colors.white,
            onError: Colors.teal,
            surface: Colors.teal,
            onSurface: Colors.black,
          ),
          useMaterial3: false,
          fontFamily: "KosugiMaru",
          datePickerTheme: const DatePickerThemeData(
              // headerBackgroundColor: Colors.black,
              // headerForegroundColor: Colors.white,
              // rangePickerBackgroundColor: Colors.black,
              // dayStyle: TextStyle(color: Colors.white),
              // todayBorder: BorderSide(
              //   color: Colors.orange,
              // ),
              ),
        ),
        builder: FToastBuilder(),
        home: HomeScreen(
            // isFirstHomeScreen: isFirstLaunch,
            ),
      ),
    );
  }
}
