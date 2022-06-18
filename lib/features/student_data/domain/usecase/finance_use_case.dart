import 'package:esu/features/student_data/data/models/response/finance/finance_response_model.dart';
import 'package:esu/features/student_data/domain/repository/student_data_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecase.dart';

class FinanceUseCase
    extends UseCase<Future<Either<String?, FinanceResponseModel>>, NoParams> {
  final StudentDataRepository studentDataRepository;

  FinanceUseCase({required this.studentDataRepository});

  @override
  Future<Either<String?, FinanceResponseModel>> call({
    required NoParams params,
  }) async =>
      studentDataRepository.getFinance();
}
