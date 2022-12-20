
<p align="center">
<img src="./assets/images/app_icon_bg.jpeg" style="height:200px;"/>
<p>

# Everyone's Smart University - ESU

A Flutter project for Student of Everyone's Smart University - ESU .

## Run App

 - Development
```sh  
flutter run --flavor dev --dart-define=env_type=dev -t lib/main_dev.dart 
```
 - Production

```sh  
flutter run --flavor prod --dart-define=env_type=prod -t lib/main_prod.dart
```

## Build Android APK & Bundle

**Development**<br/>

 - APK

 ```sh
 flutter build apk --release --flavor dev --dart-define=env_type=dev  --release --obfuscate --split-debug-info=symbol_map_android -t lib/main_dev.dart
   ``` 

**Production**

 - APK

```sh 
flutter build apk --release --flavor prod --dart-define=env_type=prod  --release --obfuscate --split-debug-info=symbol_map_android -t lib/main_prod.dart 
``` 

 - Bundle

  ```sh 
  flutter build appbundle --flavor prod --dart-define=env_type=prod  --release --obfuscate --split-debug-info=symbol_map_android -t lib/main_prod.dart
  ```

## Build iOS IPA

**Production**

  ```sh 
  flutter build ipa --flavor prod --dart-define=env_type=prod --release --obfuscate --flavor prod --split-debug-info=symbol_map_ios
  ```


