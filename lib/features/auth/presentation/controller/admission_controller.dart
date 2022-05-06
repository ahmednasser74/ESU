import 'package:boilerplate/features/auth/domin/usecases/admission_usecase.dart';
import 'package:get/get.dart';

class AdmissionController extends GetxController {
  AdmissionController({
    required this.admissionUseCase,
  });
  final AdmissionUseCase admissionUseCase;
}
