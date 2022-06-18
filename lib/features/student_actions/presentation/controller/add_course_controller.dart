import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/usecases/usecase.dart';
import 'package:boilerplate/core/utils/helper_methods.dart';
import 'package:boilerplate/features/student_actions/data/models/request/add_course/add_course_request_model.dart';
import 'package:boilerplate/features/student_actions/data/models/response/available_course/available_course_response_model.dart';
import 'package:boilerplate/features/student_actions/domain/usecase/add_course_use_case.dart';
import 'package:boilerplate/features/student_actions/domain/usecase/course_registration_availability_use_case.dart';
import 'package:get/get.dart';

import 'courses_registered_controller.dart';

class AddCourseController extends GetxController
    with StateMixin<AvailableCoursesResponseModel> {
  AddCourseController({
    required this.coursesAvailableUseCase,
    required this.addCoursesUseCase,
  });

  final CoursesAvailableUseCase coursesAvailableUseCase;
  final AddCoursesUseCase addCoursesUseCase;

  @override
  void onInit() {
    super.onInit();
    getCoursesRegistered();
  }

  Future<void> getCoursesRegistered() async {
    change(null, status: RxStatus.loading());
    final finance = await coursesAvailableUseCase(params: NoParams());
    finance.fold(
      (l) => change(null, status: RxStatus.error(l)),
      (r) {
        if (r.status == true) {
          if (r.data.isNotEmpty) {
            change(r, status: RxStatus.success());
          } else {
            change(null, status: RxStatus.empty());
          }
        } else {
          change(null, status: RxStatus.error(r.message));
        }
      },
    );
  }

  Future<void> addCourse({required int courseId}) async {
    change(null, status: RxStatus.loading());
    final response = await addCoursesUseCase(
      params: AddCourseRequestModel(courseId: courseId),
    );
    response.fold(
      (l) {
        change(null, status: RxStatus.error(l!));
        HelperMethod.showSnackBar(
          title: LocalizationKeys.failed.tr,
          message: l,
        );
      },
      (r) {
        if (r.status == true) {
          Get.back();
          HelperMethod.showSnackBar(
            title: LocalizationKeys.success.tr,
            message: r.message!,
          );
          Future.delayed(
            Duration.zero,
            Get.find<CourseRegisteredController>().getCoursesRegistered,
          );
        } else {
          change(null, status: RxStatus.error(r.message));
          HelperMethod.showSnackBar(
            title: LocalizationKeys.failed.tr,
            message: r.message!,
            durationSeconds: 5,
          );
        }
      },
    );
  }
}
