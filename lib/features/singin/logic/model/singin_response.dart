import 'package:json_annotation/json_annotation.dart';

part 'singin_response.g.dart';

@JsonSerializable()
class SinginResponse {
  User? user;
  String? account_type;
  // String? token;
  SinginResponse({
    this.account_type,
    this.user,
    // this.token,
  });

  factory SinginResponse.fromJson(Map<String, dynamic> json) =>
      _$SinginResponseFromJson(json);
}

@JsonSerializable()
class User {
  int? id;
  String? email;
  String? username;
  User({
    this.id,
    this.email,
    this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
