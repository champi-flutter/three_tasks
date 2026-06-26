import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'checkable_task_controller.freezed.dart';

@freezed
abstract class CheckableTaskController with _$CheckableTaskController {
  const factory CheckableTaskController({
    required bool isChecked,
    required TextEditingController titleController,
  }) = _CheckableTaskController;
}
