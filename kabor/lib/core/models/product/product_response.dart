import 'package:json_annotation/json_annotation.dart';
import 'package:kabor/core/models/category/category.dart';

part 'product_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ProductResponse {
  const ProductResponse({
    this.id,
    this.name,
    this.description,
    this.image,
    this.categoryId,
    this.categoryIds,
    this.variations,
    this.addOns,
    this.attributes,
    this.choiceOptions,
    this.price,
    this.tax,
    this.taxType,
    this.discount,
    this.discountType,
    this.availableTimeStarts,
    this.availableTimeEnds,
    this.veg,
    this.status,
    this.restaurantId,
    this.createdAt,
    this.updatedAt,
    this.orderCount,
    this.avgRating,
    this.ratingCount,
    this.restaurantName,
    this.restaurantDiscount,
    this.restaurantOpeningTime,
    this.restaurantClosingTime,
    this.scheduleOrder,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  final int? id;
  final String? name;
  final String? description;
  final String? image;
  final int? categoryId;
  final List<Category>? categoryIds;
  final List<dynamic>? variations;
  final List<dynamic>? addOns;
  final List<dynamic>? attributes;
  final List<dynamic>? choiceOptions;
  final num? price;
  final double? tax;
  final String? taxType;
  final int? discount;
  final String? discountType;
  final String? availableTimeStarts;
  final String? availableTimeEnds;
  final int? veg;
  final int? status;
  final int? restaurantId;
  final String? createdAt;
  final String? updatedAt;
  final int? orderCount;
  final int? avgRating;
  final int? ratingCount;
  final String? restaurantName;
  final int? restaurantDiscount;
  final String? restaurantOpeningTime;
  final String? restaurantClosingTime;
  final bool? scheduleOrder;
}
