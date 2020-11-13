
import 'package:delivery_app/Src/blocs/register_bloc.dart';
import 'package:delivery_app/Src/resources/Widgets/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/Src/configs/constants.dart';
import 'login_page.dart';
import 'otp_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterBloc _registerBloc = new RegisterBloc();

  TextEditingController _nameController = new TextEditingController();

  TextEditingController _emailController = new TextEditingController();

  TextEditingController _phoneNumController = new TextEditingController();

  TextEditingController _homeAddressController = new TextEditingController();

  TextEditingController _officeAddressController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
          constraints: BoxConstraints.expand(),
          color: Colors.white,
          child: Column(
            children: <Widget>[
              AppBar(
                toolbarHeight: 70,
                backgroundColor: Colors.white,
                elevation: 0.0,
                title: Text(
                  'Register',
                  style: TextStyle(color: Colors.black),
                ),
                leading: FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    )),
              ),
              Container(
                height: 5,
                color: kPrimaryLightColor,
              ),
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                color: Colors.white,
                margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Column(
                  children: [
                    // Icon(Icons.account_circle),
                    Row(
                      children: [
                        Container(
                            margin: const EdgeInsets.fromLTRB(15, 22, 15, 0),
                            child: Icon(
                              Icons.account_circle,
                              color: kPrimaryColor,
                              size: 30,
                            )),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 22, 10, 0),
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.8,
                          child: StreamBuilder (
                            stream: _registerBloc.nameStream,
                            builder: (context, snapshot) => TextField(
                              controller: _nameController,
                              style: TextStyle(fontSize: 18, color: Colors.black),
                              decoration: InputDecoration(
                                errorText: snapshot.hasError ? snapshot.error : null,
                                labelText: "FULL NAME",
                                labelStyle: TextStyle(color: Colors.black),
                                border: InputBorder.none,
                              ),
                            ),
                          )
                        ),
                      ],
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                            margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                            child: Icon(
                              Icons.email,
                              color: kPrimaryColor,
                              size: 30,
                            )),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.8,
                          child: StreamBuilder(
                            stream: _registerBloc.emailStream,
                            builder: (context, snapshot) => TextField(
                              controller: _emailController,
                              style: TextStyle(fontSize: 18, color: Colors.black),
                              decoration: InputDecoration(
                                errorText: snapshot.hasError ? snapshot.error : null,
                                labelText: "EMAIL",
                                labelStyle: TextStyle(color: Colors.black),
                                border: InputBorder.none,
                              ),
                            ),
                          )
                        ),
                      ],
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                            margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                            child: Icon(
                              Icons.phone,
                              color: kPrimaryColor,
                              size: 30,
                            )),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.8,
                          child: StreamBuilder(
                            stream: _registerBloc.phoneNumStream,
                            builder: (context, snapshot) => TextField(
                              controller: _phoneNumController,
                              style: TextStyle(fontSize: 18, color: Colors.black),
                              decoration: InputDecoration(
                                errorText: snapshot.hasError ? snapshot.error : null,
                                hintText: phoneNumberController.text,
                                labelText: "PHONE",
                                labelStyle: TextStyle(color: Colors.black),
                                border: InputBorder.none,
                              ),
                            ),
                          )
                        ),
                      ],
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    Container(
                        margin:const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          'We will send verification code on above given number',
                          style: TextStyle(color: Colors.black26),)),
                    Row(
                      children: [
                        Container(
                            margin: const EdgeInsets.fromLTRB(15, 22, 15, 0),
                            child: Icon(
                              Icons.location_on,
                              color: kPrimaryColor,
                              size: 30,
                            )),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 22, 10, 0),
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.8,
                          child: StreamBuilder(
                            stream: _registerBloc.homeAddressStream,
                            builder: (context, snapshot) => TextField(
                              controller: _homeAddressController,
                              style: TextStyle(fontSize: 18, color: Colors.black),
                              decoration: InputDecoration(
                                labelText: "HOME ADDRESS",
                                errorText: snapshot.hasError ? snapshot.error : null,
                                labelStyle: TextStyle(color: Colors.black),
                                border: InputBorder.none,
                              ),
                            ),
                          )
                        ),
                      ],
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                            margin: const EdgeInsets.fromLTRB(15, 22, 15, 0),
                            child: Icon(
                              Icons.add_location,
                              color: kPrimaryColor,
                              size: 30,
                            )),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 22, 10, 0),
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.8,
                          child: TextField(
                            controller: _officeAddressController,
                            style: TextStyle(fontSize: 18, color: Colors.black),
                            decoration: InputDecoration(
                              labelText: "OFFICE ADDRESS",

                              labelStyle: TextStyle(color: Colors.black),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )
            ],
          )),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 60,
        child: Column(
          children: [
            Container(
              // padding: EdgeInsets.all(12),
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: FlatButton(
                onPressed: _onClickedContinue,
                color: kPrimaryColor,
                textColor: Colors.white,
                child: Text(
                  'Continue',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onClickedContinue() {
    String _phone;
    String _email;
    if (email.isEmpty || email == null) {
      _phone = phoneNumberController.text;
      _email = _emailController.text;
    } else {
      _phone = _phoneNumController.text;
      _email = email;
    }
    if (_registerBloc.isValidRegister(_nameController.text, _email, _phone, _homeAddressController.text, _officeAddressController.text)) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => OtpPage()));
    }
  }
}

