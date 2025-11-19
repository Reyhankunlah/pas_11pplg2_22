// To parse this JSON data, do
//
//     final registerApiModel = registerApiModelFromJson(jsonString);

import 'dart:convert';

RegisterApiModel registerApiModelFromJson(String str) =>
    RegisterApiModel.fromJson(json.decode(str));

String registerApiModelToJson(RegisterApiModel data) =>
    json.encode(data.toJson());

class RegisterApiModel {
  bool status;
  String message;

  RegisterApiModel({required this.status, required this.message});

  factory RegisterApiModel.fromJson(Map<String, dynamic> json) =>
      RegisterApiModel(status: json["status"], message: json["message"]);

  Map<String, dynamic> toJson() => {"status": status, "message": message};
}
