import 'dart:convert';

import 'package:delivery_app/Src/models/transaction_detail.dart';
import 'package:http/http.dart' as http;
import 'package:delivery_app/Src/configs/link.dart';
import 'package:delivery_app/Src/models/transaction.dart';

class HistoryApi {
  Future<http.Response> getTransactionByID(String id) async {
    return await http.get(GET_TRANSACTION_BY_SENDERID + id);
  }

  Future<List<Transaction>> convertJsonToListTransaction(http.Response response) async {
    dynamic data = jsonDecode(response.body).cast<Map<String, dynamic>>();
    return data.map<Transaction>((json) => Transaction.fromJson(json)).toList();
  }

  Future<http.Response> getTransactionDetailByID(String id) async {
    return await http.get(GET_TRACSACTION_DETAIL_BY_ID + id);
  }

  Future<TransactionDetail> convertJsonToTransactionDetail(http.Response response) async {
    TransactionDetail transactionDetail = TransactionDetail.fromJson(jsonDecode(response.body));
    return transactionDetail;
  }
}