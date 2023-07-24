/// [OcrPredictorResponseModel] is used when we want to fetch data from a document either by uploading docment files or by using
/// document url.

class OcrPredictorResponseModel {
  OcrPredictorResponseModel({
    required this.message,
    required this.result,
    required this.signedUrls,
  });

  final String? message;
  final List<Result> result;
  final Map<String, SignedUrl> signedUrls;

  factory OcrPredictorResponseModel.fromJson(Map<String, dynamic> json) {
    return OcrPredictorResponseModel(
      message: json["message"],
      result: json["result"] == null
          ? []
          : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
      signedUrls: Map.from(json["signed_urls"])
          .map((k, v) => MapEntry<String, SignedUrl>(k, SignedUrl.fromJson(v))),
    );
  }
}

class Result {
  Result({
    required this.message,
    required this.input,
    required this.prediction,
    required this.page,
    required this.requestFileId,
    required this.filepath,
    required this.id,
    required this.rotation,
    required this.fileUrl,
    required this.requestMetadata,
    required this.processingType,
  });

  final String? message;
  final String? input;
  final List<Prediction> prediction;
  final int? page;
  final String? requestFileId;
  final String? filepath;
  final String? id;
  final int? rotation;
  final String? fileUrl;
  final String? requestMetadata;
  final String? processingType;

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      message: json["message"],
      input: json["input"],
      prediction: json["prediction"] == null
          ? []
          : List<Prediction>.from(
              json["prediction"]!.map((x) => Prediction.fromJson(x))),
      page: json["page"],
      requestFileId: json["request_file_id"],
      filepath: json["filepath"],
      id: json["id"],
      rotation: json["rotation"],
      fileUrl: json["file_url"],
      requestMetadata: json["request_metadata"],
      processingType: json["processing_type"],
    );
  }
}

class Prediction {
  Prediction({
    required this.id,
    required this.label,
    required this.xmin,
    required this.ymin,
    required this.xmax,
    required this.ymax,
    required this.score,
    required this.ocrText,
    required this.type,
    required this.status,
    required this.pageNo,
    required this.labelId,
    required this.cells,
  });

  final String? id;
  final String? label;
  final int? xmin;
  final int? ymin;
  final int? xmax;
  final int? ymax;
  final double? score;
  final String? ocrText;
  final String? type;
  final String? status;
  final int? pageNo;
  final String? labelId;
  final List<Cell> cells;

  factory Prediction.fromJson(Map<String, dynamic> json) {
    return Prediction(
      id: json["id"],
      label: json["label"],
      xmin: json["xmin"],
      ymin: json["ymin"],
      xmax: json["xmax"],
      ymax: json["ymax"],
      score: json["score"].toDouble(),
      ocrText: json["ocr_text"],
      type: json["type"],
      status: json["status"],
      pageNo: json["page_no"],
      labelId: json["label_id"],
      cells: json["cells"] == null
          ? []
          : List<Cell>.from(json["cells"]!.map((x) => Cell.fromJson(x))),
    );
  }
}

class Cell {
  Cell({
    required this.id,
    required this.row,
    required this.col,
    required this.rowSpan,
    required this.colSpan,
    required this.label,
    required this.xmin,
    required this.ymin,
    required this.xmax,
    required this.ymax,
    required this.score,
    required this.text,
    required this.rowLabel,
    required this.verificationStatus,
    required this.status,
    required this.failedValidation,
    required this.labelId,
  });

  final String? id;
  final int? row;
  final int? col;
  final int? rowSpan;
  final int? colSpan;
  final String? label;
  final int? xmin;
  final int? ymin;
  final int? xmax;
  final int? ymax;
  final double? score;
  final String? text;
  final String? rowLabel;
  final String? verificationStatus;
  final String? status;
  final String? failedValidation;
  final String? labelId;

  factory Cell.fromJson(Map<String, dynamic> json) {
    return Cell(
      id: json["id"],
      row: json["row"],
      col: json["col"],
      rowSpan: json["row_span"],
      colSpan: json["col_span"],
      label: json["label"],
      xmin: json["xmin"],
      ymin: json["ymin"],
      xmax: json["xmax"],
      ymax: json["ymax"],
      score: json["score"],
      text: json["text"],
      rowLabel: json["row_label"],
      verificationStatus: json["verification_status"],
      status: json["status"],
      failedValidation: json["failed_validation"],
      labelId: json["label_id"],
    );
  }
}

class SignedUrl {
  SignedUrl({
    required this.original,
    required this.originalCompressed,
    required this.thumbnail,
    required this.acwRotate90,
    required this.acwRotate180,
    required this.acwRotate270,
    required this.originalWithLongExpiry,
  });

  final String? original;
  final String? originalCompressed;
  final String? thumbnail;
  final String? acwRotate90;
  final String? acwRotate180;
  final String? acwRotate270;
  final String? originalWithLongExpiry;

  factory SignedUrl.fromJson(Map<String, dynamic> json) {
    return SignedUrl(
      original: json["original"],
      originalCompressed: json["original_compressed"],
      thumbnail: json["thumbnail"],
      acwRotate90: json["acw_rotate_90"],
      acwRotate180: json["acw_rotate_180"],
      acwRotate270: json["acw_rotate_270"],
      originalWithLongExpiry: json["original_with_long_expiry"],
    );
  }
}
