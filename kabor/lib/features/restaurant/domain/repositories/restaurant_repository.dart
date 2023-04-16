import 'package:kabor/core/core.dart';

abstract class RestaurantRepository {
  Future<RestaurantResponse> getRestaurantDetails(String restaurantId);
}
