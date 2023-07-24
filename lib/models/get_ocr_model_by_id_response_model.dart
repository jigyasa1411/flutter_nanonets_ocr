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
  String? modelId;
  String? modelType;
  int? state;
  String? status;
  double? accuracy;
  List<Category>? categories;
  String? email;
  bool? isPublic;

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
  String? name;
  int? count;
  String? id;
  String? routing;
  bool? currentlyRenaming;
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
