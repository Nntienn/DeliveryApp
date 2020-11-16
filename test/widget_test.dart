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
import 'package:http/http.dart' as http;
import 'package:delivery_app/Src/models/checkout_model.dart';
import 'package:delivery_app/Src/api_util/checkout.dart';

Future<void> main() async {
  var date = new DateTime.now().toString();
  CheckOutApi api = new CheckOutApi();
  Map<String, String> headers = {"Content-type": "application/json"};
  CheckOutModel checkoutModel = new CheckOutModel.n("fish", 30, date, 2, "Thuan", "0999999999", "117 dong hung", "47B Vuon Lai Quan 12", "sending");
  http.Response response = await api.postTransactionDetail(checkoutModel);
  print(response.statusCode.toString() + "    " + response.body);
}
