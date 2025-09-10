import 'package:json_annotation/json_annotation.dart';

part 'send_qaustion_response.g.dart';

@JsonSerializable()
class SendQautionReesponse {
  String? message;

  SendQautionReesponse({this.message});

  factory SendQautionReesponse.fromJson(Map<String, dynamic> json) =>
      _$SendQautionReesponseFromJson(json);
}
