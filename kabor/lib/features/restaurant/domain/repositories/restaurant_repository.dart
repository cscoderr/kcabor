import 'package:kabor/core/core.dart';

abstract class RestaurantRepository {
  Future<RestaurantResponse> getRestaurantDetails(String restaurantId);
  Future<PaginatedResponse<List<ProductResponse>>> foodByCategory({
    required String categoryId,
    int? offset,
    int? limit,
  });
}
