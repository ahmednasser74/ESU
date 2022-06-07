import 'package:boilerplate/features/student_data/data/models/response/availability_term_registration/availability_term_registration_response_model.dart';
import 'package:boilerplate/features/student_data/domain/repository/student_data_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecase.dart';

class AvailabilityTermRegistrationUseCase extends UseCase<
    Future<Either<String?, AvailabilityTermRegistrationResponseModel>>,
    NoParams> {
  final StudentDataRepository studentDataRepository;

  AvailabilityTermRegistrationUseCase({required this.studentDataRepository});

  @override
  Future<Either<String?, AvailabilityTermRegistrationResponseModel>> call({
    required NoParams params,
  }) async =>
      studentDataRepository.availabilityTermRegistration();
}
