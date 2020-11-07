import 'dart:async';
import 'package:delivery_app/Src/validators/validations.dart';

class ValidationBloc {
  StreamController _nameController = new StreamController();
  StreamController _emailController = new StreamController();
  StreamController _phoneNumberController = new StreamController();

  Stream get nameStream => _nameController.stream;
  Stream get emailStream => _emailController.stream;
  Stream get phoneNumberStream => _phoneNumberController.stream;

  bool isValidLogIn(String phone) {
    if (!Validation.isValidPhone(phone)) {
      print('Vao roi');
      _phoneNumberController.sink.addError("Nhập số điện thoại");
      return false;
    }
    return true;
  }

  bool isValidRegister(String name, String email, String phone) {
    if (!Validation.isValidName(name)) {
      _nameController.sink.addError("Nhập họ tên đầy đủ");
      return false;
    }
    _nameController.sink.add("Ok");

    if (!Validation.isValidEmail(email)) {
      _emailController.sink.addError("Nhập email");
      return false;
    }
    _emailController.sink.add("Ok");

    if (!Validation.isValidPhone(phone)) {
      _phoneNumberController.sink.addError("Nhập số điện thoại");
      return false;
    }
    _phoneNumberController.sink.add("Ok");
    return true;
  }

  void dispose() {
    _phoneNumberController.close();
    _emailController.close();
    _nameController.close();
  }
}