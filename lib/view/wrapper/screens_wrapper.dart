import 'package:custom_core_types/custom_core_types.dart';
import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/config/private_config.dart';
import 'package:three_tasks/di/providers.dart';
import 'package:three_tasks/enum/task_recurrence.dart';
import 'package:three_tasks/presentation/view_model/setting_view_model/page_settings_view_model/page_settings_view_model.dart';
import 'package:three_tasks/view/custom_widgets_impl/utilized_text_impl.dart';
import 'package:three_tasks/view/screens/review_screen.dart';
import 'package:three_tasks/view/screens/enumeration/screen_type.dart';
import 'package:three_tasks/view/specific_widgets/buttons/auto_save_switch.dart';
import 'package:three_tasks/view/specific_widgets/pages/page_list.dart';
import 'package:three_tasks/view/specific_widgets/pages/task_page_base.dart';

class ScreensWrapper extends ConsumerWidget {
  ScreensWrapper({super.key});

  // todo build
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // このスコープの Token を一元管理
    final Token scopeToken = ref.generateToken();

    // PageIndexViewModel を上の Token で参照して、現在表示されているページの
    // インデックスを取得する
    final currentPageIndex = ref.watch(
      pageIndexViewModelProvider(scopeToken).select(
        (state) => state.currentIndex,
      ),
    );

    final scopedPageList = pageList(scopeToken: scopeToken);

    // インデックスに対応するページ
    final currentPage = scopedPageList[currentPageIndex].value;

