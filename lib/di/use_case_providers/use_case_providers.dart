
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/di/presentation_providers/presenter_providers.dart';
import 'package:three_tasks/di/providers.dart';
import 'package:three_tasks/use_case/input_boundary/fetch_label/fetch_label_use_case.dart';
import 'package:three_tasks/use_case/input_boundary/save_task_changes/draft/draft_task_changes_use_case.dart';
import 'package:three_tasks/use_case/interactor/fetch_label/fetch_label_interactor.dart';
import 'package:three_tasks/use_case/interactor/save_task_changes/draft/draft_task_changes_interactor.dart';

part 'use_case_providers.g.dart';

// todo UseCase 層のクラスの Provider をこっちに移していく（2026/09/19）＞＞
/// ラベルフェッチフロー
@riverpod
FetchLabelUseCase fetchLabelUseCase(Ref ref, Token token) => FetchLabelInteractor(
  dataRepository: ref.watch(dataRepositoryProvider),
  labelsPresenter: ref.watch(labelsPresenterProvider(token)),
  loadingService: ref.watch(loadingServiceProvider),
  notificationService: ref.watch(notificationServiceProvider),
);

/// タスク情報の変更を下書きとして保有する処理フロー
@riverpod
DraftTaskChangesUseCase draftTaskChangesUseCase(Ref ref) => DraftTaskChangesInteractor(
  notificationService: ref.watch(notificationServiceProvider),
  loadingService: ref.watch(loadingServiceProvider),
  dailyTasksPresenter: ref.watch(dailyTasksPresenterProvider),
);