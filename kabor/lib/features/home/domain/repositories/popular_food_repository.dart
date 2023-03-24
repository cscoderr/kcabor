// ignore_for_file: one_member_abstracts

import 'package:kabor/core/core.dart';

abstract class PopularFoodRepository {
  Future<PaginatedResponse<List<ProductResponse>>> getPopularFood({
    int? offset,
    int? limit,
  });
}
