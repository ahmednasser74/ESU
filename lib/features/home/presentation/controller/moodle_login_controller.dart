import 'dart:io';

import 'package:esu/core/helper/helper_methods.dart';
import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/features/home/data/models/request/moodle_login_request_model.dart';
import 'package:esu/features/home/data/models/response/home/home_response_model.dart';
import 'package:esu/features/home/domin/usecases/moodle_login_usecase.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart';

@Injectable()
class MoodleLoginController extends GetxController with StateMixin<HomeResponseModel> {
  final MoodleLoginUseCase moodleLoginUseCase;

  MoodleLoginController({required this.moodleLoginUseCase});

  RxBool isLoading = false.obs;
  late File photo;

  Future<void> moodleLogin() async {
    isLoading.value = true;
    final MoodleLoginRequestModel requestModel = MoodleLoginRequestModel(photo: photo);
    final loginResponse = await moodleLoginUseCase(params: requestModel);
    loginResponse.fold(
      (l) {
        isLoading.value = false;
        HelperMethod.showToast(msg: LocalizationKeys.somethingWentWrongTryAgain.tr);
      },
      (r) {
        if (r.status!) {
          Get.back();
          HelperMethod.launchToBrowser(r.data!.url, mode: LaunchMode.externalApplication);
        } else {
          HelperMethod.showToast(msg: r.message!,toastLength: Toast.LENGTH_LONG);
        }
        isLoading.value = false;
      },
    );
  }
}
