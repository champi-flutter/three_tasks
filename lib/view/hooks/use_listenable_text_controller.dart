// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
//
// class ListenableTextController extends TextEditingController{
//   ListenableTextController({super.text});
// }
//
// class NonReactiveTextController extends TextEditingController{
//   NonReactiveTextController({super.text});
// }
//
// /// TextFieldのコントローラーと、その最新のテキスト値を返すカスタムフック
// ListenableTextController useListenableTextController({
//   String text = '',
// }) {
//   // コントローラーを生成・保持
//   final controller = useMemoized(()=>ListenableTextController(text: text));
//
//   // Widget破棄時に自動dispose
//   useEffect((){
//     return controller.dispose;
//   }, [controller]);
//
//   // コントローラーの変更を監視し、値が変わるたびにこのフックを呼んでいるWidgetをリビルド
//   useValueListenable(controller);
//
//   // コントローラーを返す
//   return controller;
// }
//
// /// TextFieldの入力値の変更によるリビルドを行わないコントローラを返すフック
// NonReactiveTextController useNonReactiveTextController({
//   String text = '',
// }) {
//   // コントローラーを生成・保持
//   final controller = useMemoized(()=>NonReactiveTextController(text: text));
//
//   // Widget破棄時に自動dispose
//   useEffect((){
//     return controller.dispose;
//   }, [controller]);
//
//   // コントローラーを返す
//   return controller;
// }