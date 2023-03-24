import 'package:equatable/equatable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/app/app.dart';
import 'package:kabor/core/core.dart';

final getZoneIdUsecaseProvider = Provider<GetZoneIdUsecase>((ref) {
  return GetZoneIdUsecase(ref.read(kaborRepositoryProvider));
});

class GetZoneIdUsecase extends Usecases<void, GetZoneIdParams> {
  GetZoneIdUsecase(this.repository);
  final KcaborRepository repository;
  @override
  Future<ZoneModel> call(GetZoneIdParams params) async {
    if (params.latitude == 0.0 && params.longitude == 0.0) {
      return ZoneModel();
    }
    return repository.getZoneId(
      latitude: params.latitude,
      longitude: params.longitude,
    );
  }
}

class GetZoneIdParams extends Equatable {
  const GetZoneIdParams({
    required this.latitude,
    required this.longitude,
  });
  final double latitude;
  final double longitude;

  @override
  List<Object?> get props => [
        latitude,
        longitude,
      ];
}
