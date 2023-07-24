import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_nanonets_ocr/models/base_response_model.dart';

/// [APIBase] class contains attributes, properties and methods for base implementation of the http requests like [GET], [POST].
class APIBase {
  /// [password] will be used for Basic Auth implementations in the APIs.
  String password = "";
  final dio = Dio();

  /// [post] method will be used to call [POST] method in all the methods which is making use of [POST] methods.
  /// [apiUrl] will be used to specify the particular url that will be used for the API call.
  /// [bodyData] will be used to set the body data for the [POST] method if any.
  /// [options] will be the [POST] request [Options] given by the [Dio] package.
  Future<BaseResponseModel> post(String apiKey,
      {String? apiUrl, dynamic bodyData, Options? options}) async {
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

  /// [get] method will be used to call [GET] method in all the methods which is making use of [GET] methods.
  /// [apiUrl] will be used to specify the particular url that will be used for the API call.
  /// [options] will be the [POST] request [Options] given by the [Dio] package.
  Future<BaseResponseModel> get(String apiKey,
      {String? apiUrl, dynamic bodyData, Options? options}) async {
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
