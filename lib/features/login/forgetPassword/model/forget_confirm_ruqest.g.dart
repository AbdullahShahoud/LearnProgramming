// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_confirm_ruqest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgatePasswordConfirmRquest _$ForgatePasswordConfirmRquestFromJson(
        Map<String, dynamic> json) =>
    ForgatePasswordConfirmRquest(
      token: (json['token'] as num?)?.toInt(),
      password: (json['password'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ForgatePasswordConfirmRquestToJson(
        ForgatePasswordConfirmRquest instance) =>
    <String, dynamic>{
      'token': instance.token,
      'password': instance.password,
    };
