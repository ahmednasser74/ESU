import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/usecases/usecase.dart';
import 'package:esu/features/student_data/data/models/response/transcript/transcript_response_model.dart';
import 'package:esu/features/student_data/domain/usecase/transcript_use_case.dart';
import 'package:get/get.dart';

class TranscriptController extends GetxController
    with StateMixin<TranscriptResponseModel> {
  TranscriptController({required this.transcriptUseCase});

  final TranscriptUseCase transcriptUseCase;

  @override
  void onInit() {
    super.onInit();
    getATranscript();
  }

  void getATranscript() async {
    change(null, status: RxStatus.loading());
    final response = await transcriptUseCase(params: NoParams());
    response.fold(
      (l) => change(null, status: RxStatus.error(l!)),
      (r) {
        if (r.status) {
          if (r.data.isNotEmpty) {
            change(r, status: RxStatus.success());
          } else {
            change(null, status: RxStatus.empty());
          }
        } else {
          change(
            null,
            status: RxStatus.error(
              r.message ?? LocalizationKeys.noDataFound.tr,
            ),
          );
        }
      },
    );
  }
}
