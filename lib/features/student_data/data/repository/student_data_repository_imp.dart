import 'package:boilerplate/core/network/network_information.dart';
import 'package:boilerplate/core/utils/di.dart';
import 'package:boilerplate/features/student_data/data/datasource/student_data_remote_data_source.dart';
import 'package:boilerplate/features/student_data/data/models/response/letters.dart';
import 'package:boilerplate/features/student_data/domain/repository/student_data_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class StudentDataRepositoryImp implements StudentDataRepository {
  StudentDataRepositoryImp({required this.remoteDataSource});

  final StudentDataRemoteDataSource remoteDataSource;

  @override
  Future<Either<String?, LettersResponseModel>> getLetters() {
    return _responseHandling<LettersResponseModel>(
      onSuccess: () async => await remoteDataSource.getLetters(),
    );
  }
}

extension on StudentDataRepository {
  String onServerErrorBase(dynamic e) {
    if (e is DioError) {
      switch (e.type) {
        case DioErrorType.response:
          Object? msg;
          msg = e.response?.data['error_msg'];
          msg ??= e.response?.data['message'];
          return msg ?? e.error;
        default:
          return e.error;
      }
    }
    return e;
  }

  Future<Either<String?, T>> _responseHandling<T>({
    required Future<T> Function() onSuccess,
    Future<String> Function(Exception exception)? onOtherError,
  }) async {
    final isConnected = await Injection.di<NetworkInformation>().isConnected;
    if (isConnected) {
      try {
        final f = await onSuccess();
        return Right(f);
      } on Exception catch (e) {
        if (onOtherError != null) {
          final f = await onOtherError(e);
          return Left(f);
        }
        final f = onServerErrorBase(e);
        return Left(f);
      }
    } else {
      return const Left("No internet connection");
    }
  }
}
