import 'package:kabor/core/models/paginated_response/paginated_response.dart';
import 'package:kabor/core/models/product/product_response.dart';
import 'package:kabor/core/models/restaurant/restaurant_response.dart';
import 'package:kabor/features/restaurant/data/remote/restaurant_api.dart';
import 'package:kabor/features/restaurant/domain/domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final restaurantRepositoryProvider = Provider<RestaurantRepository>((ref) {
  return RestaurantRepositoryImpl(
    restaurantApiClient: ref.watch(restaurantApiProvider),
  );
});

class RestaurantRepositoryImpl extends RestaurantRepository {
  RestaurantRepositoryImpl({
    required RestaurantApiClient restaurantApiClient,
  }) : _restaurantApiClient = restaurantApiClient;

  final RestaurantApiClient _restaurantApiClient;

  @override
  Future<RestaurantResponse> getRestaurantDetails(String restaurantId) async {
    return _restaurantApiClient.getRestaurantDetails(restaurantId);
  }

  @override
  Future<PaginatedResponse<List<ProductResponse>>> foodByCategory({
    required String categoryId,
    int? offset,
    int? limit,
  }) async {
    return _restaurantApiClient.foodByCategory(
      categoryId: categoryId,
      offset: offset,
      limit: limit,
    );
  }
}
