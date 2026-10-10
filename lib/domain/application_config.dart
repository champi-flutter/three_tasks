

import 'package:riverpod_wrapper/riverpod_wrapper.dart';

/// 設定で管理するページの情報
final PageConfig pageConfig = PageConfig(
  keyList: PageKeyList([
    PageKey("today"),
    PageKey("tomorrow"),
    PageKey("weekly"),
    PageKey("monthly"),
    PageKey("yearly"),
  ]),
);