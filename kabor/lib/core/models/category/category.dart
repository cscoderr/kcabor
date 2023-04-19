import 'package:json_annotation/json_annotation.dart';

part 'category.t.dart';

@JsonSerializable()
class Category {
  const Category({
    this.id,
    this.name,
    this.description,
    this.image,
    this.parentId,
    this.position,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.priority,
    this.type,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  final String? id;
  final String? name;
  final String? description;
  final String? image;
  final int? parentId;
  final int? position;
  final int? status;
  final String? createdAt;
  final String? updatedAt;
  final int? priority;
  final int? type;
}
