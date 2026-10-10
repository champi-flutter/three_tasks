import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/domain/application_config.dart';
import 'package:three_tasks/presentation/presenter/labels_presenter_impl.dart';
import 'package:three_tasks/presentation/presenter/settings_presenter_impl.dart';
import 'package:three_tasks/presentation/view_model/labels_view_model/labels_view_model.dart';
import 'package:three_tasks/presentation/view_model/setting_view_model/page_settings_view_model/page_settings_view_model.dart';
import 'package:three_tasks/use_case/output_boundary/labels_presenter.dart';
import 'package:three_tasks/use_case/output_boundary/settings_presenter.dart';

part 'presenter_providers.g.dart';


// todo 各 Presenter の Provider をこっちに移していく（2026/09/19）＞＞
/// ラベルデータ反映クラス
@riverpod
LabelsPresenter labelsPresenter(Ref ref) => LabelsPresenterImpl(
      labelsViewModel: ref.watch(labelsViewModelProvider.notifier),
    );

/// 各種設定反映クラス
@riverpod
SettingsPresenter settingsPresenter(Ref ref)=> SettingsPresenterImpl(
  pageSettingsViewModelNotifier: ref.watch(pageSettingsViewModelProvider.notifier),
);
