import 'package:hive_flutter/adapters.dart';

import 'file_downloader_model.dart';

abstract class FileDownloadedDbHelper {
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(FileDownloadedModelAdapter());
  }

  static Future<Box<FileDownloadedModel>> openBox() async {
    return await Hive.openBox<FileDownloadedModel>('file_downloaded');
  }

  FileDownloadedModel? getByUrl(String url);

  void put(FileDownloadedModel fileDownloader);

  void delete(FileDownloadedModel fileDownloader);
}

class FileDownloadedDbHelperImpl extends FileDownloadedDbHelper {
  final Box<FileDownloadedModel> box;

  FileDownloadedDbHelperImpl(this.box);

  @override
  void put(FileDownloadedModel fileDownloader) {
    box.put(fileDownloader.url, fileDownloader);
  }

  @override
  void delete(FileDownloadedModel fileDownloader) {
    box.delete(fileDownloader);
  }

  @override
  FileDownloadedModel? getByUrl(String url) {
    if (box.values.isNotEmpty) {
      return box.get(url);
    }
    return null;
  }
}
