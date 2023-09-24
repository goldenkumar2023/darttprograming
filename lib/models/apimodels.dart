// To parse this JSON data, do
//
//     final pgModels = pgModelsFromJson(jsonString);

import 'dart:convert';

List<PgModels> pgModelsFromJson(String str) => List<PgModels>.from(json.decode(str).map((x) => PgModels.fromJson(x)));

String pgModelsToJson(List<PgModels> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PgModels {
  int userId;
  int id;
  String title;
  String body;

  PgModels({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PgModels.fromJson(Map<String, dynamic> json) => PgModels(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
