import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:delivery_app/Src/models/checkout_model.dart';
import 'package:delivery_app/Src/configs/link.dart';
import 'package:delivery_app/Src/models/transaction_detail.dart';
import 'package:delivery_app/Src/models/transaction.dart';

class CheckOutApi{
  Future<http.Response> postTransactionDetail(CheckOutModel model) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = jsonEncode(model.toJson());
    print(json);
    http.Response response = await http.post(POST_TRANSACTION_DETAIL, headers: headers, body: json);
    print(response.statusCode);
    return response;
  }

  Future<void> postTransaction(http.Response response, String senderId) async {
    TransactionDetail transactionDetail = TransactionDetail.fromJson(jsonDecode(response.body));
    Transaction transaction = new Transaction.n(transactionDetail.transactionDetailsId, senderId, "sending");
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = jsonEncode(transaction.toJson());
    await http.post(POST_TRANSACTION, headers: headers, body: json);
  }
}