    return UnfocusTapScrimScope(
      child: Scaffold(
        // appBar
        appBar: AppBar(
          toolbarHeight: 56.h,
          centerTitle: true,
          // todo サイズ確認
          title: UtilizedText(
            currentPage.title,
            fontSize: 21,
          ),
          actions: [
            // todo レビューボタン（2026/09/29）＞＞
            _NavigationForReview(
              taskRec: currentPage.rec,
            ),
            // 自動保存オンオフスイッチ
            AutoSaveSwitch(
              pageIndex: currentPageIndex,
            ),
          ],
        ),
        // drawer
        drawer: ScaffoldMenuBar(
          termsUrl: PrivateConfig.termsUrl,
          privacyPolicyUrl: PrivateConfig.privacyPolicyUrl,
        ),
        resizeToAvoidBottomInset: false,

        body: Column(
          children: [
            // 画面遷移用の Chip
            _NavigationChips(
              pageList: scopedPageList,
              onChipSelected: (int targetIndex) {
                // ControlledPageView.withGuard で管理しているページを変更する
                ref
                    .read(pageNavigationControllerProvider(scopeToken))
                    .navigateWithGuardTo(targetIndex);
              },
              scopeToken: scopeToken,
            ),
            // 画面本体
            Expanded(
              child: _ScreenBody(
                currentPageIndex: currentPageIndex,
                scopedPageList: scopedPageList,
                scopeToken: scopeToken,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavigationChips extends ConsumerWidget {
  const _NavigationChips({
    super.key,
    required this.pageList,
    required this.onChipSelected,
    required this.scopeToken,
  });

  final ControlledPageList pageList;

  /// Chip が選択されたときの処理
  ///
  /// 引数は、対象の画面のインデックス
  final void Function(int) onChipSelected;

  /// 現在参照している [Token]
  final Token scopeToken;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 現在の画面のインデックスを
    final currentIndex = ref.watch(pageIndexViewModelProvider(scopeToken)
        .select((state) => state.currentIndex));

    return Container(
      height: 60.0,
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      alignment: Alignment.center,
      // AppBarとは別で、独自の背景色や下部ボーダー（境界線）を設定可能
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor, // ボディと同じ背景色
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade200, // 境界線を入れてすっきり見せる
            width: 1.0,
          ),
        ),
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: pageList.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8.0),
        // Chip 1つずつの設定
        itemBuilder: (context, index) {
          final isSelected = currentIndex == index;
          return ChoiceChip(
            // todo サイズ確認（2026/06/10）＞＞
            label: UtilizedText(
              pageList[index].value.shortTitle,
              // 完全に中心を指定
              alignment: AlignmentGeometry.center,
            ),
            // 選択されているかどうか
            // （背景色や文字色が選択時のものへとアニメーションを伴って変化する）
            selected: isSelected,
            selectedColor: Theme.of(context).colorScheme.primary,
            labelStyle: TextStyle(
              color: isSelected ? Colors.white : Colors.black87,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
            // タップ時の処理（引数はタップ後の selected の値）
            onSelected: (bool selected) {
              if (selected) {
                onChipSelected(index);
              }
            },
          );
        },
      ),
    );
  }
}

/// 画面本体
///
/// 設定値取得処理中は、LoadingWrapper （riverpod_wrapper） で
/// タップ不可だが、一応ローディング完了を待って描画する
class _ScreenBody extends ConsumerWidget {
  const _ScreenBody({
    super.key,
    required this.currentPageIndex,
    required this.scopedPageList,
    required this.scopeToken,
  });

  /// 現在参照しているページのインデックス
  final int currentPageIndex;

  /// 対象スコープで管理する [Token]
  final Token scopeToken;

  /// [scopeToken] と同じスコープで定義されるページリスト
  final ControlledPageList<TaskPageBase> scopedPageList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // PageSettingsViewModel を監視する
    final settingsVMState = ref.watch(pageSettingsViewModelProvider);
    return settingsVMState.when(
      onReceived: (data) {
        final bool willAutoSave = data[currentPageIndex].autoSave;

        // riverpod_wrapper の ControlledPageView
        // （自動保存でない場合に未保存の編集を確認するラッパー付き）
        return ControlledPageView.withGuard(
          controlledPageList: scopedPageList,
          // スワイプ不可
          physics: const NeverScrollableScrollPhysics(),
          isAlertValid: willAutoSave,
          scopeToken: scopeToken,
          // 未保存編集破棄ロジック
          onDiscarded: (int targetIndex) {
            // 各ページが TaskPageBase を継承する際に設定した TaskRec
            final targetRec = scopedPageList[targetIndex].value.rec;
            // 下書きの破棄を呼び出す
            ref.read(tasksControllerProvider(scopeToken)).discardDraft(
                  taskRec: targetRec,
                );
          },
        );
      },
      onLoading: (placeholder) {
        return Container();
      },
      // エラーや例外が発生した場合は、NotificationView（riverpod_wrapper）
      // で表示される
      onError: (placeholder, _) {
        return Container();
      },
    );
  }
}

/// レビュー画面へ遷移するボタン
class _NavigationForReview extends StatelessWidget {
  const _NavigationForReview({
    super.key,
    required this.taskRec,
  });

  final TaskRec taskRec;

  /// 「今日」「今週」「今月」「今年」
  String get _currentStr => taskType.currentLabel;

  /// 「昨日」「先週」「先月」「去年」
  String get _previousStr => taskType.previousLabel;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0.w),
        child: Icon(
          Icons.receipt_long,
          size: 30.0.dm,
        ),
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          // todo サイズ確認
          child: Text(
            "$_currentStrのタスクをレビュー",
            style: TextStyle(fontSize: 18.sp),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ReviewScreen(
                  timeStatus: TimeStatus.now,
                  taskType: taskType,
                ),
              ),
            );

            // todo レビューが更新された場合、更新された状態の値を取得（2026/05/22）＞＞
          },
        ),
        PopupMenuItem(
          // todo サイズ確認
          child: Text(
            "$_previousStrのタスクをレビュー",
            style: TextStyle(fontSize: 18.sp),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ReviewScreen(
                  timeStatus: TimeStatus.previous,
                  taskType: taskType,
                ),
              ),
            );

            // todo レビューが更新された場合、更新された状態の値を取得（2026/05/22）＞＞
          },
        ),
      ],
    );
  }
}
