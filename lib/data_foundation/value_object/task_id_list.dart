
import 'package:custom_core_types/custom_core_types.dart';
import 'package:data_converter/data_converter.dart';
import 'package:flutter/foundation.dart';

@immutable
class TaskIdList extends IntListSnapshot{
  TaskIdList(super.list);
}

@immutable
class TaskIdBlob extends Int32Blob{
  TaskIdBlob.fromIntList(super.intList) : super.fromIntList();
  TaskIdBlob.fromUint8List(super.uint8List) : super.fromUint8List();
}
