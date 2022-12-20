import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/usecases/usecase.dart';
import 'package:esu/features/student_data/data/models/response/attendance/attendance_response_model.dart';
import 'package:esu/features/student_data/domain/usecase/attendance_use_case.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@Injectable()

class AttendanceController extends GetxController
    with StateMixin<AttendanceResponseModel> {
  AttendanceController({
    required this.attendanceUseCase,
  });

  final AttendanceUseCase attendanceUseCase;

  @override
  void onInit() {
    super.onInit();
    getAttendance();
  }

  void getAttendance() async {
    change(null, status: RxStatus.loading());
    final response = await attendanceUseCase(params: NoParams());
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
