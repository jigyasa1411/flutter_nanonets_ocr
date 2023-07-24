// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

library flutter_nanonets_ocr;

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nanonets_ocr/models/base_response_model.dart';
import 'package:flutter_nanonets_ocr/models/get_ocr_model_by_id_response_model.dart';
import 'package:flutter_nanonets_ocr/services/api_base.dart';
import '../models/ocr_predictor_response_model.dart';

class NanonetsOCR {
  String password = "";

  final dio = Dio();
  APIBase apiBase = APIBase();
  // Create OCR Model
  /// This function will be used to create an OCR model.
  Future createOCRModel(
      String apiKey, List<String> categories, String modelType) async {
    String basicAuth =
        'Basic ${base64.encode(utf8.encode('$apiKey:$password'))}';

    dio.options.headers["Authorization"] = basicAuth;
    final productResponse = await dio.post(
        "https://app.nanonets.com/api/v2/OCR/Model/",
        data: {"categories": categories, "model_type": modelType});
    log(productResponse.toString());
    if (productResponse.statusCode == 200) {
      log(productResponse.data);
      var response = productResponse.data;
      var jsonData = jsonDecode(jsonEncode(response));

      OcrPredictorResponseModel responseModel =
          OcrPredictorResponseModel.fromJson(jsonData);
      return responseModel;
    } else {
      log("Can't fetch user from the api.");
      return OcrPredictorResponseModel(
          message: "", result: [], signedUrls: <String, SignedUrl>{});
    }
  }

  /// This function will be used to get details of a model by using it's id.
  /// [apiKey] will be required and it will be generated from Nanonets.
  /// [modelId] will be the model id created on Nanonets.

  Future<GetModelByIdResponseModel> getOCRModelDetailsById(
      String apiKey, String modelId, BuildContext context) async {
    try {
      final predictDocumentFileResponse = await apiBase.get(apiKey,
          apiUrl: "https://app.nanonets.com/api/v2/OCR/Model/$modelId");
      if (predictDocumentFileResponse.success == true) {
        GetModelByIdResponseModel responseModel =
            GetModelByIdResponseModel.fromJson(
                predictDocumentFileResponse.result);
        return responseModel;
      } else {
        return GetModelByIdResponseModel();
      }
    } catch (err) {
      return GetModelByIdResponseModel();
    }
  }

  /// The function is to be used for fetching the documents details in case the document is in [File] format.
  /// [apiKey] will be required and it will be generated from Nanonets.
  /// [image] will be of [File] type which will be fetched from device whether by using camera/gallery/file manager directories.
  /// [modelId] will be the model id created on Nanonets.

  Future<OcrPredictorResponseModel> predictDocumentFile(
      String apiKey, File? image, String modelId, BuildContext context) async {
    var formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(image!.path),
    });
    try {
      final predictDocumentFileResponse = await apiBase.post(apiKey,
          apiUrl:
              "https://app.nanonets.com/api/v2/OCR/Model/$modelId/LabelFile/",
          bodyData: formData);
      if (predictDocumentFileResponse.success == true) {
        OcrPredictorResponseModel responseModel =
            OcrPredictorResponseModel.fromJson(
                predictDocumentFileResponse.result);
        return responseModel;
      } else {
        return OcrPredictorResponseModel(
            message: "", result: [], signedUrls: <String, SignedUrl>{});
      }
    } catch (err) {
      return OcrPredictorResponseModel(
          message: "", result: [], signedUrls: <String, SignedUrl>{});
    }
  }

  /// The function is to be used for fetching the documents details in case the document is to be accessed via a URL.
  /// [apiKey] will be required and it will be generated from Nanonets.
  /// [documentUrl] will be of [String] type, that user can either type or paste.
  /// [modelId] will be the model id created on Nanonets.

  Future<OcrPredictorResponseModel> predictDocumentURL(String apiKey,
      String? documentUrl, String modelId, BuildContext context) async {
    BaseResponseModel productResponse;
    try {
      productResponse = await apiBase.post(apiKey,
          apiUrl:
              "https://app.nanonets.com/api/v2/OCR/Model/$modelId/LabelUrls/",
          bodyData: {"url": documentUrl},
          options: Options(contentType: "application/x-www-form-urlencoded"));

      if (productResponse.success = true) {
        OcrPredictorResponseModel responseModel =
            OcrPredictorResponseModel.fromJson(productResponse.result);
        return responseModel;
      } else {
        return OcrPredictorResponseModel(
            message: "", result: [], signedUrls: <String, SignedUrl>{});
      }
    } catch (err) {
      return OcrPredictorResponseModel(
          message: "", result: [], signedUrls: <String, SignedUrl>{});
    }
  }
}
