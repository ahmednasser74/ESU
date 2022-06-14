import 'package:boilerplate/core/network/network_information.dart';
import 'package:boilerplate/core/utils/di.dart';
import 'package:boilerplate/features/student_actions/data/data_source/student_actions_remote_data_source.dart';
import 'package:boilerplate/features/student_actions/data/models/request/ticket_create/ticket_create_request_model.dart';
import 'package:boilerplate/features/student_actions/data/models/request/ticket_details/ticket_details_request_model.dart';
import 'package:boilerplate/features/student_actions/data/models/request/ticket_reply/ticket_reply_request_model.dart';
import 'package:boilerplate/features/student_actions/data/models/response/availability_term_registration/availability_term_registration_response_model.dart';
import 'package:boilerplate/features/student_actions/data/models/response/term_register_pay_response_model/term_register_pay_response_model.dart';
import 'package:boilerplate/features/student_actions/data/models/response/ticket_category/ticket_category_data_response_model.dart';
import 'package:boilerplate/features/student_actions/data/models/response/ticket_details/tickets_details_response_model.dart';
import 'package:boilerplate/features/student_actions/data/models/response/tickets/tickets_response_model.dart';
import 'package:boilerplate/features/student_actions/domain/repository/student_actions_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class StudentActionsRepositoryImp implements StudentActionsRepository {
  StudentActionsRepositoryImp({required this.remoteDataSource});

  final StudentActionsRemoteDataSource remoteDataSource;

  @override
  Future<Either<String?, AvailabilityTermRegistrationResponseModel>>
      availabilityTermRegistration() {
    return _responseHandling<AvailabilityTermRegistrationResponseModel>(
      onSuccess: () async =>
          await remoteDataSource.availabilityTermRegistration(),
    );
  }

  @override
  Future<Either<String?, TermRegisterPayResponseModel>> termRegisterPay({
    required int termId,
  }) {
    return _responseHandling<TermRegisterPayResponseModel>(
      onSuccess: () async => await remoteDataSource.termRegisterPay(
        termId: termId,
      ),
    );
  }

  @override
  Future<Either<String?, TicketDetailsResponseModel>> createTicket({
    required TicketCreateRequestModel requestModel,
  }) {
    return _responseHandling<TicketDetailsResponseModel>(
      onSuccess: () async => await remoteDataSource.createTicket(
        requestModel: requestModel,
      ),
    );
  }

  @override
  Future<Either<String?, TicketsCategoriesResponseModel>> getCategories() {
    return _responseHandling<TicketsCategoriesResponseModel>(
      onSuccess: () async => await remoteDataSource.getCategories(),
    );
  }

  @override
  Future<Either<String?, TicketDetailsResponseModel>> getTicketDetails({
    required TicketDetailsRequestModel requestModel,
  }) {
    return _responseHandling<TicketDetailsResponseModel>(
      onSuccess: () async => await remoteDataSource.getTicketDetails(
        requestModel: requestModel,
      ),
    );
  }

  @override
  Future<Either<String?, TicketsResponseModel>> getTickets() {
    return _responseHandling<TicketsResponseModel>(
      onSuccess: () async => await remoteDataSource.getTickets(),
    );
  }

  @override
  Future<Either<String?, TicketDetailsResponseModel>> ticketReply({
    required TicketReplyRequestModel requestModel,
  }) {
    return _responseHandling<TicketDetailsResponseModel>(
      onSuccess: () async => await remoteDataSource.ticketReply(
        requestModel: requestModel,
      ),
    );
  }
}

extension on StudentActionsRepository {
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
