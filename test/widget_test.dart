// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.





import 'dart:convert';

import 'package:delivery_app/Src/api_util/register.dart';
import 'package:delivery_app/Src/configs/link.dart';
import 'package:delivery_app/Src/models/account.dart';
import 'package:delivery_app/Src/models/sender.dart';
import 'package:http/http.dart';

Future<void> main() async {
  Sender sender = new Sender.m("Nguuyen Thai Binh", "16 đường 106, Tăng Nhơn Phú A, quận 9, thành phố Hồ Chí Minh", "", "0854146162");
  RegisterApi api = new RegisterApi();
  Response response = await api.postSender(sender);
  print(response.body);
}
