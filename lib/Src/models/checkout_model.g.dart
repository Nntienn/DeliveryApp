part of 'checkout_model.dart';

CheckOut_Model _$CheckOutModelFromJson(Map<String, dynamic> json) {
  return CheckOut_Model()
    ..item = json['item'] as String
    ..amount = json['amount'] as double
    ..useTime = json['useTime'] as String
    ..pickedTime = json['pickedTime'] as String
    ..completedTime = json['completedTime'] as String
    ..distance = json['distance'] as double
    ..receiverName = json['receiverName'] as String
    ..receiverPhoneNum = json['receiverPhoneNum'] as String
    ..receiverAddress = json['receiverAddress'] as String
    ..senderAddress = json['senderAddress'] as String
    ..status = json['status'] as String;
}

Map<String, dynamic> _$CheckOutModelToJson(CheckOut_Model instance) => <String, dynamic>{
  'item': instance.item,
  'amount': instance.amount,
  'useTime': instance.useTime,
  'pickedTime': instance.pickedTime,
  'completedTime': instance.completedTime,
  'distance': instance.distance,
  'receiverName': instance.receiverName,
  'receiverPhoneNum': instance.receiverPhoneNum,
  'receiverAddress': instance.receiverAddress,
  'senderAddress': instance.senderAddress,
  'status': instance.status,
};