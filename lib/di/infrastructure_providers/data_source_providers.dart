
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:three_tasks/infrastructure/drivers/db/database.dart';
import 'package:three_tasks/infrastructure/gateway/driver_interface/data_source_interface/data_source.dart';

part 'data_source_providers.g.dart';

@riverpod
DataSource dataSource(Ref ref) => MyDatabase();