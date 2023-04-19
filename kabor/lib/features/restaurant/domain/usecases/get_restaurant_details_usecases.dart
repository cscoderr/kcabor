import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/restaurant/data/data.dart';
import 'package:kabor/features/restaurant/domain/domain.dart';

final getRestaurantUsecasesProvider = Provider<GetRestaurantUsecases>((ref) {
  return GetRestaurantUsecases(ref.watch(restaurantRepositoryProvider));
});

class GetRestaurantUsecases extends Usecases<RestaurantResponse, String> {
  GetRestaurantUsecases(this.repository);
  final RestaurantRepository repository;
  @override
  Future<RestaurantResponse> call(String params) async {
    return repository.getRestaurantDetails(params);
  }
}
