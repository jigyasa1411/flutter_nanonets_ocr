/// [BaseResponseModel] acts as a base class to get response from Base API class made using dio.
library;

class BaseResponseModel {
  /// [result] will hold the actual response received by the api call.
  dynamic result;

  /// [success] will be true when API gives a successful respobnse i.e. 200 status code.
  bool? success;

  /// [message] will return the success or failure message as a response.
  String? message;

  BaseResponseModel(
      {required this.result, required this.success, required this.message});
}
