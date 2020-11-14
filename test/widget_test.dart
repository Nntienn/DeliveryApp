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
import 'package:delivery_app/Src/api_util/register.dart';
import 'package:delivery_app/Src/blocs/shared_preferences.dart';

Future<void> main() async {

    RegisterApi api = new RegisterApi();
    Response response = await api.getSenderByPhoneNum("01885582656");
    if (response.statusCode == 200) {
        Sender sender = await api.convertJsonToSender(response);
        double balance = await api.getBalance(sender.walletId);
        SaveData save = new SaveData();
        save.saveBalance(balance);
        print(await save.getBalance());
  }

}
