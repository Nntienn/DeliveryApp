
import 'package:delivery_app/Src/resources/Screens/login_page.dart';
import 'package:delivery_app/Src/resources/Screens/wallet_page.dart';
import 'package:delivery_app/Src/resources/Widgets/sign_in.dart';
import 'package:flutter/material.dart';

class HomeMenu extends StatefulWidget {
  @override
  _HomeMenuState createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: SweepGradient(
            colors: [
              Colors.pink,
              Colors.red,
              Colors.green,
              Colors.purple,
              Colors.teal
            ],
        ),
      ),
      child: ListView(
        children: <Widget>[
          Image.asset(
            'assets/avatar.webp',
            height: 100,
            width: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Nguyen Thai Binh', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('1.000.000 đ', style: TextStyle(fontSize: 20),),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          const Divider(
            height: 1,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          ListTile(
            // onTap: () {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => ProfileUI2()),
            //   );
            // },
            leading: Icon(
              Icons.account_circle,
              size: 30,
            ),
            title: Text(
              "Thông tin cá nhân",
              style: TextStyle(fontSize: 18, color: Color(0xff323643)),
            ),
          ),
          const Divider(
            height: 1,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          ListTile(
            leading: Icon(
              Icons.assignment,
              size: 30,
            ),
            title: Text(
              "Lịch sử",
              style: TextStyle(fontSize: 18, color: Color(0xff323643)),
            ),
          ),
          const Divider(
            height: 1,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          ListTile(
            onTap: (){
              Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WalletPage()),
                    );
            },
            leading: Icon(
              Icons.account_balance_wallet,
              size: 30,
            ),
            title: Text(
              "Ví",
              style: TextStyle(fontSize: 18, color: Color(0xff323643)),
            ),
          ),
          const Divider(
            height: 1,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          ListTile(
            onTap: () {
              signOutGoogle();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) {
                    return LoginPage();
                  }), ModalRoute.withName('/'));
            },
            leading: Icon(
              Icons.exit_to_app,
              size: 30,
            ),
            title: Text(
              "Đăng Xuất",
              style: TextStyle(fontSize: 18, color: Color(0xff323643)),
            ),
          )
        ],
      ),
    );
  }
}
