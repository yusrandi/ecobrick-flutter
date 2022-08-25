// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  HomeModel({
    this.labelA,
    this.dataxbenarA,
    this.dataxsalahA,
  });

  List<String>? labelA;
  List<int>? dataxbenarA;
  List<int>? dataxsalahA;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        labelA: List<String>.from(json["labelA"].map((x) => x)),
        dataxbenarA: List<int>.from(json["dataxbenarA"].map((x) => x)),
        dataxsalahA: List<int>.from(json["dataxsalahA"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "labelA": List<dynamic>.from(labelA!.map((x) => x)),
        "dataxbenarA": List<dynamic>.from(dataxbenarA!.map((x) => x)),
        "dataxsalahA": List<dynamic>.from(dataxsalahA!.map((x) => x)),
      };
}
