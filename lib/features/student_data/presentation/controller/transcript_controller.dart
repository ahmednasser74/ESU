import 'package:boilerplate/core/utils/pref_util.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class TranscriptController extends GetxController {
  final PdfViewerController pdfViewerController = PdfViewerController();
  final pdfUrl = 'https://sisv2.esu.ac.ae/api/transcript';
  final headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${SharedPrefs.instance.getToken()}',
  };
}
