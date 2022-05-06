import 'package:boilerplate/core/const/lookup_const.dart';
import 'package:boilerplate/features/auth/data/model/request/lookup/lookup_request_model.dart';
import 'package:boilerplate/features/auth/data/model/response/lookup/lookup_data_response_model.dart';
import 'package:boilerplate/features/auth/domin/usecases/lookup_use_case.dart';
import 'package:get/get.dart';

class AcademicInfoController extends GetxController
    with StateMixin<List<LookupDataResponseModel>> {
  AcademicInfoController({
    required this.lookupUseCase,
  });

  LookupUseCase lookupUseCase;

  @override
  void onInit() async {
    super.onInit();
    await getLookup();
  }

  Future<void> getLookup() async {
    change(null, status: RxStatus.loading());
    final requestModel = LookupRequestModel(
      lookupType: LookupConst.programs,
    );
    final lookupData = await lookupUseCase(params: requestModel);
    lookupData.fold(
      (l) => change(null, status: RxStatus.error()),
      (r) {
        if (r.status == true) {
          change(r.data, status: RxStatus.success());
        } else {
          change(null, status: RxStatus.error());
        }
      },
    );
  }
}
