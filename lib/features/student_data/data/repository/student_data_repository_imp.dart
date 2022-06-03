import 'package:boilerplate/core/network/network_information.dart';
import 'package:boilerplate/core/utils/di.dart';
import 'package:boilerplate/features/student_data/data/datasource/student_data_remote_data_source.dart';
import 'package:boilerplate/features/student_data/data/models/response/access_to_moodle/access_to_moodle_response_model.dart';
import 'package:boilerplate/features/student_data/data/models/response/finance/finance_response_model.dart';
import 'package:boilerplate/features/student_data/data/models/response/invoice_pay/invoice_pay_response_model.dart';
import 'package:boilerplate/features/student_data/data/models/response/lecture_table/lecture_table_response_model.dart';
import 'package:boilerplate/features/student_data/data/models/response/letters/letters.dart';
import 'package:boilerplate/features/student_data/data/models/response/plans_of_study/plan_of_study_response_model.dart';
import 'package:boilerplate/features/student_data/data/models/response/schedule/schedule_response_model.dart';
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

  @override
  Future<Either<String?, StudyPlansResponseModel>> getStudyPlans() async {
    return _responseHandling<StudyPlansResponseModel>(
      onSuccess: () async => await remoteDataSource.getStudyPlans(),
    );
  }

  @override
  Future<Either<String?, FinanceResponseModel>> getFinance() {
    return _responseHandling<FinanceResponseModel>(
      onSuccess: () async => await remoteDataSource.getFinance(),
    );
  }

  @override
  Future<Either<String?, InvoicePayResponseModel>> getPayInvoiceUrl({
    required int invoiceId,
  }) {
    return _responseHandling<InvoicePayResponseModel>(
      onSuccess: () async => await remoteDataSource.getPayInvoiceUrl(
        invoiceId: invoiceId,
      ),
    );
  }

  @override
  Future<Either<String?, AccessToMoodleResponseModel>> getAccessToMoodle() {
    return _responseHandling<AccessToMoodleResponseModel>(
      onSuccess: () async => await remoteDataSource.getAccessToMoodle(),
    );
  }

  @override
  Future<Either<String?, LectureTableResponseModel>> getLectureTable() {
    return _responseHandling<LectureTableResponseModel>(
      onSuccess: () async => await remoteDataSource.getLectureTable(),
    );
  }

  @override
  Future<Either<String?, ScheduleResponseModel>> getSchedule() {
    return _responseHandling<ScheduleResponseModel>(
      onSuccess: () async => await remoteDataSource.getSchedule(),
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
