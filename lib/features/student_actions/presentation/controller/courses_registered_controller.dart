import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/usecases/usecase.dart';
import 'package:esu/core/utils/helper_methods.dart';
import 'package:esu/features/student_actions/data/models/response/course_register/courses_registeration_response_model.dart';
import 'package:esu/features/student_actions/domain/usecase/courses_registrated_use_case.dart';
import 'package:esu/features/student_actions/domain/usecase/remove_course_use_case.dart';
import 'package:get/get.dart';

class CourseRegisteredController extends GetxController
    with StateMixin<CourseRegisterResponseModel> {
  CourseRegisteredController({
    required this.coursesRegisteredUseCase,
    required this.removeCourseUseCase,
  });

  final CoursesRegisteredUseCase coursesRegisteredUseCase;
  final RemoveCourseUseCase removeCourseUseCase;

  @override
  void onInit() {
    super.onInit();
    getCoursesRegistered();
  }

  Future<void> getCoursesRegistered() async {
    change(null, status: RxStatus.loading());
    final finance = await coursesRegisteredUseCase(
      params: NoParams(),
    );
    finance.fold(
      (l) => change(null, status: RxStatus.error(l)),
      (r) {
        if (r.status == true) {
          if (r.data!.isNotEmpty) {
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

  Future<void> removeCourse({required int courseId}) async {
    change(null, status: RxStatus.loading());
    final finance = await removeCourseUseCase(params: courseId);
    finance.fold(
      (l) => HelperMethod.showSnackBar(
        title: LocalizationKeys.failed.tr,
        message: l!,
      ),
      (r) {
        if (r.status == true) {
          HelperMethod.showSnackBar(
            title: LocalizationKeys.success.tr,
            message: r.message!,
          );
          if (r.data!.isNotEmpty) {
            change(r, status: RxStatus.success());
          } else {
            change(null, status: RxStatus.empty());
          }
        } else {
          HelperMethod.showSnackBar(
            title: LocalizationKeys.failed.tr,
            message: r.message!,
          );
        }
      },
    );
  }

  Future<void> onTapRemoveCourse({required int courseId}) async {
    await removeCourse(courseId: courseId);
  }
}
