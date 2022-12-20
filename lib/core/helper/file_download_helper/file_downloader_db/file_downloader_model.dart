import 'package:hive_flutter/hive_flutter.dart';

part 'file_downloader_model.g.dart';

@HiveType(typeId: 0)
class FileDownloadedModel {
  @HiveField(0)
  String url;

  @HiveField(1)
  String path;

  FileDownloadedModel({
    required this.url,
    required this.path,
  });
}
