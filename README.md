
# Everyone's Smart University - ESU

A Flutter project for Student of Everyone's Smart University - ESU .

### To Run App

**Development**<br/>
flutter run --flavor dev --dart-define=env_type=dev
<br/>

**Production**<br/>
flutter run --flavor prod --dart-define=env_type=prod
<br/><br/>

### Build Android APK & Bundle

**Development**<br/>

**APK :** 'flutter build apk --release --flavor dev --dart-define=env_type=dev  --release --obfuscate --split-debug-info=symbol_map_android -t lib/main_dev.dart'
<br/><br/>

**Production**<br/>

**APK :** 'flutter build apk --release --flavor prod --dart-define=env_type=prod  --release --obfuscate --split-debug-info=symbol_map_android -t lib/main_prod.dart'
<br/><br/>

**Bundle :** 'flutter build appbundle --flavor prod --dart-define=env_type=prod  --release --obfuscate --split-debug-info=symbol_map_android -t lib/main_prod.dart'
<br/><br/>

