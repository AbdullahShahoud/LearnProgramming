// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'singin_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SinginResponse _$SinginResponseFromJson(Map<String, dynamic> json) =>
    SinginResponse(
      account_type: json['account_type'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SinginResponseToJson(SinginResponse instance) =>
    <String, dynamic>{
      'user': instance.user,
      'account_type': instance.account_type,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num?)?.toInt(),
      email: json['email'] as String?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
    };
