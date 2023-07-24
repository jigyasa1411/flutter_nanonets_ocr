// To parse this JSON data, do
//
//     final getModelByIdResponseModel = getModelByIdResponseModelFromJson(jsonString);

import 'dart:convert';

GetModelByIdResponseModel getModelByIdResponseModelFromJson(String str) =>
    GetModelByIdResponseModel.fromJson(json.decode(str));

String getModelByIdResponseModelToJson(GetModelByIdResponseModel data) =>
    json.encode(data.toJson());

/// [GetModelByIdResponseModel] class will store the data when we call the API to get the model details by using it'd id.
/// This model will contain details like [modelId], [modelType], [state], [accuracy], [categories] etc. details about the
/// model of the given id.
class GetModelByIdResponseModel {
  /// [modelId] will be the id associated with the model.
  String? modelId;

  /// [modelType] represents the type of classification model, which in case of OCR, will be "ocr".
  String? modelType;

  /// [state] will represent the state of the model.
  int? state;

  /// [status] will tell about the current status of the model.
  String? status;

  /// [accuracy] represents the accuracy of the OCR model.
  double? accuracy;

  /// [List] of [Category] will give information about the categories/labels that are used in the given model.
  List<Category>? categories;

  /// [email] will return the email id of the account where the model is created.
  String? email;

  /// [isPublic] tells the accessibility of the model.
  bool? isPublic;

  /// [isPaid] tells about if the API is being created from a subcribed account or not.
  bool? isPaid;

  GetModelByIdResponseModel({
    this.modelId,
    this.modelType,
    this.state,
    this.status,
    this.accuracy,
    this.categories,
    this.email,
    this.isPublic,
    this.isPaid,
  });

  factory GetModelByIdResponseModel.fromJson(Map<String, dynamic> json) =>
      GetModelByIdResponseModel(
        modelId: json["model_id"],
        modelType: json["model_type"],
        state: json["state"],
        status: json["status"],
        accuracy: json["accuracy"].toDouble(),
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        email: json["email"],
        isPublic: json["is_public"],
        isPaid: json["is_paid"],
      );

  Map<String, dynamic> toJson() => {
        "model_id": modelId,
        "model_type": modelType,
        "state": state,
        "status": status,
        "accuracy": accuracy,
        "categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
        "email": email,
        "is_public": isPublic,
        "is_paid": isPaid,
      };
}

/// [Category] class will be used to store the details about the categories used while making the model.
/// Each category will contain [name], [count], [description] about the respective [Category].

class Category {
  /// [name] represnts the name of the respective category.
  String? name;

  /// [count] will keep the count of this particular category.
  int? count;

  /// [id] of the respective category.
  String? id;
  String? routing;
  bool? currentlyRenaming;

  /// [description] represents the decsription or value of the model, if any. ELse it will be empty.
  String? description;

  Category({
    this.name,
    this.count,
    this.id,
    this.routing,
    this.currentlyRenaming,
    this.description,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
        count: json["count"],
        id: json["id"],
        routing: json["routing"],
        currentlyRenaming: json["currently_renaming"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "count": count,
        "id": id,
        "routing": routing,
        "currently_renaming": currentlyRenaming,
        "description": description,
      };
}
