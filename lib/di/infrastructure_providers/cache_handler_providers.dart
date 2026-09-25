
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:three_tasks/infrastructure/drivers/cache_handler/labels_cache_handler_impl.dart';
import 'package:three_tasks/infrastructure/gateway/driver_interface/cache_handler_interface/labels_cache_handler.dart';

part 'cache_handler_providers.g.dart';

/// ラベルのキャッシュハンドラ
@riverpod
LabelsCacheHandler labelsCacheHandler(Ref ref)=> LabelsCacheHandlerImpl();