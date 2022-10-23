import 'package:esu/core/usecases/usecase.dart';
import 'package:esu/features/student_actions/data/models/response/availability_term_registration/availability_term_registration_response_model.dart';
import 'package:esu/features/student_actions/domain/repository/student_actions_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable()

class TermRegistrationAvailabilityUseCase extends UseCase<
    Future<Either<String?, AvailabilityTermRegistrationResponseModel>>,
    NoParams> {
  final StudentActionsRepository studentActionsRepository;

  TermRegistrationAvailabilityUseCase({required this.studentActionsRepository});

  @override
  Future<Either<String?, AvailabilityTermRegistrationResponseModel>> call({
    required NoParams params,
  }) async =>
      studentActionsRepository.availabilityTermRegistration();
}
