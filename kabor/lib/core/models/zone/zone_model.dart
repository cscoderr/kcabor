// Generated by https://quicktype.io

class ZoneModel {
  ZoneModel({
    this.id,
    this.status,
    this.minimumShippingCharge,
    this.perKmShippingCharge,
  });

  factory ZoneModel.fromJson(Map<String, dynamic> json) {
    return ZoneModel(
      id: json['id'] as int?,
      status: json['status'] as int?,
      minimumShippingCharge: json['minimum_shipping_charge'] as int?,
      perKmShippingCharge: json['per_km_shipping_charge'] as int?,
    );
  }
  final int? id;
  final int? status;
  final int? minimumShippingCharge;
  final int? perKmShippingCharge;
}