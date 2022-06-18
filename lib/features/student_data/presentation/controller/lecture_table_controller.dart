import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/usecases/usecase.dart';
import 'package:esu/features/student_data/data/models/response/lecture_table/lecture_table_response_model.dart';
import 'package:esu/features/student_data/domain/usecase/lecture_table_use_case.dart';
import 'package:get/get.dart';

class LectureTableController extends GetxController
    with StateMixin<LectureTableResponseModel> {
  LectureTableController({
    required this.lectureTableUseCase,
  });

  final LectureTableUseCase lectureTableUseCase;

  @override
  void onInit() {
    super.onInit();
    getLectureTable();
  }

  void getLectureTable() async {
    change(null, status: RxStatus.loading());
    final finance = await lectureTableUseCase(params: NoParams());
    finance.fold(
      (l) => change(null, status: RxStatus.error(l!)),
      (r) {
        if (r.status == true && r.data != null) {
          change(r, status: RxStatus.success());
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
