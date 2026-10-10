import 'package:custom_core_types/custom_core_types.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/di/use_case_providers/use_case_providers.dart';
import 'package:three_tasks/domain/application_config.dart';
import 'package:three_tasks/presentation/view_state/v_setting/v_page_setting.dart';
import 'package:three_tasks/use_case/input_boundary/fetch_settings/fetch_settings_use_case.dart';

part 'page_settings_view_model.g.dart';

/// 各ページの設定
@riverpod
class PageSettingsViewModel extends _$PageSettingsViewModel {
  @override
  LazyViewState<VSettingsMap> build() {
    _initViewModel();

    final placeholder = VSettingsMap.initFromPageList(
      numberOfPages: pageConfig.numberOfPages,
    );
    return LazyViewState.placeholder(placeholder);
  }

  FetchSettingsUseCase get _fetchSettingsUseCase => ref.read(fetchSettingsUseCaseProvider);

  Future<void> _initViewModel() async {
    await _fetchSettingsUseCase.execute(validLength: pageConfig.numberOfPages);
  }

  /// この VM の [state] を更新する
  void update(VSettingsMap newState) {
    if (state.data.hasChanges(newState)) {
      state = LazyViewState.data(newState);
    }
  }
}
