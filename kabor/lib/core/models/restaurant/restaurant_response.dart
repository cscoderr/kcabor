import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kabor/core/core.dart';

part 'restaurant_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RestaurantResponse {
  RestaurantResponse({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.logo,
    this.latitude,
    this.longitude,
    this.address,
    this.zoneId,
    this.minimumOrder,
    this.currency,
    this.freeDelivery,
    this.coverPhoto,
    this.delivery,
    this.takeAway,
    this.scheduleOrder,
    this.avgRating,
    this.tax,
    this.ratingCount,
    this.selfDeliverySystem,
    this.posSystem,
    this.open,
    this.active,
    this.deliveryTime,
    this.categoryIds,
    this.veg,
    this.nonVeg,
    this.discount,
    // this.schedules,
    this.minimumShippingCharge,
    this.perKmShippingCharge,
    this.vendorId,
  });

  factory RestaurantResponse.fromJson(Map<String, dynamic> json) => _$RestaurantResponseFromJson(json);

  final int? id;
  final String? name;
  final String? phone;
  final String? email;
  final String? logo;
  final String? latitude;
  final String? longitude;
  final String? address;
  final int? zoneId;
  final double? minimumOrder;
  final String? currency;
  final bool? freeDelivery;
  final String? coverPhoto;
  final bool? delivery;
  final bool? takeAway;
  final bool? scheduleOrder;
  final double? avgRating;
  final double? tax;
  final int? ratingCount;
  final int? selfDeliverySystem;
  final bool? posSystem;
  final int? open;
  final bool? active;
  final String? deliveryTime;
  final List<int>? categoryIds;
  final int? veg;
  final int? nonVeg;
  final Discount? discount;
  // final List<Schedules> schedules;
  final double? minimumShippingCharge;
  final double? perKmShippingCharge;
  final int? vendorId;
}
