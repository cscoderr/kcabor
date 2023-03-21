import 'package:json_annotation/json_annotation.dart';

part 'paginated_response.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  genericArgumentFactories: true,
)
class PaginatedResponse<T> {
  PaginatedResponse({
    this.data,
    this.offset,
    this.limit,
    this.totalSize,
  });

  factory PaginatedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$PaginatedResponseFromJson<T>(json, fromJsonT);

  final int? totalSize;
  final int? limit;
  final int? offset;
  final T? data;
}
