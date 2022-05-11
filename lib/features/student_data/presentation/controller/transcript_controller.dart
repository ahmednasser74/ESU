import 'package:boilerplate/core/const/end_point.dart';
import 'package:boilerplate/core/utils/pref_util.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class TranscriptController extends GetxController {
  final PdfViewerController pdfViewerController = PdfViewerController();
  final pdfUrl = '${Endpoints.baseUrl}transcript';
  final headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${SharedPrefs.instance.getToken()}',
  };
}
