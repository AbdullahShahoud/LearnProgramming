import 'package:json_annotation/json_annotation.dart';

part 'otp_ruqest.g.dart';

@JsonSerializable()
class OtpRuqestLogin {
  int? otp_code;

  OtpRuqestLogin({
    required this.otp_code,
  });

  Map<String, dynamic> toJson() => _$OtpRuqestLoginToJson(this);
}
