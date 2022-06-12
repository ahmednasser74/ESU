import 'package:boilerplate/core/usecases/usecase.dart';
import 'package:boilerplate/features/student_data/data/models/response/term_register_pay_response_model/term_register_pay_response_model.dart';
import 'package:boilerplate/features/student_data/domain/repository/student_data_repository.dart';
import 'package:dartz/dartz.dart';

class TermRegisterPayUseCase extends UseCase<
    Future<Either<String?, TermRegisterPayResponseModel>>, int> {
  final StudentDataRepository studentDataRepository;

  TermRegisterPayUseCase({required this.studentDataRepository});

  @override
  Future<Either<String?, TermRegisterPayResponseModel>> call({
    required int params,
  }) async =>
      studentDataRepository.termRegisterPay(termId: params);
}
