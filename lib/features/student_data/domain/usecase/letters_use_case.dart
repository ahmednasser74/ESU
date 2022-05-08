import 'package:boilerplate/features/student_data/data/models/response/letters.dart';
import 'package:boilerplate/features/student_data/domain/repository/student_data_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecase.dart';

class LettersUseCase
    extends UseCase<Future<Either<String?, LettersResponseModel>>, NoParams> {
  final StudentDataRepository studentDataRepository;

  LettersUseCase({required this.studentDataRepository});

  @override
  Future<Either<String?, LettersResponseModel>> call({
    required NoParams params,
  }) async =>
      studentDataRepository.getLetters();
}
