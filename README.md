# matching_app_framework

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Appendix

## Directory Tree

- https://pentagon.tokyo/app/2937/
  1. const
     - 都道府県の情報など値に変更がない固定値を定義します。
  2. extension
     - DateTime や String などの extension を定義しています。
  3. model
     - モデル層。アーキテクチャの種類によっては、モデル層は、データの保持に加え、ビジネスロジックを記述することがありますが、今回は、データの保持だけを行っています。
  4. plugin
     - Flutter で実現できなかったことをネイティブで行うための plugin を記述。
     - MethodChannel を使用してネイティブのメソッドを呼び出しています。MethodChannel は Dart からネイティブのメソッドを呼び出すか、ネイティブから Dart のメソッドを呼び出すためのAPIです。
  5. res
     - 色や文字のスタイルなどを定義してます。
  6. service
     - API通信の処理を記述します。
  7. ui
     - ページごとにディレクトリを分けて作成します。
     - 例えば、login_screenというディレクトリを用意し、LoginScreenというWidgetを作成します。
  8. view_model
     - ui層と同じ要領で、LoginViewModelなどを作成します。
