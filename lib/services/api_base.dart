import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_nanonets_ocr/models/base_response_model.dart';

class APIBase {
  String password = "";
  final dio = Dio();

  Future<BaseResponseModel> post(String apiKey,
      {String? apiUrl,
      dynamic bodyData,
      dynamic responseClass,
      Options? options}) async {
    String basicAuth =
        'Basic ${base64.encode(utf8.encode('$apiKey:$password'))}';

    dio.options.headers["Authorization"] = basicAuth;
    try {
      final apiResponse =
          await dio.post(apiUrl ?? "", data: bodyData, options: options);

      if (apiResponse.statusCode == 200) {
        var response = apiResponse.data;
        var jsonData = jsonDecode(jsonEncode(response));

        return BaseResponseModel(
            result: jsonData, success: true, message: "Success");
      } else {
        return BaseResponseModel(
            result: null, success: false, message: "Success");
      }
    } catch (err) {
      if (err is DioException) {
        return BaseResponseModel(
            result: null, success: false, message: err.response?.statusMessage);
      } else {
        return BaseResponseModel(
            result: null, success: false, message: "Something went wrong!");
      }
    }
  }

  /// Common get API method
  Future<BaseResponseModel> get(String apiKey,
      {String? apiUrl,
      dynamic bodyData,
      dynamic responseClass,
      Options? options}) async {
    String basicAuth =
        'Basic ${base64.encode(utf8.encode('$apiKey:$password'))}';

    dio.options.headers["Authorization"] = basicAuth;
    try {
      final apiResponse = await dio.get(apiUrl ?? "", options: options);

      if (apiResponse.statusCode == 200) {
        var response = apiResponse.data;
        var jsonData = jsonDecode(jsonEncode(response));

        return BaseResponseModel(
            result: jsonData, success: true, message: "Success");
      } else {
        return BaseResponseModel(
            result: null, success: false, message: "Success");
      }
    } catch (err) {
      if (err is DioException) {
        return BaseResponseModel(
            result: null, success: false, message: err.response?.statusMessage);
      } else {
        return BaseResponseModel(
            result: null, success: false, message: "Something went wrong!");
      }
    }
  }
}
