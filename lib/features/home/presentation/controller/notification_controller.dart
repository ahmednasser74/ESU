import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/usecases/usecase.dart';
import 'package:esu/core/helper/helper_methods.dart';
import 'package:esu/features/home/data/models/response/notification/notification_response_model.dart';
import 'package:esu/features/home/domin/usecases/mark_all_notification_as_read_usecase.dart';
import 'package:esu/features/home/domin/usecases/mark_single_notification_as_read_usecase.dart';
import 'package:esu/features/home/domin/usecases/notification_usecase.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@Injectable()
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
  RxBool waitingMarkAllAsRead = false.obs;

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
          if (r.data.isEmpty) {
            change(null, status: RxStatus.empty());
          }
        } else {
          change(null, status: RxStatus.error());
        }
      },
    );
  }

  Future<void> markSingleNotificationAsRead({required int id}) async {
    await markSingleNotificationAsReadUseCase(params: id);
  }

  Future<void> markAllNotificationAsRead() async {
    final notification = await markAllNotificationAsReadUseCase(
      params: NoParams(),
    );
    notification.fold(
      (l) => HelperMethod.showToast(msg: l!, gravity: ToastGravity.TOP),
      (r) {
        if (r.status) {
          HelperMethod.showToast(
            msg: r.message ?? LocalizationKeys.successMarkAllAsRead.tr,
            gravity: ToastGravity.TOP,
          );
        } else {
          HelperMethod.showToast(
            msg: r.message ?? LocalizationKeys.failedMarkAllAsRead.tr,
            gravity: ToastGravity.TOP,
          );
        }
      },
    );
  }
}
