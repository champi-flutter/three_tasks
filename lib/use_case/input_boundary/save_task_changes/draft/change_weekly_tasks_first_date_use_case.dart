

import 'package:custom_core_types/custom_core_types.dart';

abstract class ChangeWeeklyTasksFirstDateUseCase {
  Future<void> execute({required List<Date?>newFirstDate});
}