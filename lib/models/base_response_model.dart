class BaseResponseModel{
  dynamic result;
  bool? success;
  String? message;

  BaseResponseModel({required this.result, required this.success, required this.message});

}