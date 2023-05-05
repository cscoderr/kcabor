import 'package:json_annotation/json_annotation.dart';

part 'wallet_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class WalletResponse {
  WalletResponse({
    this.userId,
    this.transactionId,
    this.credit,
    this.debit,
    this.adminBonus,
    this.balance,
    this.transactionType,
    this.createdAt,
    this.updatedAt,
  });

  int? userId;
  String? transactionId;
  double? credit;
  double? debit;
  double? adminBonus;
  double? balance;
  String? transactionType;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory WalletResponse.fromJson(Map<String, dynamic> json) =>
      _$WalletResponseFromJson(json);
}
