import 'dart:convert';

import 'package:delivery_app/Src/models/transaction_detail.dart';
import 'package:http/http.dart' as http;
import 'package:delivery_app/Src/configs/link.dart';
import 'package:delivery_app/Src/models/transaction.dart';

class HistoryApi {
  Future<http.Response> getTransactionBySenderID(String id) async {
    return http.get(GET_TRANSACTION_BY_SENDERID + id);
  }

  Future<List<Transaction>> convertJsonToListTransaction(http.Response response) async {
    dynamic data = jsonDecode(response.body).cast<Map<String, dynamic>>();
    return data.map<Transaction>((json) => Transaction.fromJson(json)).toList();
  }

  Future<List<Transaction>> getListTransactionTypeSending(List<Transaction> list) async {
    List<Transaction> listResult = List();
    for (int i = 0; i < list.length; i++) {
      if (list[0].type.compareTo("Sending") == 0 || list[0].type.compareTo("sending") == 0) {
        listResult.add(list[i]);
      }
    }
    print(listResult.length);
    return listResult;
  }

  Future<http.Response> getTransactionDetailByID(String id) async {
    return http.get(GET_TRANSACTION_DETAIL_BY_ID + id);
  }

  Future<TransactionDetail> convertJsonToTransactionDetail(http.Response response) async {
    TransactionDetail transactionDetail = TransactionDetail.fromJson(jsonDecode(response.body));
    return transactionDetail;
  }
}