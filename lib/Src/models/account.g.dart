// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) {
  return Account()
    ..phoneNum = json['phoneNum'] as String
    ..email = json['email'] as String
    ..role = json['role'] as String;
}

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'phoneNum': instance.phoneNum,
      'email': instance.email,
      'role': instance.role,
    };
