import 'package:delivery_app/Src/configs/constants.dart';
import 'package:flutter/material.dart';

class WithdrawPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WithdrawState();
  }

}

class WithdrawState extends State<WithdrawPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0.0,
        title: Text(
          "Delivery App",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x88999999),
                        offset: Offset(0, 5),
                        blurRadius: 5.0,
                      ),
                    ]),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Wallet Amount',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '700.000Vnđ',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ],
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
                          'Withdraw',
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
                            'Amount',
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
                          keyboardType: TextInputType.number,
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
      ),
    );
  }
}