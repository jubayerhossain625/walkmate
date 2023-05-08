// To parse this JSON data, do
//
//     final targetDataModel = targetDataModelFromJson(jsonString);

import 'dart:convert';

TargetModel targetDataModelFromJson(String str) => TargetModel.fromJson(json.decode(str));

String targetDataModelToJson(TargetModel data) => json.encode(data.toJson());

class TargetModel {
  TargetModel({
    this.id,
    this.targetPoint,
    this.date,
    this.time,
  });

  String? id;
  String? targetPoint;
  String? date;
  String? time;

  factory TargetModel.fromJson(Map<String, dynamic> json) => TargetModel(
    id: json["id"],
    targetPoint: json["targetPoint"],
    date: json["date"],
    time: json["time"],
);

  Map<String, dynamic> toJson() => {
    "id": id.toString(),
    "targetPoint": targetPoint.toString(),
    "date": date,
    "time": time,
  };
}


