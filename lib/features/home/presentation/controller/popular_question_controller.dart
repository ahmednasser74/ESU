import 'package:boilerplate/core/usecases/usecase.dart';
import 'package:boilerplate/features/home/data/models/response/popular_question/popular_question_response_model.dart';
import 'package:boilerplate/features/home/domin/usecases/popular_question_usecase.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class PopularQuestionController extends GetxController
    with StateMixin<List<PopularQuestionDataResponseModel>> {
  PopularQuestionController({required this.popularQuestionUseCase});

  PopularQuestionUseCase popularQuestionUseCase;

  @override
  void onInit() async {
    super.onInit();
    await getPopularQuestion();
  }

  Future<void> getPopularQuestion() async {
    change(null, status: RxStatus.loading());
    final notification = await popularQuestionUseCase(params: NoParams());
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
}
