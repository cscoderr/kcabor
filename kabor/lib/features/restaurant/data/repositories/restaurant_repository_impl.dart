import 'package:kabor/core/models/restaurant/restaurant_response.dart';
import 'package:kabor/features/restaurant/domain/domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final restaurantRepositoryProvider = Provider<RestaurantRepository>((ref) {
  return RestaurantRepositoryImpl();
});

class RestaurantRepositoryImpl extends RestaurantRepository {
  RestaurantRepositoryImpl();

  @override
  Future<RestaurantResponse> getRestaurantDetails(String restaurantId) {
    // TODO: implement getRestaurantDetails
    throw UnimplementedError();
  }
}
