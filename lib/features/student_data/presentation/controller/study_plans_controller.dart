import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/usecases/usecase.dart';
import 'package:boilerplate/features/student_data/data/models/response/plans_of_study/plans_of_study_data_response_model.dart';
import 'package:boilerplate/features/student_data/domain/usecase/Study_plans_use_case.dart';
import 'package:get/get.dart';

class StudyPlansController extends GetxController
    with StateMixin<StudyPlansDataResponseModel> {
  final StudyPlansUseCase studyPlansUseCase;

  StudyPlansController({required this.studyPlansUseCase});

  @override
  void onInit() {
    super.onInit();
    getLetters();
  }

  void getLetters() async {
    final letters = await studyPlansUseCase(params: NoParams());
    letters.fold(
      (l) => change(null, status: RxStatus.error(l!)),
      (r) {
        if (r.status == true) {
          if (r.data.programData.isEmpty) {
            change(null, status: RxStatus.empty());
          } else {
            change(r.data, status: RxStatus.success());
          }
        } else {
          change(
            null,
            status: RxStatus.error(LocalizationKeys.somethingWentWrong.tr),
          );
        }
      },
    );
  }
}
