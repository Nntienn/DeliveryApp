import 'package:custom_radio_grouped_button/CustomButtons/CustomRadioButton.dart';
import 'package:delivery_app/Src/blocs/home_bloc.dart';
import 'package:delivery_app/Src/configs/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'Loading.dart';




class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomeState();
  }

}
class _MyHomeState extends State<HomePage>{
  HomeBloc _homeBloc = new HomeBloc();
  String address;
  TextEditingController addressController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // initState(
    //     getSender();
    // );

    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Color(0x88999999),
                  offset: Offset(0, 5),
                  blurRadius: 5.0,
                ),
              ]),
              margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: Text(
                        'Người gửi',
                        style: TextStyle(
                            color: Colors.black38,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                          child: Text(
                            name,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: Text(
                            '|',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: Text(
                            phoneNum,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: StreamBuilder(
                        stream: _homeBloc.addressStream,
                        builder: (context, snapshot) => TextField(
                          cursorColor: Colors.black26,
                          style: TextStyle(fontSize: 15),
                          controller: addressController,
                          decoration: InputDecoration(
                            hintText: snapshot.hasData ? snapshot.data : "Enter address",
                            contentPadding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                            // enabledBorder: UnderlineInputBorder(
                            //   borderSide: BorderSide(color: Colors.black26),
                            // ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black26),
                              borderRadius:
                              BorderRadius.all(Radius.circular(20.0)),
                            ),
                            border: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderRadius:
                              BorderRadius.all(Radius.circular(20.0)),
                              borderSide: BorderSide(color: Colors.white24),
                              //borderSide: const BorderSide(),
                            ),
                          ),
                        ),
                      )),
                  Container(
                    margin: const EdgeInsets.fromLTRB(5, 10, 0, 10),
                    child: CustomRadioButton(
                      // horizontal: true,
                      enableShape: true,
                      elevation: 0,
                      unSelectedColor: Theme.of(context).canvasColor,
                      buttonLables: [
                        'Nhà',
                        'Cơ quan',
                        'Nơi khác',
                      ],
                      buttonValues: [
                        1,
                        2,
                        3,
                      ],
                      defaultSelected: 1,
                      radioButtonValue: (value) {
                        if (value == 1) {
                          if (homeAddress == null || homeAddress.isEmpty) {
                            _homeBloc.setAddress("Enter address");
                            address = "1";
                          } else {
                            _homeBloc.setAddress(homeAddress);
                            address = "0";
                          }
                        } else if (value == 2) {
                          if (workAddress == null || workAddress.isEmpty) {
                            _homeBloc.setAddress("Enter address");
                            address = "2";
                          } else{
                            _homeBloc.setAddress(workAddress);
                            address = "0";
                          }
                        } else if (value == 3) {
                          _homeBloc.setAddress("Enter address");
                          address = "3";
                        }
                      },
                      // cai nay de add action
                      selectedColor: Theme.of(context).accentColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white,
                  // borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x88999999),
                      offset: Offset(0, 5),
                      blurRadius: 5.0,
                    ),
                  ]),
              margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: Text(
                        'Thông tin người nhận',
                        style: TextStyle(
                            color: Colors.black38,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Text(
                          'Họ và tên',
                          style: TextStyle(color: Colors.black38, fontSize: 17),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                  Container(
                      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: TextField(
                        cursorColor: Colors.black26,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                          // enabledBorder: UnderlineInputBorder(
                          //   borderSide: BorderSide(color: Colors.black26),
                          // ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26),
                            borderRadius:
                            BorderRadius.all(Radius.circular(90.0)),
                          ),
                          border: OutlineInputBorder(
                            // width: 0.0 produces a thin "hairline" border
                            borderRadius:
                            BorderRadius.all(Radius.circular(90.0)),
                            borderSide: BorderSide(color: Colors.white24),
                            //borderSide: const BorderSide(),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Text(
                          'Địa chỉ',
                          style: TextStyle(color: Colors.black38, fontSize: 17),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                  Container(
                      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: TextField(
                        cursorColor: Colors.black26,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                          // enabledBorder: UnderlineInputBorder(
                          //   borderSide: BorderSide(color: Colors.black26),
                          // ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26),
                            borderRadius:
                            BorderRadius.all(Radius.circular(90.0)),
                          ),
                          border: OutlineInputBorder(
                            // width: 0.0 produces a thin "hairline" border
                            borderRadius:
                            BorderRadius.all(Radius.circular(90.0)),
                            borderSide: BorderSide(color: Colors.white24),
                            //borderSide: const BorderSide(),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Text(
                          'Số điện thoại',
                          style: TextStyle(color: Colors.black38, fontSize: 17),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                  Container(
                      margin: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 17),
                        textAlign: TextAlign.center,
                        cursorColor: Colors.black26,
                        cursorRadius: Radius.circular(5.0),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                          // enabledBorder: UnderlineInputBorder(
                          //   borderSide: BorderSide(color: Colors.black26),
                          // ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26),
                            borderRadius:
                            BorderRadius.all(Radius.circular(90.0)),
                          ),
                          border: OutlineInputBorder(
                            // width: 0.0 produces a thin "hairline" border
                            borderRadius:
                            BorderRadius.all(Radius.circular(90.0)),
                            borderSide: BorderSide(color: Colors.white24),
                            //borderSide: const BorderSide(),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Text(
                          'Thu hộ/ COD',
                          style: TextStyle(color: Colors.black38, fontSize: 17),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(
                        child: Text(
                          '*(tùy chọn)',
                          style: TextStyle(color: Colors.black38, fontSize: 13),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                  Container(
                      margin: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 17),
                        textAlign: TextAlign.center,
                        cursorColor: Colors.black26,
                        cursorRadius: Radius.circular(5.0),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                          // enabledBorder: UnderlineInputBorder(
                          //   borderSide: BorderSide(color: Colors.black26),
                          // ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26),
                            borderRadius:
                            BorderRadius.all(Radius.circular(90.0)),
                          ),
                          border: OutlineInputBorder(
                            // width: 0.0 produces a thin "hairline" border
                            borderRadius:
                            BorderRadius.all(Radius.circular(90.0)),
                            borderSide: BorderSide(color: Colors.white24),
                            //borderSide: const BorderSide(),
                          ),
                        ),
                      )),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Color(0x88999999),
                  offset: Offset(0, 5),
                  blurRadius: 5.0,
                ),
              ]),
              margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
              height: 60,
              child: Column(
                children: [
                  Container(
                    color: kPrimaryColor,
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: FlatButton(
                      onPressed: () {
                        if(name.length != 0) {
                          print(name);
                        }else{
                          print('null');
                        }
                      },
                      // => Navigator.push(
                      //     context, MaterialPageRoute(builder: (context) => ())),
                      color: kPrimaryColor,
                      child: Text(
                        'Continue',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}