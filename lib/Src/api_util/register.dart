import 'dart:convert';

import 'package:delivery_app/Src/configs/link.dart';
import 'package:delivery_app/Src/models/account.dart';
import 'package:delivery_app/Src/models/sender.dart';
import 'package:http/http.dart';

class RegisterApi {
  Future<Response> postAccount(Account account) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = jsonEncode(account.toJson());
    Response response = await post(POST_ACCOUNT, headers: headers, body: json);
    return response;
  }

  Future<Response> postSender(Sender sender) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = jsonEncode(sender.toJson());
    Response response = await post(POST_SENDER, headers: headers, body: json);
    return response;
  }
}