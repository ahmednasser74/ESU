import 'transcript_item_response_model.dart';

class TranscriptResponseModel {
  TranscriptResponseModel({
    required this.status,
    required this.code,
    required this.data,
    this.message,
  });

  final bool status;
  final int code;
  final String? message;
  final List<TranscriptItemResponseModel> data;

  factory TranscriptResponseModel.fromJson(Map<String, dynamic> json) =>
      TranscriptResponseModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<TranscriptItemResponseModel>.from(
                json["data"]
                    .map((x) => TranscriptItemResponseModel.fromJson(x)),
              ),
      );
}
