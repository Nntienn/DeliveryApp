
import 'package:json_annotation/json_annotation.dart';
part 'sender.g.dart';

@JsonSerializable()
class Sender {
  String id;
  String name;
  String homeAddress;
  String workAddress;
  String phoneNum;
  String walletId;

  Sender();

  factory Sender.fromJson(Map<String, dynamic> json) => _$SenderFromJson(json);
  Map<String, dynamic> toJson() => _$SenderToJson(this);
}