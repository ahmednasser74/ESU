import 'package:boilerplate/features/student_data/data/models/response/finance/finance_pay_response_model.dart';
import 'package:boilerplate/features/student_data/domain/repository/student_data_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecase.dart';

class FinancePayUrlUseCase extends UseCase<
    Future<Either<String?, FinancePayUrlResponseModel>>, NoParams> {
  final StudentDataRepository studentDataRepository;

  FinancePayUrlUseCase({required this.studentDataRepository});

  @override
  Future<Either<String?, FinancePayUrlResponseModel>> call({
    required NoParams params,
  }) async =>
      studentDataRepository.getPayFinanceUrl();
}
