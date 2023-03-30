import 'package:kabor/core/core.dart';

abstract class HotDealsRepository {
  Future<PaginatedResponse<List<ProductResponse>>> getHotDeals({
    int? offset,
    int? limit,
  });
}
