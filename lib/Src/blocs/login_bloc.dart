
import 'dart:convert';

import 'package:delivery_app/Src/blocs/shared_preferences.dart';
import 'package:delivery_app/Src/configs/link.dart';
import 'package:delivery_app/Src/models/account.dart';
import 'package:delivery_app/Src/models/sender.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class LoginBloc{
  final codeController = new TextEditingController();
  SaveData save = new SaveData();


  Future<String> getAccountRole(Response response) async {
    final responseResult = response;
    if (responseResult.statusCode == 200) {
      Account account =  Account.fromJson(jsonDecode(responseResult.body));
      if (account.role.compareTo("sender") == 0) {
        save.saveAccount(account);
        return "success";
      } else {
        return "fail";
      }
    }
    return null;
  }

  Future<Sender> convertJsonToSender(Response response) async {
    Sender sender = Sender.fromJson(jsonDecode(response.body));
    return sender;
  }

  Future<http.Response> getSenderJsonByPhone(String phone) async {
    return http.get(GET_SENDER_BY_PHONE + phone);
  }

  Future<http.Response> getAccountJsonByEmail(String email) async {
    return http.get(GET_ACCOUNT_BY_EMAIL + email);
  }

  Future<http.Response> getAccountJsonByPhone(String phone) async {
    return http.get(GET_ACCOUNT_BY_PHONE + phone);
  }

}