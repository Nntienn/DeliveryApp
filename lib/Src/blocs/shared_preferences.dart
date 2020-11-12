import 'package:delivery_app/Src/models/account.dart';
import 'package:delivery_app/Src/models/sender.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveData {
  Future<void> saveAccount(Account account) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('phoneNum', account.phoneNum);
    sp.setString('email', account.email);
  }

  Future<void> saveSender(Sender sender) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('id', sender.id);
    sp.setString('name', sender.name);
    sp.setString('homeAddress', sender.homeAddress);
    sp.setString('workAddress', sender.workAddress );
    sp.setString('walletId', sender.walletId);
  }

  Future<String> getWalletId() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString('walletId');
  }

  Future<String> getWorkAddress() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString('workAddress');
  }

  Future<String> getHomeAddress() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString('homeAddress');
  }

  Future<String> getName() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString('name');
  }

  Future<String> getId() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString('id');
  }

  Future<String> getPhoneNum() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString('phoneNum');
  }

  Future<String> getEmail() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString('email');
  }
}