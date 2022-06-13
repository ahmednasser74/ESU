import 'dart:io';

import 'package:dio/dio.dart';

class TicketCreateRequestModel {
  TicketCreateRequestModel({
    required this.subject,
    required this.body,
    required this.categoryId,
    this.file,
  });

  final String subject;
  final String body;
  final int categoryId;
  final File? file;

  Future<Map<String, dynamic>> toJson() async => {
        'subject': subject,
        'body': body,
        'category_id': categoryId,
        'file': file == null ? null : await MultipartFile.fromFile(file!.path),
      };
}
