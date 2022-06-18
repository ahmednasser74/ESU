import 'package:esu/features/student_data/data/models/response/schedule/schedule_response_model.dart';
import 'package:esu/features/student_data/domain/repository/student_data_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecase.dart';

class ScheduleUseCase
    extends UseCase<Future<Either<String?, ScheduleResponseModel>>, NoParams> {
  final StudentDataRepository studentDataRepository;

  ScheduleUseCase({required this.studentDataRepository});

  @override
  Future<Either<String?, ScheduleResponseModel>> call({
    required NoParams params,
  }) async =>
      studentDataRepository.getSchedule();
}
