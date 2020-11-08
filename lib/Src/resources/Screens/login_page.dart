import 'package:delivery_app/Src/blocs/login_bloc.dart';
import 'package:delivery_app/Src/blocs/validation_bloc.dart';
import 'package:delivery_app/Src/resources/Screens/otp_page.dart';
import 'package:delivery_app/Src/resources/Widgets/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'register_page.dart';

final phoneController = TextEditingController();

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final ValidationBloc _validationBloc = new ValidationBloc();
  final LoginBloc _loginBloc = new LoginBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // FlutterLogo(size: 150),
              Image.asset('assets/Logo.jpg'),
              SizedBox(height: 50),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: StreamBuilder(
                    stream: _validationBloc.phoneNumberStream,
                    builder: (context, snapshot) => TextField(
                      controller: _phoneNumberController,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      decoration: InputDecoration(
                          errorText: snapshot.hasError ? snapshot.error : null,
                          labelText: "Phone Number",
                          prefixIcon:
                              Container(width: 50, child: Icon(Icons.phone)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xffCED0D2), width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)))),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: RaisedButton(
                    onPressed: _onLoginClick,
                    child: Text(
                      "Log In",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    color: Color(0xff3277D8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                  ),
                ),
              ),
              _signInButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInButton() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        signInWithGoogle().then((result) {
          _onLoginWithGoogleClick(result.email);
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _onLoginWithGoogleClick(String email) async {
    Response response = await _loginBloc.getAccountJsonByEmail(email);
    if (response.statusCode == 200) {
      String checkRole = await _loginBloc.getAccountRole(response);
      if (checkRole.compareTo("success") == 0) {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OtpPage()));
      } else if (checkRole.compareTo("fail") == 0) {
        _validationBloc.setPhoneNumberControllerError("This phone number is registered in a different role.");
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RegisterPage()));
      }
    }
  }

  Future<void> _onLoginClick() async {
    if (_validationBloc.isValidLogIn(_phoneNumberController.text)) {
      Response response = await _loginBloc.getAccountJsonByPhone(_phoneNumberController.text);
      if (response.statusCode == 200) {
        String checkRole = await _loginBloc.getAccountRole(response);
        if (checkRole.compareTo("success") == 0) {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OtpPage()));
        } else if (checkRole.compareTo("fail") == 0) {
          _validationBloc.setPhoneNumberControllerError("This phone number is registered in a different role.");
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RegisterPage()));
        }
      }
    }
  }
}
