import 'package:dartz/dartz.dart';
import 'package:esu/features/student_data/data/models/response/transcript/transcript_response_model.dart';
import 'package:esu/features/student_data/domain/repository/student_data_repository.dart';

import '../../../../core/usecases/usecase.dart';

class TranscriptUseCase extends UseCase<
    Future<Either<String?, TranscriptResponseModel>>, NoParams> {
  final StudentDataRepository studentDataRepository;

  TranscriptUseCase({required this.studentDataRepository});

  @override
  Future<Either<String?, TranscriptResponseModel>> call({
    required NoParams params,
  }) async =>
      studentDataRepository.getTranscript();
}
