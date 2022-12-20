import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:esu/core/utils/di.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

import '../../dependencies/dependency_init.dart';
import 'file_downloader_db/file_downloader_db.dart';

///[FileDownloadManager] is a class that manages the download of files in device
///[FileDownloadManager] have constructor where we register port for communication with isolate
///NOTE: port must init for one time only so we put it in di file and use it in other classes */
/// [checkFileExists] checks if file exists in device
/// [openFile] opens file from path which is saved in device or local db
/// [downloadFile] this function is used to download file from url and save it in device

class FileDownloadManager {
  final _port = di<ReceivePort>();
  final _eventController = di<StreamController>();

  String fileUrl;
  Map<String, String>? headers;

  String? filePath;
  String? taskId;
  String? fileExtension;

  FileDownloadManager({
    required this.fileUrl,
    this.fileExtension = 'pdf',
    this.headers,
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
      await OpenFilex.open(filePath);
    } else {
      if (taskId != null) {
        await FlutterDownloader.open(taskId: taskId!);
      } else {
        await OpenFilex.open(filePath);
      }
    }
  }

  bool checkFileExists() {
    if (fileUrl.startsWith('/')) {
      return true;
    }
    final exitDownload = di<FileDownloadedDbHelper>().getByUrl(
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
    final externalDir = Platform.isAndroid ? await getExternalStorageDirectory() : await getApplicationDocumentsDirectory();
    taskId = await FlutterDownloader.enqueue(
      url: fileUrl,
      headers: headers,
      savedDir: externalDir!.path,
      fileName: '$fileName.$fileExtension',
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
