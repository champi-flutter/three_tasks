// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
//
// /// [DateTime.now] の時刻なし版
// DateTime get nowDate => DateTime.now().omitTime;
//
// /// [DateTime.now] の時刻あり版
// DateTime get nowWithTime => DateTime.now();
//
// /// 今日（[Date] 型）
// Date get today => DateTime.now().toDate();
//
// /// 今日の日付を`yyyymmdd` の整数で参照
// int get todaysId => DateTime.now().dateId;
//
// /// 〜日前（[priorToToday]）の日付
// Date priorDate(int priorToToday) =>
//     DateTime.now().omitTime.subtract(Duration(days: priorToToday)).toDate();
//
// extension DateTimeExtensions on DateTime {
//   /// 時刻なしのDateTime（UTC 不可）
//   DateTime get omitTime => DateTime(year, month, day);
//
//   /// [Date] に変換
//   Date toDate() => Date(year, month, day);
//
//   /// [Month] に変換
//   Month toMonth() => Month(year, month);
//
//   /// [n] ヶ月前の日付を取得する
//   DateTime nMonthsAgo(int n, {bool hasTime = false}) {
//     // 月を差し引く
//     final int targetYear = year;
//     final int targetMonth = month - n;
//
//     // 末日を超えている場合は変化しうる
//     int targetDay = day;
//
//     // 計算後の月の「本来の末日」を確認
//     // 一旦、その月の「1日」を作ってから、翌月の0日を指定して末日を得る
//     final int lastDayOfTargetMonth = DateTime(
//       targetYear,
//       targetMonth + 1,
//       0,
//     ).day;
//
//     // 元の日がターゲット月の末日を超えていたら、末日に合わせる
//     if (targetDay > lastDayOfTargetMonth) {
//       targetDay = lastDayOfTargetMonth;
//     }
//     if (hasTime) {
//       return DateTime(
//         targetYear,
//         targetMonth,
//         targetDay,
//         hour,
//         minute,
//         second,
//         millisecond,
//         microsecond,
//       );
//     } else {
//       return DateTime(targetYear, targetMonth, targetDay);
//     }
//   }
//
//   /// [n] ヶ月後の日付を取得する
//   DateTime nMonthsLater(int n, {bool hasTime = false}) {
//     final int targetYear = year;
//     final int targetMonth = month + n;
//
//     // 末日を超えている場合は変化しうる
//     int targetDay = day;
//
//     // 計算後の月の「本来の末日」を確認
//     // 一旦、その月の「1日」を作ってから、翌月の0日を指定して末日を得る
//     final int lastDayOfTargetMonth = DateTime(
//       targetYear,
//       targetMonth + 1,
//       0,
//     ).day;
//
//     // 3. 元の日がターゲット月の末日を超えていたら、末日に合わせる
//     if (targetDay > lastDayOfTargetMonth) {
//       targetDay = lastDayOfTargetMonth;
//     }
//     if (hasTime) {
//       return DateTime(
//         targetYear,
//         targetMonth,
//         targetDay,
//         hour,
//         minute,
//         second,
//         millisecond,
//         microsecond,
//       );
//     } else {
//       return DateTime(targetYear, targetMonth, targetDay);
//     }
//   }
//
//   /// 月末の日付（月の日数）
//   int get getEndOfMonth => Month(year, month).numberOfDays;
//
//   /// `yyyymmdd` の整数を返す
//   int get dateId => year * 10000 + month * 100 + day;
//
//   /// 今日かどうか
//   bool get isToday => isSameDay(day1: this, day2: today.toDateTime());
// }
//
// /// n年前取得メソッド
// DateTime nYearsAgo({required DateTime date, required int n}) {
//   return DateTime(date.year - n, date.month, date.day);
// }
//
// /// 日付一致確認メソッド
// bool isSameDay({required DateTime day1, required DateTime day2}) {
//   return day1.dateId == day2.dateId;
// }
//
// /// 日付比較メソッド
// bool isDay1AfterDay2({required DateTime day1, required DateTime day2}) {
//   return day1.dateId > day2.dateId;
// }
//
// /// todo 日付引き算メソッド
// ///
// /// DateTime().difference()は時間単位で引き算するので24時間空いてないと1日と判定されない
// int difference({required DateTime day1, required DateTime day2}) {
//   print("");
//   print("日付引き算メソッド: $day1, $day2");
//   print("");
//   if (day1.year == day2.year) {
//     if (day1.month == day2.month) {
//       if (day1.day >= day2.day) {
//         return day1.day - day2.day;
//       } else {
//         return day2.day - day1.day;
//       }
//     }
//     // 月をまたぐ場合（day1 > day2）
//     else if (day1.month > day2.month) {
//       return _differenceAcrossMonths(month1: day1, month2: day2);
//     }
//     // 月をまたぐ場合（day2 > day1）
//     else {
//       return _differenceAcrossMonths(month1: day2, month2: day1);
//     }
//   }
//   // 年をまたぐ場合（day1 > day2）
//   else if (day1.year > day2.year) {
//     return _differenceAcrossMonths(month1: day1, month2: day2);
//   }
//   // 年をまたぐ場合（day2 > day1）
//   else {
//     return _differenceAcrossMonths(month1: day2, month2: day1);
//   }
// }
//
// /// 月をまたぐ場合（month1 > month2）（in _difference()）
// int _differenceAcrossMonths({
//   required DateTime month1,
//   required DateTime month2,
// })
// //
// {
//   print("月をまたぐ場合: $month1, $month2");
//   // 年をまたぐ場合を考慮
//   final int yearDifference = month1.year - month2.year;
//   // month1の月数をmonth2の年に合わせる
//   final int optimizedMonth = month1.month + yearDifference * 12;
//   final int monthDifference = optimizedMonth - month2.month;
//   // 表示月数でiヶ月離れている場合、日数換算で(i-1)ヶ月離れている
//   final int correctionValue = monthDifference - 1;
//   // 小さい方のその月の残りの日数と、大きい方のその月の経過日数を差し引いた日数
//   int _additionalDifference = 0;
//   // 小さい方の月の翌月の1日
//   final DateTime month2sNextMonthFirstDay = DateTime(
//     month2.year,
//     month2.month + 1,
//     1,
//   );
//   // 小さい方の月の月末
//   final DateTime month2sEndDay = month2sNextMonthFirstDay.subtract(
//     Duration(days: 1),
//   );
//   // 小さい方のその月の残りの日数
//   final int differenceToEndDay = month2sEndDay.day - month2.day;
//   print("小さい方のその月の残りの日数 = $differenceToEndDay");
//   print("大きい方のその月の経過日数 = ${month1.day}");
//   // 1ヶ月以上離れている場合
//   if (correctionValue != 0) {
//     for (int i = 1; i <= correctionValue; i++) {
//       // 大きい方の月の (i-1) ヶ月前の月の1日
//       final DateTime specifiedMonthFirstDay = DateTime(
//         month1.year,
//         month1.month - (i - 1),
//         1,
//       );
//       // 大きい方の月の i ヶ月前の月の月末
//       DateTime _additionalMonthEndDay = specifiedMonthFirstDay.subtract(
//         Duration(days: 1),
//       );
//       print("${month1.month - i}月の日数 = ${_additionalMonthEndDay.day}");
//       _additionalDifference += _additionalMonthEndDay.day;
//     }
//   }
//   // 小さい方の月の残りの日数 + 大きい方の月中の経過日数 + 間の月分
//   final int result = differenceToEndDay + month1.day + _additionalDifference;
//   return result;
// }
//
// class Month {
//   final int year;
//   final int month;
//
//   // DateTimeのコンストラクタで翌月の「0日」を指定すると、今月の末日が得られるらしい
//   int get numberOfDays => DateTime(year, month + 1, 0).day;
//
//   // int get numberOfDays {
//   //   final DateTime startOfNextMonth = month + 1 <= 12
//   //       ? DateTime(year, month + 1, 1)
//   //       : DateTime(year + 1, 1, 1);
//   //   return startOfNextMonth.subtract(Duration(days: 1)).day;
//   // }
//   const Month(this.year, this.month);
//
//   /// 1ヶ月前を取得するメソッド
//   Month back() {
//     // 1月の場合は、前年の12月を返す
//     if (month == 1) {
//       return Month(year - 1, 12);
//     }
//     // それ以外は、前の月を返す
//     else {
//       return Month(year, month - 1);
//     }
//   }
//
//   /// 1ヶ月後を取得するメソッド
//   Month toNext() {
//     // 12月の場合は、翌年の1月を返す
//     if (month == 12) {
//       return Month(year + 1, 1);
//     }
//     // それ以外は、次の月を返す
//     else {
//       return Month(year, month + 1);
//     }
//   }
//
//   /// [DateTime] に変換（その月の1日）
//   DateTime toDateTime() => DateTime(year, month, 1);
//
//   /// [Date] に変換（その月の1日）
//   Date toDate() => Date.onMonth(this, 1);
// }
//
// /// 時刻なしの日付データ
// @immutable
// class Date {
//   /// 内部で 00:00:00 の [DateTime] を持つ
//   final DateTime _dt;
//
//   Date(int year, int month, int day) : _dt = DateTime(year, month, day);
//
//   Date.onMonth(Month month, int day)
//     : _dt = DateTime(month.year, month.month, day);
//
//   DateTime toDateTime() => _dt;
//
//   /// 内部用コンストラクタ
//   Date._(this._dt);
//
//   /// 年
//   int get year => _dt.year;
//
//   /// 月 (1-12)
//   int get month => _dt.month;
//
//   /// 日 (1-31)
//   int get day => _dt.day;
//
//   /// [n] 日前
//   Date nDaysAgo(int n) => Date._(_dt.subtract(Duration(days: n)));
//
//   /// [n] 日後
//   Date nDaysLater(int n) => Date._(_dt.add(Duration(days: n)));
//
//   /// 今日から何日前か
//   ///
//   /// 今日なら `0` 。
//   int get priorToToday {
//     final todaysDateTime = DateTime.now().omitTime;
//     return todaysDateTime.difference(_dt).inDays;
//   }
//
//   // 各比較演算子
//   @override
//   bool operator ==(Object other) {
//     assert(other is! DateTime, "DateクラスとDateTimeクラスを直接比較しています。（ == ）");
//     return other is Date && _dt == other._dt;
//   }
//
//   bool operator <(Date other) {
//     assert(other is! DateTime, "DateクラスとDateTimeクラスを直接比較しています。( < )");
//     return _dt.isBefore(other._dt);
//   }
//
//   bool operator >(Date other) {
//     assert(other is! DateTime, "DateクラスとDateTimeクラスを直接比較しています。( > )");
//     return _dt.isAfter(other._dt);
//   }
//
//   bool operator <=(Date other) {
//     assert(other is! DateTime, "DateクラスとDateTimeクラスを直接比較しています。( <= )");
//     return _dt.isBefore(other._dt) || _dt == other._dt;
//   }
//
//   bool operator >=(Date other) {
//     assert(other is! DateTime, "DateクラスとDateTimeクラスを直接比較しています。( >= )");
//     return _dt.isAfter(other._dt) || _dt == other._dt;
//   }
//
//   @override
//   int get hashCode => _dt.hashCode;
// }
//
// /// todo printメソッド [date_time_options.dart]
// void _print(String s1, [String? s2, String? s3, String? s4, String? s5]) {
//   if (kDebugMode) {
//     print("");
//     print("[date_time_options.dart]　" + s1);
//     if (s2 != null) print("[date_time_options.dart]　" + s2);
//     if (s3 != null) print("[date_time_options.dart]　" + s3);
//     if (s4 != null) print("[date_time_options.dart]　" + s4);
//     if (s5 != null) print("[date_time_options.dart]　" + s5);
//     print("");
//   }
// }
