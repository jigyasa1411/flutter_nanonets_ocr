// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
  Future<BaseResponseModel> post(String apiKey, BuildContext context,
      {String? apiUrl, dynamic bodyData, Options? options}) async {
    /// Processing Basic Auth according to apiKey passed.
    String basicAuth =
        'Basic ${base64.encode(utf8.encode('$apiKey:$password'))}';

    /// Passing the basic auth in the "Authorization" header of the Dio request.
    dio.options.headers["Authorization"] = basicAuth;
    try {
      // Calling Dio's post request by passing the apiUrl, bodyData and options received in parameter.
      final apiResponse =
          await dio.post(apiUrl ?? "", data: bodyData, options: options);

      if (apiResponse.statusCode == 200) {
        // Storing the api response in a variable "response" and then decoding it in Json format.
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
        /// Showing SnackBar when there is any API exception takes place.
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                  "${err.response?.statusMessage} [${err.response?.statusCode}]")));
        }

        /// Return a null constructor with respective error message and false success flag.
        return BaseResponseModel(
            result: null, success: false, message: err.response?.statusMessage);
      } else {
        /// Showing SnackBar when there is some other exception which is not related to API request.
        if (context.mounted) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Something went wrong!")));
        }

        /// Return a null constructor with respective error message and false success flag.
        return BaseResponseModel(
            result: null, success: false, message: "Something went wrong!");
      }
    }
  }

  /// [get] method will be used to call [GET] method in all the methods which is making use of [GET] methods.
  /// [apiUrl] will be used to specify the particular url that will be used for the API call.
  /// [options] will be the [GET] request [Options] given by the [Dio] package.
  Future<BaseResponseModel> get(String apiKey, BuildContext context,
      {String? apiUrl, dynamic bodyData, Options? options}) async {
    /// Processing Basic Auth according to apiKey passed.
    String basicAuth =
        'Basic ${base64.encode(utf8.encode('$apiKey:$password'))}';

    /// Passing the basic auth in the "Authorization" header of the Dio request.
    dio.options.headers["Authorization"] = basicAuth;
    try {
      // Calling Dio's get request by passing the apiUrl and options received in parameter.
      final apiResponse = await dio.get(apiUrl ?? "", options: options);

      if (apiResponse.statusCode == 200) {
        // Storing the api response in a variable "response" and then decoding it in Json format.
        var response = apiResponse.data;
        var jsonData = jsonDecode(jsonEncode(response));

        // Assigning relevant data in the constructor and returning the json type response value from here.
        return BaseResponseModel(
            result: jsonData, success: true, message: "Success");
      } else {
        return BaseResponseModel(
            result: null, success: false, message: "Success");
      }
    } catch (err) {
      if (err is DioException) {
        /// Showing SnackBar when there is any API exception takes place.
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                  "${err.response?.statusMessage} [${err.response?.statusCode}]")));
        }

        /// Return a null constructor with respective error message and false success flag.
        return BaseResponseModel(
            result: null, success: false, message: err.response?.statusMessage);
      } else {
        /// Showing SnackBar when there is some other exception which is not related to API request.
        if (context.mounted) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Something went wrong!")));
        }

        /// Return a null constructor with respective error message and false success flag.
        return BaseResponseModel(
            result: null, success: false, message: "Something went wrong!");
      }
    }
  }
}
