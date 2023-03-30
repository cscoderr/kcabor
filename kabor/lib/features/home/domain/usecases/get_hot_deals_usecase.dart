import 'package:equatable/equatable.dart';
import 'package:kabor/core/models/paginated_response/paginated_response.dart';
import 'package:kabor/core/models/product/product_response.dart';
import 'package:kabor/core/utils/usecases.dart';
import 'package:kabor/features/home/data/repository/hot_deals_repository_impl.dart';
import 'package:kabor/features/home/domain/repositories/hot_deals_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final getHotDealsUsecaseProvider = Provider<GetHotDealsUsecase>((ref) {
  return GetHotDealsUsecase(ref.watch(hotDealsProvider));
});

class GetHotDealsUsecase extends Usecases<
    PaginatedResponse<List<ProductResponse>>, GetHotDealsParams> {
  GetHotDealsUsecase(this.repository);

  final HotDealsRepository repository;

  @override
  Future<PaginatedResponse<List<ProductResponse>>> call(
    GetHotDealsParams params,
  ) async {
    return repository.getHotDeals(
      offset: params.offset,
      limit: params.limit,
    );
  }
}

class GetHotDealsParams extends Equatable {
  const GetHotDealsParams({
    this.offset,
    this.limit,
  });
  final int? offset;
  final int? limit;
  @override
  List<Object?> get props => [offset, limit];
}
