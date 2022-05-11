import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/usecases/usecase.dart';
import 'package:boilerplate/core/utils/helper_methods.dart';
import 'package:boilerplate/features/home/data/models/response/notification/notification_response_model.dart';
import 'package:boilerplate/features/home/domin/usecases/mark_all_notification_as_read_usecase.dart';
import 'package:boilerplate/features/home/domin/usecases/mark_single_notification_as_read_usecase.dart';
import 'package:boilerplate/features/home/domin/usecases/notification_usecase.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController
    with StateMixin<List<NotificationItemResponseModel>> {
  NotificationController({
    required this.getNotificationUseCase,
    required this.markAllNotificationAsReadUseCase,
    required this.markSingleNotificationAsReadUseCase,
  });

  final GetNotificationUseCase getNotificationUseCase;
  final MarkSingleNotificationAsReadUseCase markSingleNotificationAsReadUseCase;
  final MarkAllNotificationAsReadUseCase markAllNotificationAsReadUseCase;

  @override
  void onInit() async {
    super.onInit();
    await getNotification();
  }

  Future<void> getNotification() async {
    change(null, status: RxStatus.loading());
    final notification = await getNotificationUseCase(params: NoParams());
    notification.fold(
      (l) => change(null, status: RxStatus.error()),
      (r) {
        if (r.status) {
          change(r.data, status: RxStatus.success());
        } else {
          change(null, status: RxStatus.error());
        }
      },
    );
  }

  Future<void> markSingleNotificationAsRead({required int id}) async {
    final notification = await markSingleNotificationAsReadUseCase(params: id);
    notification.fold(
      (l) {},
      (r) {
        if (r.status) {
        } else {}
      },
    );
  }

  Future<void> markAllNotificationAsRead() async {
    final notification = await markAllNotificationAsReadUseCase(
      params: NoParams(),
    );
    notification.fold(
      (l) => HelperMethod.showToast(
        msg: LocalizationKeys.failedMarkAllAsRead.tr,
        gravity: ToastGravity.TOP,
      ),
      (r) {
        if (r.status) {
          getNotification();
          HelperMethod.showToast(
            msg: LocalizationKeys.successMarkAllAsRead.tr,
            gravity: ToastGravity.TOP,
          );
        } else {
          HelperMethod.showToast(
            msg: LocalizationKeys.failedMarkAllAsRead.tr,
            gravity: ToastGravity.TOP,
          );
        }
      },
    );
  }
}
