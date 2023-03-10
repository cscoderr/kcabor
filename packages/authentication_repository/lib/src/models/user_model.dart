// Generated by https://quicktype.io

import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UserModel {
  const UserModel({
    this.id,
    this.fName,
    this.lName,
    this.phone,
    this.email,
    this.image,
    this.isPhoneVerified,
    this.isEmailVerified,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.cmFirebaseToken,
    this.status,
    this.orderCount,
    this.loginMedium,
    this.socialId,
    this.zoneId,
    this.walletBalance,
    this.loyaltyPoint,
    this.refCode,
    this.accessToken,
    this.appleProviderId,
    this.facebookProviderId,
    this.googleProviderId,
    this.socialProviderName,
    this.active,
    this.earning,
    this.currentOrders,
    this.type,
    this.applicationStatus,
    this.assignedOrderCount,
    this.isServiceMen,
    this.serviceMenKyc,
    this.artisanServiceAvailable,
    this.registrationType,
    this.companyName,
    this.companyPhone,
    this.companyEmail,
    this.companyLogo,
    this.companyAddress,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  final int? id;
  final String? fName;
  final String? lName;
  final String? phone;
  final String? email;
  final String? image;
  final int? isPhoneVerified;
  final int? isEmailVerified;
  final String? emailVerifiedAt;
  final String? createdAt;
  final String? updatedAt;
  final String? cmFirebaseToken;
  final int? status;
  final int? orderCount;
  final dynamic loginMedium;
  final dynamic socialId;
  final dynamic zoneId;
  final int? walletBalance;
  final int? loyaltyPoint;
  final String? refCode;
  final String? accessToken;
  final String? appleProviderId;
  final String? facebookProviderId;
  final String? googleProviderId;
  final String? socialProviderName;
  final int? active;
  final int? earning;
  final int? currentOrders;
  final String? type;
  final String? applicationStatus;
  final int? assignedOrderCount;
  final int? isServiceMen;
  final int? serviceMenKyc;
  final int? artisanServiceAvailable;
  final String? registrationType;
  final String? companyName;
  final String? companyPhone;
  final String? companyEmail;
  final String? companyLogo;
  final String? companyAddress;
}
