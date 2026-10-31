import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/config/private_config.dart';

class CommonScaffold extends StatelessWidget {
  const CommonScaffold({super.key,
    required this.title,
    this.appBarActions,
    required this.body,
  });

  /// [AppBar] のタイトルの文字列
  final String title;

  /// [AppBar] の右側に配置する Widget のリスト
  final List<Widget>? appBarActions;

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar
      appBar: AppBar(
        toolbarHeight: 56.h,
        centerTitle: true,
        title: UtilizedText(
          title,
          fontSize: 21,
        ),
        actions: appBarActions,
      ),
      // drawer
      drawer: ScaffoldMenuBar(
        termsUrl: PrivateConfig.termsUrl,
        privacyPolicyUrl: PrivateConfig.privacyPolicyUrl,
      ),
      resizeToAvoidBottomInset: false,

      body: body,
    );
  }
}
