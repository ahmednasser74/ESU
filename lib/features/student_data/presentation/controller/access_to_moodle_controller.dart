import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/usecases/usecase.dart';
import 'package:boilerplate/features/student_data/domain/usecase/access_to_moodle_use_case.dart';
import 'package:get/get.dart';

class AccessToMoodleController extends GetxController {
  AccessToMoodleController({
    required this.accessToMoodleUseCase,
  });

  final AccessToMoodleUseCase accessToMoodleUseCase;

  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  RxString errorMessage = ''.obs;

  List<String> filesList = [];
  List<String> videosList = [];
  RxString moodleUrl = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getAccessToMoodle();
  }

  void getAccessToMoodle() async {
    isLoading.value = true;
    final finance = await accessToMoodleUseCase(params: NoParams());
    finance.fold(
      (l) {
        isError.value = true;
        errorMessage.value = l!;
      },
      (r) {
        if (r.status == true) {
          filesList.addAll(r.data.files);
          videosList.addAll(r.data.videos);
          moodleUrl.value = r.data.link;
          update();
        } else {
          isError.value = true;
          errorMessage.value = LocalizationKeys.somethingWentWrong.tr;
        }
      },
    );
    isLoading.value = false;
  }
}
