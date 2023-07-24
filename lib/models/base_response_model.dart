/// [BaseResponseModel] acts as a base class to get response from Base API class made using dio.
/// [result] will hold the actual response received by the api call.
/// [success] will be true when API gives a successful respobnse i.e. 200 status code.
/// [message] will return the success or failure message as a response.

class BaseResponseModel {
  dynamic result;
  bool? success;
  String? message;

  BaseResponseModel(
      {required this.result, required this.success, required this.message});
}
