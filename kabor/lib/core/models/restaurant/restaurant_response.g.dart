// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantResponse _$RestaurantResponseFromJson(Map<String, dynamic> json) =>
    RestaurantResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      logo: json['logo'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      address: json['address'] as String?,
      zoneId: json['zone_id'] as int?,
      minimumOrder: (json['minimum_order'] as num?)?.toDouble(),
      currency: json['currency'] as String?,
      freeDelivery: json['free_delivery'] as bool?,
      coverPhoto: json['cover_photo'] as String?,
      delivery: json['delivery'] as bool?,
      takeAway: json['take_away'] as bool?,
      scheduleOrder: json['schedule_order'] as bool?,
      avgRating: (json['avg_rating'] as num?)?.toDouble(),
      tax: (json['tax'] as num?)?.toDouble(),
      ratingCount: json['rating_count'] as int?,
      selfDeliverySystem: json['self_delivery_system'] as int?,
      posSystem: json['pos_system'] as bool?,
      open: json['open'] as int?,
      active: json['active'] as bool?,
      deliveryTime: json['delivery_time'] as String?,
      categoryIds: (json['category_ids'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      veg: json['veg'] as int?,
      nonVeg: json['non_veg'] as int?,
      discount: json['discount'] == null
          ? null
          : Discount.fromJson(json['discount'] as Map<String, dynamic>),
      minimumShippingCharge:
          (json['minimum_shipping_charge'] as num?)?.toDouble(),
      perKmShippingCharge: (json['per_km_shipping_charge'] as num?)?.toDouble(),
      vendorId: json['vendor_id'] as int?,
    );

Map<String, dynamic> _$RestaurantResponseToJson(RestaurantResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'logo': instance.logo,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'address': instance.address,
      'zone_id': instance.zoneId,
      'minimum_order': instance.minimumOrder,
      'currency': instance.currency,
      'free_delivery': instance.freeDelivery,
      'cover_photo': instance.coverPhoto,
      'delivery': instance.delivery,
      'take_away': instance.takeAway,
      'schedule_order': instance.scheduleOrder,
      'avg_rating': instance.avgRating,
      'tax': instance.tax,
      'rating_count': instance.ratingCount,
      'self_delivery_system': instance.selfDeliverySystem,
      'pos_system': instance.posSystem,
      'open': instance.open,
      'active': instance.active,
      'delivery_time': instance.deliveryTime,
      'category_ids': instance.categoryIds,
      'veg': instance.veg,
      'non_veg': instance.nonVeg,
      'discount': instance.discount,
      'minimum_shipping_charge': instance.minimumShippingCharge,
      'per_km_shipping_charge': instance.perKmShippingCharge,
      'vendor_id': instance.vendorId,
    };
