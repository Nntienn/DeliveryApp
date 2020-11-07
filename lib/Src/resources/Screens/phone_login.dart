
import 'package:flutter/material.dart';

import 'login_page.dart';

class PhoneLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Container(
            margin: const EdgeInsets.fromLTRB(10, 50, 10, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Row(
                  children: [
                    Text('OTP', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                  ],
                ),
                Row(
                  children: [
                        Text('mã OTP vừa được gửi đến số điện thoại của bạn', style: TextStyle(fontSize: 15),),
                  ],
                ),
                Row(
                  children: [
                    Text(phoneController.text, style: TextStyle(fontSize: 15),),
                  ],
                )

              ],
            ),
          ),

      ),
    );
  }
}
