import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/usecases/usecase.dart';
import 'package:esu/features/student_data/data/models/response/letters/letters_data_response_model.dart';
import 'package:esu/features/student_data/domain/usecase/letters_use_case.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@Injectable()

class LettersController extends GetxController
    with StateMixin<List<LettersDataResponseModel>> {
  final LettersUseCase lettersUseCase;

  LettersController({required this.lettersUseCase});

  @override
  void onInit() {
    super.onInit();
    getLetters();
  }

  void getLetters() async {
    final letters = await lettersUseCase(params: NoParams());
    letters.fold(
      (l) => change(null, status: RxStatus.error(l!)),
      (r) {
        if (r.status == true) {
          if (r.data.isEmpty) {
            change(null, status: RxStatus.empty());
          } else {
            change(r.data, status: RxStatus.success());
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
