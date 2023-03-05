import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'base_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseModel<T> extends Equatable {
  const BaseModel({
    this.status,
    this.message,
    this.data,
  });

  factory BaseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$BaseModelFromJson<T>(json, fromJsonT);

  final bool? status;
  final String? message;
  final T? data;

  @override
  List<Object?> get props => [status, message, data];
}
