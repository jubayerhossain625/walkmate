// To parse this JSON data, do
//
//     final targetDataModel = targetDataModelFromJson(jsonString);

import 'dart:convert';

TargetsDataModel targetDataModelFromJson(String str) => TargetsDataModel.fromJson(json.decode(str));

String targetDataModelToJson(TargetsDataModel data) => json.encode(data.toJson());

class TargetsDataModel {
  TargetsDataModel({
    this.id,
    this.targetPoint,
    this.date,
    this.time,
    this.cheekPoint,
  });

  String? id;
  String? targetPoint;
  String? date;
  String? time;
  List<CheekPoint>? cheekPoint;

  factory TargetsDataModel.fromJson(Map<String, dynamic> json) => TargetsDataModel(
    id: json["id"],
    targetPoint: json["targetPoint"],
    date: json["date"],
    time: json["time"],
    cheekPoint:  List<CheekPoint>.from(json["cheekPoint"].map((item) => item)),
  );

  Map<String, dynamic> toJson() => {
    "id": id.toString(),
    "targetPoint": targetPoint.toString(),
    "date": date,
    "time": time,
    "cheekPoint": cheekPoint!.map((item) => item),
  };
}

class CheekPoint {
  CheekPoint({
    this.id,
    this.point,
  });

  String? id;
  String? point;

  factory CheekPoint.fromJson(Map<String, dynamic> json) => CheekPoint(
    id: json["id"],
    point: json["pont"],
  );

  Map<String, dynamic> toJson() => {
    "id": id.toString(),
    "pont": point.toString(),
  };
}
