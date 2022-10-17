import 'package:esu/core/cache/cache.dart';
import 'package:esu/core/const/lookup_const.dart';
import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/routes.dart';
import 'package:esu/core/helper/helper_methods.dart';
import 'package:esu/features/auth/data/model/data_holder/academic_info_data_holder_model.dart';
import 'package:esu/features/auth/data/model/request/lookup/lookup_request_model.dart';
import 'package:esu/features/auth/data/model/response/lookup/lookup_data_response_model.dart';
import 'package:esu/features/auth/domin/usecases/lookup_use_case.dart';
import 'package:esu/features/auth/presentation/controller/submit_admission_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/const/shared_prefs_keys.dart';
import '../../../../core/dependencies/dependency_init.dart';

class AcademicInfoController extends GetxController with StateMixin<List<LookupDataResponseModel>> {
  AcademicInfoController({required this.lookupUseCase});

  final formKey = GlobalKey<FormState>();
  late String currentCertificate;
  late int programId;
  LookupUseCase lookupUseCase;
  final CacheHelper cacheHelper = getIt<CacheHelper>();

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

  void goToPersonalInfoScreen() {
    if (formKey.currentState!.validate()) {
      setData();
      Get.toNamed(Routes.registerPersonalInfo);
    } else {
      HelperMethod.showToast(msg: LocalizationKeys.completeAllTheFields.tr);
    }
  }

  void setData() {
    final submitAdmission = Get.find<SubmitAdmissionController>();
    submitAdmission.academicInfo = AcademicInformationDataHolderModel(
      currentCertificate: currentCertificate,
      programId: programId,
    );
    cacheHelper.set(SharedPrefsKeys.academicInfoRegister, submitAdmission.academicInfo);
  }
}
