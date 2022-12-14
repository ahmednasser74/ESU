import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/usecases/usecase.dart';
import 'package:esu/features/student_data/data/models/response/schedule/schedule_response_model.dart';
import 'package:esu/features/student_data/domain/usecase/schedule_use_case.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@Injectable()

class ScheduleController extends GetxController
    with StateMixin<ScheduleResponseModel> {
  ScheduleController({
    required this.scheduleUseCase,
  });

  final ScheduleUseCase scheduleUseCase;

  @override
  void onInit() {
    super.onInit();
    getSchedule();
  }

  void getSchedule() async {
    final finance = await scheduleUseCase(params: NoParams());
    finance.fold(
      (l) => change(null, status: RxStatus.error(l!)),
      (r) {
        if (r.status == true) {
          if (r.data.isEmpty) {
            change(null, status: RxStatus.empty());
          } else {
            change(r, status: RxStatus.success());
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
