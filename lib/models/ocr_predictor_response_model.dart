/// [OcrPredictorResponseModel] is used when we want to fetch data from a document either by uploading docment files or by using
/// document url.
library;

class OcrPredictorResponseModel {
  OcrPredictorResponseModel({
    required this.message,
    required this.result,
    required this.signedUrls,
  });

  /// [message] will store the success/failure message coming from the API call.
  final String? message;

  /// [result] will contain result of the prediction.
  final List<Result> result;

  /// [signedUrls] will contain information about the uploaded image information, whether in file mode or url mode.
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

/// [Result] class will be used to store the data received from the "result" key from the API response.
/// It will consist of [message], [input], [prediction], [requestFileId] etc data about the given input and output.

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

  /// [message] will contain success message from the API.
  final String? message;

  /// [input] will store the value of input image file or url.
  final String? input;

  /// [prediction] is the main output list, here the predicted fields will be stored.
  final List<Prediction> prediction;

  /// [page] tells about the page of the result.
  final int? page;

  /// [requestFileId] contains Id of requet file.
  final String? requestFileId;

  /// [filepath] contains path of the uploaded file in nanonets.
  final String? filepath;

  /// [id] stores id of the result.
  final String? id;

  final int? rotation;

  /// [fileUrl] contains uploaded file path in raw predictions.
  final String? fileUrl;

  /// [requestMetadata] conatins metadata of request file or url.
  final String? requestMetadata;

  /// [processingType] contains the type of processing of the requested file.
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

/// [Prediction] class will be used to store the data received from "prediction" key in [Result] class.
/// [Result] class will contain [List] of [Prediction] class implying that there will be a list of predictions
/// stored in the list which will be of [Prediction] type.
///
/// [Prediction] class will have [id], [score], [label], [ocrText] etc.
/// [label] will be the category of the OCR model assigned to that prediction and [ocrText] will be the value of that
/// particular category.
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

  /// [id] contains id of the prediction.
  final String? id;

  /// [label] conatains label/category of the prediction.
  final String? label;
  final int? xmin;
  final int? ymin;
  final int? xmax;
  final int? ymax;

  /// [score] conatins prediction score of the prediction result.
  final double? score;

  /// [ocrText] conatains value of the label/category predicted by the OCR.
  final String? ocrText;

  /// [type] tells about the type of the label e.g. field, table etc.
  final String? type;

  /// [status] tells about the status of the prediction i.e. wrong or right prediction.
  final String? status;

  /// [pageNo] contains page of the prediction made.
  final int? pageNo;

  /// [labelId] conatins id of the label/category.
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

/// [Cell] will basically provide the tabular information about the [label], [verificationStatus] etc about the prediction made.
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

/// [SignedUrl] will be used to hold the information related to the the uploaded file or url.
/// It will have data like [original], [thumbnail], [originalCompressed] etc data related to the [SignedUrl].
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
