import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/restaurant/domain/usecases/get_restaurant_details_usecases.dart';

class GetProductDetails extends AsyncNotifier<RestaurantResponse> {
  GetProductDetails() : super();

  @override
  FutureOr<RestaurantResponse> build() async {
    return RestaurantResponse();
  }

  Future<void> getDetails(String productId) async {
    try {
      state = const AsyncValue.loading();
      final result = await ref.read(getRestaurantUsecasesProvider)(productId);
      state = AsyncValue.data(result);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}

final getProductDetailsProvider =
    AsyncNotifierProvider<GetProductDetails, RestaurantResponse>(
        GetProductDetails.new);
