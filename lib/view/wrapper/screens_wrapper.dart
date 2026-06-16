
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_wrapper/riverpod_wrapper.dart';
import 'package:three_tasks/config/private_config.dart';
import 'package:three_tasks/entities/view_type/task_type.dart';
import 'package:three_tasks/view/custom_widgets_impl/utilized_text_impl.dart';
import 'package:three_tasks/view/screens/review_screen.dart';
import 'package:three_tasks/view/screens/enumeration/screen_type.dart';

class ScreensWrapper extends HookConsumerWidget {
  ScreensWrapper({super.key});

  // todo build
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 現在選択されている画面のインデックス
    final selectedIndex = useState<int>(0);

    // selectedIndex を TaskType に変換
    final TaskType taskType = selectedIndex.value.taskType;

    // PageViewを制御するためのPageControllerフック（自動的にdisposeされます）
    final pageViewController =
        usePageController(initialPage: selectedIndex.value);

    // ChoiceChipがタップされた時のスクロールアニメーション処理
    void onChipSelected(int index) {
      selectedIndex.value = index;

      // PageViewを指定したインデックスまで横スクロールでアニメーション遷移させる
      pageViewController.animateToPage(
        index,
        // 遷移にかかる時間
        duration: const Duration(milliseconds: 300),
        // スムーズなアニメーションカーブ
        curve: Curves.easeInOut,
      );
    }

    // 現在表示している画面に、未保存の編集があるかどうか（ScrollPhysics 制御用）
    final isEdited = ref.watch(editSavingControllerProvider);

    // スワイプで遷移する画面の列挙型
    final List<ScreenType> screenList = ScreenType.values;

    // 現在表示されている画面
    final ScreenType currentScreen = screenList[selectedIndex.value];

    // 画面ごとのタイトル
    final String title = currentScreen.appBarTitle;

    return GestureDetector(
      onTap: () {
        // キーボードなどにフォーカスが移動しているとき、背景タップでフォーカスを解除する
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        // todo appBar
        appBar: AppBar(
          toolbarHeight: 56.h,
          centerTitle: true,
          // todo サイズ確認
          title: UtilizedText(
            title,
            fontSize: 21,
          ),
          actions: [
            // レビューボタン
            _NavigationForReview(
              taskType: taskType,
            ),
          ],
        ),
        // todo drawer
        drawer: ScaffoldMenuBar(
          termsUrl: PrivateConfig.termsUrl,
          privacyPolicyUrl: PrivateConfig.privacyPolicyUrl,
        ),
        resizeToAvoidBottomInset: false,
        // 自動保存でない場合に、未保存の編集を確認するラッパー
        body: EditSavedPopScope(
          child: Column(
            children: [
              // 画面遷移用の Chip
              _NavigationChips(
                selectedIndex: selectedIndex.value,
                // 列挙型の値の数 = 画面の数
                numberOfScreen: screenList.length,
                // `ScreenType.chipsName` （String）のリストに変換
                screenNameList: [...screenList]
                    .map((ScreenType screenType) => screenType.chipsName)
                    .toList(),
                onChipSelected: onChipSelected,
              ),
              // 画面本体
              Expanded(
                child: PageView.builder(
                  controller: pageViewController,
                  itemCount: screenList.length,
                  // 編集中は、左右のスワイプによる遷移にロックをかける
                  physics: isEdited
                      // スワイプ不可
                      ? const NeverScrollableScrollPhysics()
                      // スワイプ可能
                      : const ClampingScrollPhysics(),
                  onPageChanged: (int index) {
                    // ユーザーが手動でスワイプしてページを切り替えた際、ChoiceChipの選択状態も同期する
                    selectedIndex.value = index;
                  },
                  // インデックスで画面を選択
                  itemBuilder: (context, index) {
                    return screenList[index].constructor;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavigationChips extends StatelessWidget {
  const _NavigationChips({
    super.key,
    required this.selectedIndex,
    required this.numberOfScreen,
    required this.screenNameList,
    required this.onChipSelected,
  });

  /// 現在の画面のインデックス
  final int selectedIndex;

  /// 画面クラスリストの `length`
  final int numberOfScreen;

  /// 画面クラスの名前のリスト
  final List<String> screenNameList;

  /// Chip が選択されたときの処理
  ///
  /// 引数は、対象の画面のインデックス
  final void Function(int) onChipSelected;

  @override
  Widget build(BuildContext context) {
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
        itemCount: numberOfScreen,
        separatorBuilder: (context, index) => const SizedBox(width: 8.0),
        // Chip 1つずつの設定
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;
          return ChoiceChip(
            // todo サイズ確認（2026/06/10）＞＞
            label: UtilizedText(
              screenNameList[index],
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

/// レビュー画面へ遷移するボタン
class _NavigationForReview extends StatelessWidget {
  const _NavigationForReview({
    super.key,
    required this.taskType,
  });

  final TaskType taskType;

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
