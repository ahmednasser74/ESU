import 'dart:io';

import 'package:dio/dio.dart';

class TicketReplyRequestModel {
  TicketReplyRequestModel({
    required this.body,
    required this.ticketId,
    this.file,
  });

  final int ticketId;
  final String body;
  final File? file;

  Future<Map<String, dynamic>> toJson() async => {
        'body': body,
        'ticket_id': ticketId,
        'file': file == null ? null : await MultipartFile.fromFile(file!.path),
      };
}
