import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:esu/core/utils/di.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import 'file_downloader_db/file_downloader_db.dart';

///[FileDownloadManager] is a class that manages the download of files in device
///[FileDownloadManager] have constructor where we register port for communication with isolate
///NOTE: port must init for one time only so we put it in di file and use it in other classes */
/// [checkFileExists] checks if file exists in device
/// [openFile] opens file from path which is saved in device or local db
/// [downloadFile] this function is used to download file from url and save it in device

class FileDownloadManager {
  final _port = Injection.di<ReceivePort>();
  final _eventController = Injection.di<StreamController>();

  String fileUrl;

  String? filePath;
  String? taskId;

  FileDownloadManager({
    required this.fileUrl,
  }) {
    IsolateNameServer.registerPortWithName(
      _port.sendPort,
      'downloader_send_port',
    );
    FlutterDownloader.registerCallback(downloadCallback);
  }

  Stream<dynamic> get events {
    return _eventController.stream;
  }

  Future<void> openFile() async {
    if (fileUrl.startsWith('/')) {
      filePath = fileUrl;
    }
    if (Platform.isIOS) {
      await OpenFile.open(filePath);
    } else {
      if (taskId != null) {
        await FlutterDownloader.open(taskId: taskId!);
      } else {
        await OpenFile.open(filePath);
      }
    }
  }

  bool checkFileExists() {
    if (fileUrl.startsWith('/')) {
      return true;
    }
    final exitDownload = Injection.di<FileDownloadedDbHelper>().getByUrl(
      fileUrl,
    );
    if (exitDownload != null) {
      filePath = exitDownload.path;
      return true;
    }
    return false;
  }

  Future<void> downloadFile() async {
    final fileName = 'ESU-${DateTime.now().toIso8601String()}';
    final externalDir = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
    taskId = await FlutterDownloader.enqueue(
      url: fileUrl,
      savedDir: externalDir!.path,
      fileName: fileName,
      showNotification: true,
      openFileFromNotification: true,
    );
    filePath = '${externalDir.path}/$fileName';
  }

  @pragma('vm:entry-point')
  static void downloadCallback(
    String id,
    DownloadTaskStatus status,
    int progress,
  ) {
    final SendPort? send = IsolateNameServer.lookupPortByName(
      'downloader_send_port',
    );
    send!.send([id, status, progress]);
  }

  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
  }
}
