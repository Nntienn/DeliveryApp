
import 'dart:convert';

import 'package:delivery_app/Src/configs/link.dart';
import 'package:delivery_app/Src/models/account.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class LoginBloc{
  Future<String> getAccountRole(Response response) async {
    final responseResult = response;
    if (responseResult.statusCode == 200) {
      Account account =  Account.fromJson(jsonDecode(responseResult.body));
      print(account.role);
      if (account.role.compareTo("sender") == 0) {
        print('thanh cong roi ne ne');
        return "success";
      } else {
        print('fail roi ne ne');
        return "fail";
      }
    }
    return null;
  }

  Future<http.Response> getAccountJsonByEmail(String email) async {
    return http.get(GET_ACCOUNT_BY_EMAIL + email);
  }

  Future<http.Response> getAccountJsonByPhone(String phone) async {
    return http.get(GET_ACCOUNT_BY_PHONE + phone);
  }
}