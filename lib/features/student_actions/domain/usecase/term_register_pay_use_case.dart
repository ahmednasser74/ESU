import 'package:esu/core/usecases/usecase.dart';
import 'package:esu/features/student_actions/data/models/response/term_register_pay_response_model/term_register_pay_response_model.dart';
import 'package:esu/features/student_actions/domain/repository/student_actions_repository.dart';
import 'package:dartz/dartz.dart';

class TermRegisterPayUseCase extends UseCase<
    Future<Either<String?, TermRegisterPayResponseModel>>, int> {
  final StudentActionsRepository studentActionsRepository;

  TermRegisterPayUseCase({required this.studentActionsRepository});

  @override
  Future<Either<String?, TermRegisterPayResponseModel>> call({
    required int params,
  }) async =>
      studentActionsRepository.termRegisterPay(termId: params);
}
