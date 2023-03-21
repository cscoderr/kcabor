// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) =>
    ProductResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      categoryId: json['category_id'] as int?,
      categoryIds: (json['category_ids'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      variations: json['variations'] as List<dynamic>?,
      addOns: json['add_ons'] as List<dynamic>?,
      attributes: json['attributes'] as List<dynamic>?,
      choiceOptions: json['choice_options'] as List<dynamic>?,
      price: json['price'] as int?,
      tax: (json['tax'] as num?)?.toDouble(),
      taxType: json['tax_type'] as String?,
      discount: json['discount'] as int?,
      discountType: json['discount_type'] as String?,
      availableTimeStarts: json['available_time_starts'] as String?,
      availableTimeEnds: json['available_time_ends'] as String?,
      veg: json['veg'] as int?,
      status: json['status'] as int?,
      restaurantId: json['restaurant_id'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      orderCount: json['order_count'] as int?,
      avgRating: json['avg_rating'] as int?,
      ratingCount: json['rating_count'] as int?,
      restaurantName: json['restaurant_name'] as String?,
      restaurantDiscount: json['restaurant_discount'] as int?,
      restaurantOpeningTime: json['restaurant_opening_time'] as String?,
      restaurantClosingTime: json['restaurant_closing_time'] as String?,
      scheduleOrder: json['schedule_order'] as bool?,
    );

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'category_id': instance.categoryId,
      'category_ids': instance.categoryIds,
      'variations': instance.variations,
      'add_ons': instance.addOns,
      'attributes': instance.attributes,
      'choice_options': instance.choiceOptions,
      'price': instance.price,
      'tax': instance.tax,
      'tax_type': instance.taxType,
      'discount': instance.discount,
      'discount_type': instance.discountType,
      'available_time_starts': instance.availableTimeStarts,
      'available_time_ends': instance.availableTimeEnds,
      'veg': instance.veg,
      'status': instance.status,
      'restaurant_id': instance.restaurantId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'order_count': instance.orderCount,
      'avg_rating': instance.avgRating,
      'rating_count': instance.ratingCount,
      'restaurant_name': instance.restaurantName,
      'restaurant_discount': instance.restaurantDiscount,
      'restaurant_opening_time': instance.restaurantOpeningTime,
      'restaurant_closing_time': instance.restaurantClosingTime,
      'schedule_order': instance.scheduleOrder,
    };
