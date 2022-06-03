import 'package:boilerplate/core/usecases/usecase.dart';
import 'package:boilerplate/features/home/data/models/response/home/home_response_model.dart';
import 'package:boilerplate/features/home/domin/usecases/home_usecase.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin<HomeResponseModel> {
  final HomeUseCase homeUseCase;

  HomeController({required this.homeUseCase});

  @override
  void onInit() async {
    super.onInit();
    await getHomeData();
  }

  Future<void> getHomeData() async {
    change(null, status: RxStatus.loading());
    final notification = await homeUseCase(params: NoParams());
    notification.fold(
      (l) => change(null, status: RxStatus.error()),
      (r) {
        if (r.status) {
          change(r, status: RxStatus.success());
        } else {
          change(null, status: RxStatus.error());
        }
      },
    );
  }
}