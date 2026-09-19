import 'package:three_tasks/enum/task_recurrence.dart';

class TaskInfoOfReview {
  final TaskRec taskRec;

  final int taskId;

  // 64ビット整数（bitId）からデコードするコンストラクタ
  factory TaskInfoOfReview.fromBitId(int bitId) {
    // タスクの種類（1 or 2）を復元する
    // （上位32ビットを取り出して右シフトし、0xFFFFFFFF でマスクする）
    final recValue = (bitId >> 32) & 0xFFFFFFFF;
    final taskRec = switch (recValue) {
      1 => TaskRec.day,
      2 => TaskRec.week,
      3 => TaskRec.month,
      4 => TaskRec.year,
      _ => throw Exception(
          "Reviews に含まれる TaskRec の情報が不適当です（$recValue）",
        ),
    };

    // タスクの ID を復元する
    // （下位32ビットをマスクする）
    final taskId = bitId & 0xFFFFFFFF;

    return TaskInfoOfReview._(taskRec, taskId);
  }

  const TaskInfoOfReview._(this.taskRec, this.taskId);
}
