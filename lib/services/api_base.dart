import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../constants/api_constants.dart';
import '../models/ocr_predictor_response_model.dart';

class NanonetsOCR{

  String username = "b1179314-e271-11ed-afa9-76ff1797c1e3";
    String password = "";
   

  final dio = Dio();
  APIBase apiBase = APIBase();
  // Create OCR Model
  /// This function will be used to create an OCR model.
  Future createOCRModel(List<String> categories, String modelType) async{
     String basicAuth =
        'Basic ${base64.encode(utf8.encode('$username:$password'))}';

    dio.options.headers["Authorization"] = basicAuth;
    final productResponse = await dio.post(
       "https://app.nanonets.com/api/v2/OCR/Model/",
        data: {
          "categories": categories, "model_type": modelType
        });
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
  Future<ReceiptOcrPredictorResponseModel> predictReceipt(
      File? image, bool isPassport, bool isVisa, String modelId) async {
    // String username = "b1179314-e271-11ed-afa9-76ff1797c1e3";
    // String password = "";
    // String basicAuth =
    //     'Basic ${base64.encode(utf8.encode('$username:$password'))}';

    var formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(image!.path),
    });
    // dio.options.headers["Authorization"] = basicAuth;
    // final productResponse = await dio.post(
    //     "https://app.nanonets.com/api/v2/OCR/Model/$modelId/LabelFile/"
    //        ,
    //     data: formData);
    // print(productResponse);
    // if (productResponse.statusCode == 200) {
    //   print(productResponse.data);
    //   var response = productResponse.data;
    //   var jsonData = jsonDecode(jsonEncode(response));

      final predictReceiptData = await apiBase.post(apiUrl: "https://app.nanonets.com/api/v2/OCR/Model/$modelId/LabelFile/", bodyData: formData);

if(predictReceiptData.success == true){
      ReceiptOcrPredictorResponseModel responseModel =
          ReceiptOcrPredictorResponseModel.fromJson(predictReceiptData.result);
      return responseModel;
    } else {
      print("Can't fetch user from the api.");
      return ReceiptOcrPredictorResponseModel(
          message: "", result: [], signedUrls: Map());
    }
  }

}