import 'package:boilerplate/core/const/end_point.dart';
import 'package:boilerplate/core/dio/dio_helper.dart';
import 'package:boilerplate/features/student_actions/data/models/request/add_course/add_course_request_model.dart';
import 'package:boilerplate/features/student_actions/data/models/request/ticket_create/ticket_create_request_model.dart';
import 'package:boilerplate/features/student_actions/data/models/request/ticket_details/ticket_details_request_model.dart';
import 'package:boilerplate/features/student_actions/data/models/request/ticket_reply/ticket_reply_request_model.dart';
import 'package:boilerplate/features/student_actions/data/models/response/availability_term_registration/availability_term_registration_response_model.dart';
import 'package:boilerplate/features/student_actions/data/models/response/available_course/available_course_response_model.dart';
import 'package:boilerplate/features/student_actions/data/models/response/course_register/courses_registeration_response_model.dart';
import 'package:boilerplate/features/student_actions/data/models/response/term_register_pay_response_model/term_register_pay_response_model.dart';
import 'package:boilerplate/features/student_actions/data/models/response/ticket_category/ticket_category_data_response_model.dart';
import 'package:boilerplate/features/student_actions/data/models/response/ticket_details/tickets_details_response_model.dart';
import 'package:boilerplate/features/student_actions/data/models/response/tickets/tickets_response_model.dart';
import 'package:dio/dio.dart';

abstract class StudentActionsRemoteDataSource {
  Future<TermRegisterPayResponseModel> termRegisterPay({required int termId});

  Future<AvailabilityTermRegistrationResponseModel>
      availabilityTermRegistration();

  Future<TicketDetailsResponseModel> ticketReply({
    required TicketReplyRequestModel requestModel,
  });

  Future<TicketDetailsResponseModel> createTicket({
    required TicketCreateRequestModel requestModel,
  });

  Future<TicketsResponseModel> getTickets();

  Future<TicketsCategoriesResponseModel> getCategories();

  Future<TicketDetailsResponseModel> getTicketDetails({
    required TicketDetailsRequestModel requestModel,
  });

  Future<CourseRegisterResponseModel> getRegisteredCourse();

  Future<AvailableCoursesResponseModel> getAvailableCourse();

  Future<CourseRegisterResponseModel> addCourse({
    required AddCourseRequestModel requestModel,
  });

  Future<CourseRegisterResponseModel> removeCourse({required int courseId});
}

class StudentActionsRemoteDataSourceImp
    implements StudentActionsRemoteDataSource {
  StudentActionsRemoteDataSourceImp({required this.dioHelper});

  final DioHelper dioHelper;

  @override
  Future<TermRegisterPayResponseModel> termRegisterPay({
    required int termId,
  }) async {
    final response = await dioHelper.get(
      url: '${Endpoints.termRegisterPay}/$termId',
    );
    return TermRegisterPayResponseModel.fromJson(response.data);
  }

  @override
  Future<AvailabilityTermRegistrationResponseModel>
      availabilityTermRegistration() async {
    final response = await dioHelper.get(
      url: Endpoints.availabilityTermRegistration,
    );
    return AvailabilityTermRegistrationResponseModel.fromJson(response.data);
  }

  @override
  Future<TicketDetailsResponseModel> createTicket({
    required TicketCreateRequestModel requestModel,
  }) async {
    final response = await dioHelper.post(
      url: Endpoints.ticketCreate,
      data: FormData.fromMap(await requestModel.toJson()),
    );
    return TicketDetailsResponseModel.fromJson(response.data);
  }

  @override
  Future<TicketDetailsResponseModel> ticketReply({
    required TicketReplyRequestModel requestModel,
  }) async {
    final response = await dioHelper.post(
      url: Endpoints.ticketReply,
      data: FormData.fromMap(await requestModel.toJson()),
    );
    return TicketDetailsResponseModel.fromJson(response.data);
  }

  @override
  Future<TicketsCategoriesResponseModel> getCategories() async {
    final response = await dioHelper.get(
      url: Endpoints.ticketCategories,
    );
    return TicketsCategoriesResponseModel.fromJson(response.data);
  }

  @override
  Future<TicketDetailsResponseModel> getTicketDetails({
    required TicketDetailsRequestModel requestModel,
  }) async {
    final response = await dioHelper.get(
      url: Endpoints.ticketDetails,
      queryParams: requestModel.toJson(),
    );
    return TicketDetailsResponseModel.fromJson(response.data);
  }

  @override
  Future<TicketsResponseModel> getTickets() async {
    final response = await dioHelper.get(
      url: Endpoints.tickets,
    );
    return TicketsResponseModel.fromJson(response.data);
  }

  @override
  Future<CourseRegisterResponseModel> addCourse({
    required AddCourseRequestModel requestModel,
  }) async {
    final response = await dioHelper.post(
      url: Endpoints.addCourse,
      data: requestModel.toJson(),
    );
    return CourseRegisterResponseModel.fromJson(response.data);
  }

  @override
  Future<AvailableCoursesResponseModel> getAvailableCourse() async {
    final response = await dioHelper.get(url: Endpoints.availableCourses);
    return AvailableCoursesResponseModel.fromJson(response.data);
  }

  @override
  Future<CourseRegisterResponseModel> getRegisteredCourse() async {
    final response = await dioHelper.get(url: Endpoints.registeredCourses);
    return CourseRegisterResponseModel.fromJson(response.data);
  }

  @override
  Future<CourseRegisterResponseModel> removeCourse({
    required int courseId,
  }) async {
    final response = await dioHelper.delete(
      url: '${Endpoints.removeCourse}?student_course_id=$courseId',
    );
    return CourseRegisterResponseModel.fromJson(response.data);
  }
}
