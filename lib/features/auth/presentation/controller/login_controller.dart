import 'package:esu/core/const/shared_prefs_keys.dart';
import 'package:esu/core/helper/firebase_analytics_helper.dart';
import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/localization/translation_controller.dart';
import 'package:esu/core/src/routes.dart';
import 'package:esu/core/enum/language.dart';
import 'package:esu/core/helper/helper_methods.dart';
import 'package:esu/core/notification_helper/notification_helper.dart';
import 'package:esu/core/utils/di.dart';
import 'package:esu/core/utils/pref_util.dart';
import 'package:esu/features/auth/data/model/request/fcm_token/register_fcm_token_request_model.dart';
import 'package:esu/features/auth/data/model/request/login/login_request_model.dart';
import 'package:esu/features/auth/domin/usecases/register_fcm_token_usecase.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/cache/cache.dart';
import '../../../../core/dependencies/dependency_init.dart';
import '../../domin/usecases/login_usecase.dart';

@Injectable()
class LoginController extends GetxController {
  LoginController({
    required this.loginUseCase,
    required this.registerFcmTokenUseCase,
  });

  final LoginUseCase loginUseCase;
  final RegisterFcmTokenUseCase registerFcmTokenUseCase;

  final TextEditingController studentIdTEC = TextEditingController(text: ''), passwordTEC = TextEditingController(text: '');
  final loginFormKey = GlobalKey<FormState>();

  TranslationController? translateController;
  final RxBool _loadingIndicator = false.obs;
  final prefs = SharedPrefs.instance;

  get getLoadingIndicator => _loadingIndicator.value;
  final FirebaseAnalyticsHelper analyticsHelper = di<FirebaseAnalyticsHelper>();

  @override
  void onInit() async {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      translateController = Get.find<TranslationController>();
    });
  }

  Future<void> login() async {
    final isValid = loginFormKey.currentState?.validate() ?? false;
    if (!isValid) {
      HelperMethod.showToast(msg: LocalizationKeys.completeAllTheFields.tr);
    } else {
      _loadingIndicator.value = true;
      final params = LoginRequestModel(studentId: studentIdTEC.text, password: passwordTEC.text);
      final response = await loginUseCase(params: params);
      response.fold(
        (l) async {
          HelperMethod.showToast(msg: l ?? 'Something went wrong');
          _loadingIndicator.value = false;
          analyticsHelper.logEvent('LOGIN FAILED', parameters: {'error': l});
        },
        (r) async {
          if (r.status == true) {
            prefs.saveString(key: SharedPrefsKeys.token, value: r.data!.token);
            prefs.saveUser(studentModel: r.data!.student);
            await registerFcmToken();
            analyticsHelper.logEvent('LOGIN SUCCESS', parameters: {'Student Id': r.data!.student.academicId});
            Get.offNamed(Routes.homeScreen);
          } else {
            HelperMethod.showToast(msg: r.message!);
            _loadingIndicator.value = false;
          }
        },
      );
    }
  }

  Future<void> registerFcmToken() async {
    final fcmToken = await NotificationHelper.instance.getFcmToken;
    final requestModel = FcmTokenRequestModel(fcmToken: fcmToken);
    await registerFcmTokenUseCase(params: requestModel);
    prefs.saveString(key: SharedPrefsKeys.fcmToken, value: fcmToken);
    _loadingIndicator.value = false;
  }

  void changeLanguage() {
    if (translateController!.language.value == Language.english.value) {
      translateController!.changeLanguage(Language.arabic);
    } else if (translateController!.language.value == Language.arabic.value) {
      translateController!.changeLanguage(Language.english);
    }
  }

  void navToRegister() {
    final cacheHelper = di<CacheHelper>();
    final isAcademicCompleted = cacheHelper.has(SharedPrefsKeys.academicInfoRegister);
    final isPersonalCompleted = cacheHelper.has(SharedPrefsKeys.personalInfoRegister);
    final isFileInfoCompleted = cacheHelper.has(SharedPrefsKeys.fileUploadInfoRegister);
    if (isFileInfoCompleted) {
      Get.toNamed(Routes.submitRegistrationScreen);
      return;
    }
    if (isPersonalCompleted) {
      Get.toNamed(Routes.registerFileUploadScreen);
      return;
    }
    if (isAcademicCompleted) {
      Get.toNamed(Routes.registerPersonalInfo);
      return;
    }
    Get.toNamed(Routes.registerAcademicInfo);
  }
}
