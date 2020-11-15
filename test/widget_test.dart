// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import 'package:delivery_app/Src/api_util/history.dart';
import 'package:delivery_app/Src/api_util/register.dart';
import 'package:delivery_app/Src/configs/link.dart';
import 'package:delivery_app/Src/models/account.dart';
import 'package:delivery_app/Src/models/history_model.dart';
import 'package:delivery_app/Src/models/sender.dart';
import 'package:delivery_app/Src/models/transaction.dart';
import 'package:delivery_app/Src/models/transaction_detail.dart';
import 'package:http/http.dart';
import 'package:delivery_app/Src/api_util/register.dart';
import 'package:delivery_app/Src/blocs/shared_preferences.dart';

Future<void> main() async {
  HistoryApi api = new HistoryApi();
  Response response = await api.getTransactionBySenderID("SDRaecuzhotaety");
  List<Transaction> list = await api.convertJsonToListTransaction(response);
  List<Transaction> listTransactionTypeSending =
      await api.getListTransactionTypeSending(list);
  list.clear();
  List<History_Model> listHistoryModel = List();
  Response json;
  for (int i = 0; i < listTransactionTypeSending.length; i++) {
    Response json = await api.getTransactionDetailByID(
        listTransactionTypeSending[i].transactionDetailsId.toString());
    print(json.body);
    TransactionDetail transactionDetail =
        await api.convertJsonToTransactionDetail(json);
    print(transactionDetail.transactionDetailsId.toString() +
        transactionDetail.receiverAddress);
    listHistoryModel.add(new History_Model(
        listTransactionTypeSending[i].type,
        transactionDetail.senderAddress,
        transactionDetail.receiverAddress,
        transactionDetail.completedTime,
        transactionDetail.status,
        transactionDetail.amount));
  }
  print(listHistoryModel[0].type + listHistoryModel[0].senderAddress);
}
