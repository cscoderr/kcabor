import 'package:json_annotation/json_annotation.dart';

part 'notification_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class NotificationResponse {
  factory NotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationResponseFromJson(json);
  NotificationResponse({
    this.id,
    this.data,
    this.createdAt,
    this.updatedAt,
  });
  int? id;
  Data? data;
  String? createdAt;
  String? updatedAt;
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Data {
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Data({
    this.title,
    this.description,
    this.image,
    this.type,
  });
  String? title;
  String? description;
  String? image;
  String? type;
}
