import 'package:freezed_annotation/freezed_annotation.dart';

part 'discount.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Discount {
  Discount({
    this.id,
    this.startDate,
    this.endDate,
    this.startTime,
    this.endTime,
    this.minPurchase,
    this.maxDiscount,
    this.discount,
    this.discountType,
    this.restaurantId,
    this.createdAt,
    this.updatedAt,
  });

  factory Discount.fromJson(Map<String, dynamic> json) =>
      _$DiscountFromJson(json);

  final int? id;
  final String? startDate;
  final String? endDate;
  final String? startTime;
  final String? endTime;
  final double? minPurchase;
  final double? maxDiscount;
  final double? discount;
  final String? discountType;
  final int? restaurantId;
  final String? createdAt;
  final String? updatedAt;
}
