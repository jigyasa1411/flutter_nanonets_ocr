// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

library flutter_nanonets_ocr;

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nanonets_ocr/constants/api_constants.dart';
import '../models/ocr_predictor_response_model.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}

class NanonetsOCR {
  String username = "b1179314-e271-11ed-afa9-76ff1797c1e3";
  String password = "";

  final dio = Dio();
  APIBase apiBase = APIBase();
  // Create OCR Model
  /// This function will be used to create an OCR model.
  Future createOCRModel(List<String> categories, String modelType) async {
    String basicAuth =
        'Basic ${base64.encode(utf8.encode('$username:$password'))}';

    dio.options.headers["Authorization"] = basicAuth;
    final productResponse = await dio.post(
        "https://app.nanonets.com/api/v2/OCR/Model/",
        data: {"categories": categories, "model_type": modelType});
    print(productResponse);
    if (productResponse.statusCode == 200) {
      print(productResponse.data);
      var response = productResponse.data;
      var jsonData = jsonDecode(jsonEncode(response));

      ReceiptOcrPredictorResponseModel responseModel =
          ReceiptOcrPredictorResponseModel.fromJson(jsonData);
      return responseModel;
    } else {
      print("Can't fetch user from the api.");
      return ReceiptOcrPredictorResponseModel(
          message: "", result: [], signedUrls: Map());
    }
  }

  /// The function is to be used for fetching the documents details in case the document is in [File] format.
  /// [image] will be of [File] type which will be fetched from device whether by using camera/gallery/file manager directories.
  /// [modelId] will be the model id created on Nanonets.

  Future<ReceiptOcrPredictorResponseModel> predictDocumentFile(
      File? image, String modelId, BuildContext context) async {
    var formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(image!.path),
    });
    try {
      final predictDocumentFileResponse = await apiBase.post(
          apiUrl:
              "https://app.nanonets.com/api/v2/OCR/Model/$modelId/LabelFile/",
          bodyData: formData);
      if (predictDocumentFileResponse.success == true) {
        ReceiptOcrPredictorResponseModel responseModel =
            ReceiptOcrPredictorResponseModel.fromJson(
                predictDocumentFileResponse.result);
        return responseModel;
      } else {
        return ReceiptOcrPredictorResponseModel(
            message: "", result: [], signedUrls: <String, SignedUrl>{});
      }
    } catch (err) {
      return ReceiptOcrPredictorResponseModel(
          message: "", result: [], signedUrls: <String, SignedUrl>{});
    }
  }

  /// The function is to be used for fetching the documents details in case the document is in [File] format.
  /// [documentUrl] will be of [String] type, that user can either type or paste.
  /// [modelId] will be the model id created on Nanonets.

  Future<ReceiptOcrPredictorResponseModel> predictDocumentURL(
      String? documentUrl, String modelId, BuildContext context) async {
    var productResponse;
    try {
      productResponse = await apiBase.post(
          apiUrl:
              "https://app.nanonets.com/api/v2/OCR/Model/$modelId/LabelUrls/",
          bodyData: {"url": documentUrl},
          options: Options(contentType: "application/x-www-form-urlencoded"));

      if (productResponse.success = true) {
        ReceiptOcrPredictorResponseModel responseModel =
            ReceiptOcrPredictorResponseModel.fromJson(productResponse.result);
        return responseModel;
      } else {
        return ReceiptOcrPredictorResponseModel(
            message: "", result: [], signedUrls: Map());
      }
    } catch (err) {
      return ReceiptOcrPredictorResponseModel(
          message: "", result: [], signedUrls: Map());
    }
  }
}
