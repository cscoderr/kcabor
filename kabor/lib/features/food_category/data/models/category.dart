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
  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'] as int?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        image: json['image'] as String?,
        parentId: json['parent_id'] as int?,
        position: json['position'] as int?,
        status: json['status'] as int?,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
        priority: json['priority'] as int?,
        type: json['type'] as int?,
      );
  final int? id;
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
