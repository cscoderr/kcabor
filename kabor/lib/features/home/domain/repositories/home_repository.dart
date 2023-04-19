import 'package:kabor/core/core.dart';

abstract class HomeRepository {
  Future<PaginatedResponse<List<ProductResponse>>> getHotDeals({
    int? offset,
    int? limit,
  });

  Future<PaginatedResponse<List<ProductResponse>>> getPopularFood({
    int? offset,
    int? limit,
  });
}
