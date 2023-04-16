// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Discount _$DiscountFromJson(Map<String, dynamic> json) => Discount(
      id: json['id'] as int?,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      minPurchase: (json['min_purchase'] as num?)?.toDouble(),
      maxDiscount: (json['max_discount'] as num?)?.toDouble(),
      discount: (json['discount'] as num?)?.toDouble(),
      discountType: json['discount_type'] as String?,
      restaurantId: json['restaurant_id'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$DiscountToJson(Discount instance) => <String, dynamic>{
      'id': instance.id,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'min_purchase': instance.minPurchase,
      'max_discount': instance.maxDiscount,
      'discount': instance.discount,
      'discount_type': instance.discountType,
      'restaurant_id': instance.restaurantId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
