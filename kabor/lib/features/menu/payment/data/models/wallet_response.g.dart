// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletResponse _$WalletResponseFromJson(Map<String, dynamic> json) =>
    WalletResponse(
      userId: json['user_id'] as int?,
      transactionId: json['transaction_id'] as String?,
      credit: (json['credit'] as num?)?.toDouble(),
      debit: (json['debit'] as num?)?.toDouble(),
      adminBonus: (json['admin_bonus'] as num?)?.toDouble(),
      balance: (json['balance'] as num?)?.toDouble(),
      transactionType: json['transaction_type'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$WalletResponseToJson(WalletResponse instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'transaction_id': instance.transactionId,
      'credit': instance.credit,
      'debit': instance.debit,
      'admin_bonus': instance.adminBonus,
      'balance': instance.balance,
      'transaction_type': instance.transactionType,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
