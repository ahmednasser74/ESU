import 'package:boilerplate/core/usecases/usecase.dart';
import 'package:boilerplate/features/home/data/models/response/home/home_response_model.dart';
import 'package:dartz/dartz.dart';

import '../repositories/home_repository.dart';

class HomeUseCase
    extends UseCase<Future<Either<String?, HomeResponseModel>>, NoParams> {
  HomeUseCase({required this.repository});

  final HomeRepository repository;

  @override
  Future<Either<String?, HomeResponseModel>> call({
    required NoParams params,
  }) async =>
      await repository.getHomeData();
}
