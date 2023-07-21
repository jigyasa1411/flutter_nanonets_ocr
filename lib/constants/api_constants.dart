
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_nanonets_ocr/models/base_response_model.dart';

import '../models/ocr_predictor_response_model.dart';

// class APIRoutes{
// static const String predictImageContentsUrl =
//     "https://app.nanonets.com/api/v2/OCR/Model/91346c34-4dba-4832-bc6a-816b02233b5a/LabelFile/";
// static const String drivingLicenseApiUrl =
//     "https://app.nanonets.com/api/v2/OCR/Model/7962b859-7f2c-4735-9ff3-54a7cc30cfbc/LabelFile/";

// static const String visaUAEApiUrl =
//     "https://app.nanonets.com/api/v2/OCR/Model/b4090e5a-c3ac-4627-ac04-7a9d30220501/LabelFile/";


// }

// const String privateVar = "bhbvjhbjmhbjm";


class APIBase{
  String username = "b1179314-e271-11ed-afa9-76ff1797c1e3";
    String password = "";
    final dio = Dio();
   
Future<BaseResponseModel> post({String? apiUrl, dynamic bodyData, dynamic responseClass, Options? options}) async{
     String basicAuth =
        'Basic ${base64.encode(utf8.encode('$username:$password'))}';

    dio.options.headers["Authorization"] = basicAuth;
   try{
     final apiResponse = await dio.post(
     apiUrl ?? "" ,
        data: bodyData, options: options);
    print(apiResponse);
    if (apiResponse.statusCode == 200) {
      print(apiResponse.data);
      var response = apiResponse.data;
      var jsonData = jsonDecode(jsonEncode(response));
     
      return  BaseResponseModel(result: jsonData, success: true, message: "Success");
     
    } else {
      print("Can't fetch user from the api.");
      return BaseResponseModel(result: null, success: false, message: "Success");
     
    }
   }

   catch(err){

    if(err is DioException){
return BaseResponseModel(result: null, success: false, message: err.response?.statusMessage);
    } else{
      return BaseResponseModel(result: null, success: false, message: "Something went wrong!");
    }
    
   }
  }

}