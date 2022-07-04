import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/routes.dart';
import 'package:esu/core/usecases/usecase.dart';
import 'package:esu/core/utils/helper_methods.dart';
import 'package:esu/core/utils/notification_helper.dart';
import 'package:esu/core/utils/pref_util.dart';
import 'package:esu/features/auth/data/model/request/fcm_token/register_fcm_token_request_model.dart';
import 'package:esu/features/auth/domin/usecases/delete_fcm_token_usecase.dart';
import 'package:esu/features/home/data/models/response/notification/notification_response_model.dart';
import 'package:esu/features/home/domin/usecases/mark_all_notification_as_read_usecase.dart';
import 'package:esu/features/home/domin/usecases/mark_single_notification_as_read_usecase.dart';
import 'package:esu/features/home/domin/usecases/notification_usecase.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class LogoutController extends GetxController {
  LogoutController({
    required this.deleteFcmTokenUseCase,
  });

  final DeleteFcmTokenUseCase deleteFcmTokenUseCase;

  Future<void> logout() async {
    Get.offAllNamed(Routes.loginScreen);
    final String fcmToken = await NotificationHelper.instance.getFcmToken;
    final FcmTokenRequestModel requestModel = FcmTokenRequestModel(fcmToken: fcmToken);
    await deleteFcmTokenUseCase(params: requestModel);
    SharedPrefs.instance.removeAllKeys();
    NotificationHelper.instance.removeToken();
  }
}
