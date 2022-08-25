// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.id,
    this.roleId,
    this.name,
    this.phone,
    this.code,
  });

  int? id;
  int? roleId;
  String? name;
  String? phone;
  String? code;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        roleId: json["role_id"],
        name: json["name"],
        phone: json["phone"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "role_id": roleId,
        "name": name,
        "phone": phone,
        "code": code,
      };
}
