import 'package:delivery_app/Src/blocs/shared_preferences.dart';
import 'package:delivery_app/Src/resources/Screens/main_page.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';


SaveData save = new SaveData();
String name = "";
String phoneNum = "";
String homeAddress = "";
String id = "";
String workAddress = "";
String walletId = "";

Future<void> getSender() async {
  name = await save.getName();
  phoneNum = await save.getPhoneNum();
  homeAddress = await save.getHomeAddress();
  workAddress = await save.getWorkAddress();
  id = await save.getId();
  walletId = await save.getWalletId();
}
class LoadingPage extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    getSender();
    return new SplashScreen(
      routeName: "/",
      title: new Text(
        'Welcome In SplashScreen',
        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      seconds: 8,
      navigateAfterSeconds: MainPage(),
      image: new Image.asset(
          'assets/loading.gif'),
      backgroundColor: Colors.black,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 150.0,
      onClick: () => print("Flutter Egypt"),
      loaderColor: Colors.white,
    );
  }
}
