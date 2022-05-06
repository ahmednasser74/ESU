import 'dart:io';
import 'dart:math';

import 'package:file_picker/file_picker.dart';

mixin FileProperties {
  Future<File?> pickedFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path ?? '');
      return file;
    } else {
      return null;
    }
  }

  Future<String> getFileSize({
    required String filepath,
    required int decimals,
  }) async {
    var file = File(filepath);
    int bytes = await file.length();
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    final fileSize =
        ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + ' ' + suffixes[i];
    return fileSize;
  }

  Future<bool> isFileLowerThanTenMega({required String filepath}) async {
    var file = File(filepath);
    int bytes = await file.length();
    if (bytes < 10485760) {
      return true;
    } else {
      return false;
    }
  }

  List<String> imageExtensions = [
    '.apng',
    '.avif',
    '.gif',
    '.jpg',
    '.jpeg',
    '.jfif',
    '.pjpeg',
    '.pjp',
    '.png',
    '.svg',
    '.webp',
  ];

  bool fileIsImage({required String fileName}) {
    String extension = "." + fileName.split('.').last;
    return imageExtensions.contains(extension);
  }
}
