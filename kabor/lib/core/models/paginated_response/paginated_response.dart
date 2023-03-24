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

  PaginatedResponse<T> copyWith({
    T? data,
    int? offset,
    int? limit,
    int? totalSize,
  }) {
    return PaginatedResponse(
      data: data ?? this.data,
      offset: offset ?? this.offset,
      limit: limit ?? this.limit,
      totalSize: totalSize ?? this.totalSize,
    );
  }

  final int? totalSize;
  final int? limit;
  final int? offset;
  final T? data;
}
