import 'package:esu/features/student_actions/data/models/request/add_course/add_course_request_model.dart';
import 'package:esu/features/student_actions/data/models/request/ticket_create/ticket_create_request_model.dart';
import 'package:esu/features/student_actions/data/models/request/ticket_details/ticket_details_request_model.dart';
import 'package:esu/features/student_actions/data/models/request/ticket_reply/ticket_reply_request_model.dart';
import 'package:esu/features/student_actions/data/models/response/availability_term_registration/availability_term_registration_response_model.dart';
import 'package:esu/features/student_actions/data/models/response/available_course/available_course_response_model.dart';
import 'package:esu/features/student_actions/data/models/response/course_register/courses_registeration_response_model.dart';
import 'package:esu/features/student_actions/data/models/response/term_register_pay_response_model/term_register_pay_response_model.dart';
import 'package:esu/features/student_actions/data/models/response/ticket_category/ticket_category_data_response_model.dart';
import 'package:esu/features/student_actions/data/models/response/ticket_details/tickets_details_response_model.dart';
import 'package:esu/features/student_actions/data/models/response/tickets/tickets_response_model.dart';
import 'package:dartz/dartz.dart';

abstract class StudentActionsRepository {
  Future<Either<String?, AvailabilityTermRegistrationResponseModel>>
      availabilityTermRegistration();

  Future<Either<String?, TermRegisterPayResponseModel>> termRegisterPay({
    required int termId,
  });

  Future<Either<String?, TicketDetailsResponseModel>> ticketReply({
    required TicketReplyRequestModel requestModel,
  });

  Future<Either<String?, TicketDetailsResponseModel>> createTicket({
    required TicketCreateRequestModel requestModel,
  });

  Future<Either<String?, TicketsResponseModel>> getTickets();

  Future<Either<String?, TicketsCategoriesResponseModel>> getCategories();

  Future<Either<String?, TicketDetailsResponseModel>> getTicketDetails({
    required TicketDetailsRequestModel requestModel,
  });

  Future<Either<String?, CourseRegisterResponseModel>> getRegisteredCourse();

  Future<Either<String?, AvailableCoursesResponseModel>> getAvailableCourse();

  Future<Either<String?, CourseRegisterResponseModel>> addCourse({
    required AddCourseRequestModel requestModel,
  });

  Future<Either<String?, CourseRegisterResponseModel>> removeCourse({
    required int courseId,
  });
}
