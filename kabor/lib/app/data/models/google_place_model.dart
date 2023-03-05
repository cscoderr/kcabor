import 'package:equatable/equatable.dart';

class GooglePlaceModel extends Equatable {
  const GooglePlaceModel(
      {this.id, this.formattedAddress, this.address, this.lat, this.lng});

  final String? id;
  final String? formattedAddress;
  final String? address;
  final double? lat;
  final double? lng;

  GooglePlaceModel copyWith({
    String? id,
    String? formattedAddress,
    double? lat,
    String? address,
    double? lng,
  }) {
    return GooglePlaceModel(
      id: id ?? this.id,
      formattedAddress: formattedAddress ?? this.formattedAddress,
      lat: lat ?? this.lat,
      address: address ?? this.address,
      lng: lng ?? this.lng,
    );
  }

  @override
  List<Object?> get props => [id, address, formattedAddress, lat, lng];
}
