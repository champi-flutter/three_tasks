
import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tomorrows_editing_controller.g.dart';

/// 翌日のタスクの編集状態を管理するクラス
@riverpod
class TomorrowsEditingController extends _$TomorrowsEditingController{
  @override
  TextEditingController build({String? text}){
    final controller = TextEditingController(text: text);
    ref.onDispose(() => controller.dispose());
    return controller;
  }
}