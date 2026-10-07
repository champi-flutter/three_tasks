
import 'package:custom_core_types/custom_core_types.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/presentation/view_state/v_setting/v_page_setting.dart';
import 'package:three_tasks/use_case/input_boundary/fetch_settings/fetch_settings_use_case.dart';

part 'page_settings_view_model.g.dart';

/// 各ページの設定
@riverpod
class PageSettingsViewModel extends _$PageSettingsViewModel{

  @override
  LazyViewState<VSettingsMap> build(FixedList pageList){

    _initViewModel();

    final placeholder = VSettingsMap.initFromPageList(pageList: pageList);
    return LazyViewState.placeholder(placeholder);

  }

  FetchSettingsUseCase get _fetchSettingsUseCase => ref.read();

  Future<void> _initViewModel () async {
    await _fetchSettingsUseCase.execute(validLength: pageList.length);
  }

  /// この VM の [state] を更新する
  void update(VSettingsMap newState){
    if(state.data.hasChanges(newState)){
      state = LazyViewState.data(newState);
    }
  }
}