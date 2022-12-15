import 'dart:io';

import 'package:dio/dio.dart';

class MoodleLoginRequestModel {
  final File photo;

  MoodleLoginRequestModel({required this.photo});

  Future<Map<String, dynamic>> toJson() async {
    return {
      'photo': await MultipartFile.fromFile(photo.path, filename: photo.path.split('/').last),
    };
  }
}
