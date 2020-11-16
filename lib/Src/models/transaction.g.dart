part of 'transaction.dart';

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return Transaction()
    ..transactionId = json['transactionId'] as int
    ..transactionDetailsId = json['transactionDetailsId'] as int
    ..senderId = json['senderId'] as String
    ..shipperId = json['shipperId'] as String
    ..type = json['type'] as String;
}

Map<String, dynamic> _$TransactionToJson(Transaction instance) => <String, dynamic>{
  'transactionDetailsId': instance.transactionDetailsId,
  'senderId': instance.senderId,
  'type': instance.type,
};