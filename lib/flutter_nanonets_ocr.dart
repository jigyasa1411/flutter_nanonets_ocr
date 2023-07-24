// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

library flutter_nanonets_ocr;

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nanonets_ocr/models/base_response_model.dart';
import 'package:flutter_nanonets_ocr/models/get_ocr_model_by_id_response_model.dart';
import 'package:flutter_nanonets_ocr/services/api_base.dart';
import '../models/ocr_predictor_response_model.dart';

/// [NanonetsOCR] is the base class which will be containing all the methods, properties and attributes required for the implementation
/// of the nanonets APIs.
class NanonetsOCR {
  /// [password] is used for the Basic Auth of the DIO requets.
  String password = "";

  final dio = Dio();

  /// [APIBase] is the class which contains the implementation of base api requests i.e. [GET], [POST].
  APIBase apiBase = APIBase();
  // Create OCR Model
  /// This function will be used to create an OCR model.
  /// [apiKey] will be the key generated from Nanonets.
  /// [categories] can be seen as the data that we intend to fetch from the document, here we can pass on various labels (keys) to assign
  /// the fetched value to the category key.
  /// [modelType] will be the type of the model that we want to create, for OCR model value of [modelType] will be "ocr".
  Future createOCRModel(String apiKey, List<String> categories,
      String modelType, BuildContext context) async {
    try {
      final predictDocumentFileResponse = await apiBase.post(apiKey, context,
          apiUrl: "https://app.nanonets.com/api/v2/OCR/Model/",
          bodyData: {"categories": categories, "model_type": modelType});
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

  /// This function will be used to get details of a model by using it's id.
  /// [apiKey] will be required and it will be generated from Nanonets.
  /// [modelId] will be the model id created on Nanonets.

  Future<GetModelByIdResponseModel> getOCRModelDetailsById(
      String apiKey, String modelId, BuildContext context) async {
    try {
      // Calling base get method along with apiUrl, apiKey and context as it's parameter.
      final predictDocumentFileResponse = await apiBase.get(apiKey, context,
          apiUrl: "https://app.nanonets.com/api/v2/OCR/Model/$modelId");

      // If the success flag from the above api call is true then convert the json response from base class to a dart
      // constructor and return the value to calling variable/widget.
      if (predictDocumentFileResponse.success == true) {
        GetModelByIdResponseModel responseModel =
            GetModelByIdResponseModel.fromJson(
                predictDocumentFileResponse.result);
        return responseModel;
      } else {
        // If success flag is false then return an empty constructor of the model to calling variable/widget.
        return GetModelByIdResponseModel();
      }
    } catch (err) {
      // If success flag is false then return an empty constructor of the model to calling variable/widget.
      return GetModelByIdResponseModel();
    }
  }

  /// The function is to be used for fetching the documents details in case the document is in [File] format.
  /// [apiKey] will be required and it will be generated from Nanonets.
  /// [image] will be of [File] type which will be fetched from device whether by using camera/gallery/file manager directories.
  /// [modelId] will be the model id created on Nanonets.

  Future<OcrPredictorResponseModel> predictDocumentFile(
      String apiKey, File? image, String modelId, BuildContext context) async {
    // Preparing the multipart data to send in the Post request for predicting data using document file.
    var formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(image!.path),
    });
    BaseResponseModel? predictDocumentFileResponse;

    try {
      // Calling the post api using base api implementation by passing the apiKey, apiUrl, bodyData as parameters.
      predictDocumentFileResponse = await apiBase.post(apiKey, context,
          apiUrl:
              "https://app.nanonets.com/api/v2/OCR/Model/$modelId/LabelFile/",
          bodyData: formData);

      // If the success flag from the above api call is true then convert the json response from base class to a dart
      // constructor and return the value to calling variable/widget.
      if (predictDocumentFileResponse.success == true) {
        OcrPredictorResponseModel responseModel =
            OcrPredictorResponseModel.fromJson(
                predictDocumentFileResponse.result);
        return responseModel;
      } else {
        // If success flag is false then return a relevant constructor of the model to calling variable/widget.
        return OcrPredictorResponseModel(
            message: predictDocumentFileResponse.message,
            result: [],
            signedUrls: <String, SignedUrl>{});
      }
    } catch (err) {
      // If success flag is false then return a relevant constructor of the model to calling variable/widget.
      return OcrPredictorResponseModel(
          message: predictDocumentFileResponse?.message ?? "",
          result: [],
          signedUrls: <String, SignedUrl>{});
    }
  }

  /// The function is to be used for fetching the documents details in case the document is to be accessed via a URL.
  /// [apiKey] will be required and it will be generated from Nanonets.
  /// [documentUrl] will be of [String] type, that user can either type or paste.
  /// [modelId] will be the model id created on Nanonets.

  Future<OcrPredictorResponseModel> predictDocumentURL(String apiKey,
      String? documentUrl, String modelId, BuildContext context) async {
    BaseResponseModel? productResponse;
    try {
      /// We are using common post method from the base API class that we created by passing apiKey, apiUrl, bodyData and required
      /// options type.
      productResponse = await apiBase.post(apiKey, context,
          apiUrl:
              "https://app.nanonets.com/api/v2/OCR/Model/$modelId/LabelUrls/",
          bodyData: {"url": documentUrl},
          options: Options(contentType: "application/x-www-form-urlencoded"));

      // If the success flag from the above api call is true then convert the json response from base class to a dart
      // constructor and return the value to calling variable/widget.

      if (productResponse.success = true) {
        OcrPredictorResponseModel responseModel =
            OcrPredictorResponseModel.fromJson(productResponse.result);
        return responseModel;
      } else {
        // If success flag is false then return a relevant constructor of the model to calling variable/widget.
        return OcrPredictorResponseModel(
            message: productResponse.message,
            result: [],
            signedUrls: <String, SignedUrl>{});
      }
    } catch (err) {
      // If success flag is false then return a relevant constructor of the model to calling variable/widget.
      return OcrPredictorResponseModel(
          message: productResponse?.message ?? "",
          result: [],
          signedUrls: <String, SignedUrl>{});
    }
  }
}
