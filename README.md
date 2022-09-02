# esu

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:
## To Run App
#Development
flutter run --flavor dev --dart-define=env_type=dev
#Production
flutter run --flavor prod --dart-define=env_type=prod

## Build Android APK & Bundle
#Development
flutter build apk --release --flavor dev --dart-define=env_type=dev  --release --obfuscate --split-debug-info=symbol_map_android -t lib/main_dev.dart
#Production
flutter build apk --release --flavor prod --dart-define=env_type=prod  --release --obfuscate --split-debug-info=symbol_map_android -t lib/main_prod.dart
flutter build appbundle --flavor prod --dart-define=env_type=prod  --release --obfuscate --split-debug-info=symbol_map_android -t lib/main_prod.dart

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
