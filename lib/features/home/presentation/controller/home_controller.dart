import 'package:esu/core/notification_helper/notification_helper.dart';
import 'package:esu/core/usecases/usecase.dart';
import 'package:esu/features/home/data/models/response/home/home_response_model.dart';
import 'package:esu/features/home/domin/usecases/home_usecase.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class HomeController extends GetxController with StateMixin<HomeResponseModel> {
  final HomeUseCase homeUseCase;

  HomeController({required this.homeUseCase});

  late HomeResponseModel homeResponse;

  @override
  void onInit() async {
    super.onInit();
    FlutterAppBadger.removeBadge();
    await NotificationHelper.instance.setupOnMessageOpenedApp();
    await getHomeData();
  }

  Future<void> getHomeData() async {
    change(null, status: RxStatus.loading());
    final notification = await homeUseCase(params: NoParams());
    notification.fold(
      (l) => change(null, status: RxStatus.error()),
      (r) {
        if (r.status) {
          homeResponse = r;
          change(r, status: RxStatus.success());
        } else {
          change(null, status: RxStatus.error());
        }
      },
    );
  }
}
