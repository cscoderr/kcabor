import 'package:equatable/equatable.dart';
import 'package:kabor/core/models/paginated_response/paginated_response.dart';
import 'package:kabor/core/models/product/product_response.dart';
import 'package:kabor/core/utils/usecases.dart';
import 'package:kabor/features/home/data/repository/popular_food_repository_impl.dart';
import 'package:kabor/features/home/domain/repositories/popular_food_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final getPopularFoodUsecaseProvider = Provider<GetPopularFoodUsecase>((ref) {
  return GetPopularFoodUsecase(ref.watch(popularFoodProvider));
});

class GetPopularFoodUsecase extends Usecases<
    PaginatedResponse<List<ProductResponse>>, GetPopularFoodParams> {
  GetPopularFoodUsecase(this.repository);

  final PopularFoodRepository repository;

  @override
  Future<PaginatedResponse<List<ProductResponse>>> call(
    GetPopularFoodParams params,
  ) async {
    return repository.getPopularFood(
      offset: params.offset,
      limit: params.limit,
    );
  }
}

class GetPopularFoodParams extends Equatable {
  const GetPopularFoodParams({
    this.offset,
    this.limit,
  });
  final int? offset;
  final int? limit;
  @override
  List<Object?> get props => [offset, limit];
}
