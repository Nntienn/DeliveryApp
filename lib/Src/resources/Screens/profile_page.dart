
import 'package:delivery_app/Src/blocs/shared_preferences.dart';
import 'package:delivery_app/Src/resources/Screens/login_page.dart';
import 'package:delivery_app/Src/resources/Widgets/sign_in.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProfileState();
  }
  
}

class ProfileState extends State<ProfilePage>{
  SaveData save = new SaveData();
  String _phone = "";
  String _address = "";
  String _wallet = "";
  String _officeAddress = "";

  Future<void> getData() async {
    _phone = await save.getPhoneNum();
    _address = await save.getHomeAddress();
    double balance = await save.getBalance();
    _wallet = balance.toString();
    _officeAddress = await save.getWorkAddress();
  }

  Widget _buildCoverImage(Size screenSize) {
    return Container(
      height: screenSize.height / 4,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/cover.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Center(
      child: Container(
        width: 150.0,
        height: 150.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/thuan.jpg'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(80.0),
          border: Border.all(
            color: Colors.white,
            width: 10.0,
          ),
        ),
      ),
    );
  }

  Widget _buildFullName() {
    TextStyle _nameTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 28.0,
      fontWeight: FontWeight.w700,
    );

    return Container(
      margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
      child: FutureBuilder(
        future: save.getName(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) => Text(
          snapshot.data,
          style: _nameTextStyle,
        ),
      ),
    );
  }

  Widget _buildStatItem(String label) {
    TextStyle _statLabelTextStyle = TextStyle(
      color: Colors.black54,
      fontSize: 17.0,
      fontWeight: FontWeight.bold,
    );
    return Container(
      width: MediaQuery.of(this.context).size.width*0.4,
      child:
        Text(
          label,
          style: _statLabelTextStyle,
        ),
    );
  }
  Widget _buildStatItem1(String label) {
    TextStyle _statLabelTextStyle = TextStyle(
      color: Colors.black54,
      fontSize: 17.0,
      fontWeight: FontWeight.bold,
    );
    return Container(
      width: MediaQuery.of(this.context).size.width*0.4,
      child:
      Text(
        label,
        style: _statLabelTextStyle,
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildStatContainer(String title,String data) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      height: 40.0,
      margin: EdgeInsets.only(top: 8.0),
      decoration: BoxDecoration(
        color: Color(0xFFEFF4F7),
      ),
      child: Row(
        children: <Widget>[
          _buildStatItem("$title"),
          Spacer(),
          _buildStatItem1("$data"),
        ],
      ),
    );
  }

  Widget _buildSeparator(Size screenSize) {
    return Container(
      width: screenSize.width / 1.6,
      height: 2.0,
      color: Colors.black54,
      margin: EdgeInsets.only(top: 4.0),
    );
  }

  Widget _buildButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: _onClickLogOut,
              child: Container(
                height: 40.0,
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: Color(0xFF404A5C),
                ),
                child: Center(
                  child: Text(
                    "Log Out",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // SizedBox(width: 10.0),
          // Expanded(
          //   child: InkWell(
          //     onTap: () => print("Message"),
          //     child: Container(
          //       height: 40.0,
          //       decoration: BoxDecoration(
          //         border: Border.all(),
          //       ),
          //       child: Center(
          //         child: Padding(
          //           padding: EdgeInsets.all(10.0),
          //           child: Text(
          //             "MESSAGE",
          //             style: TextStyle(fontWeight: FontWeight.w600),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildCoverImage(screenSize),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: screenSize.height / 6.3),
                  _buildProfileImage(),
                  _buildFullName(),
                  _buildStatContainer("Phone", "$_phone"),
                  _buildStatContainer("Address", "$_address"),
                  _buildStatContainer("Wallet", "$_wallet"),
                  _buildStatContainer("Office Address", "$_officeAddress"),
                  _buildSeparator(screenSize),
                  SizedBox(height: 10.0),
                  // _buildGetInTouch(context),
                  SizedBox(height: 8.0),
                  _buildButtons(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onClickLogOut() {
    save.logOut();
    try {
      googleSignIn.signOut();
    } catch(err) {
      print('$err');
    }
    Navigator.push(
        this.context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}