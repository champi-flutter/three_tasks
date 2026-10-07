

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';

part 'auto_save_view_model.g.dart';

@riverpod
class AutoSaveViewModel extends _$AutoSaveViewModel {
  // todo （2026/10/03）＞＞
  @override
  LazyViewState<bool> build(){
    _initViewModel();
    // todo placeholder 用のスイッチ（2026/10/05）＞＞
    return LazyViewState<bool>.placeholder(true);
  }

  Future<void> _initViewModel () async {

  }

  /// この VM の [state] を更新する
  void update(bool newState){
    if(state.data != newState){
      state = LazyViewState.data(newState);
    }
  }
}