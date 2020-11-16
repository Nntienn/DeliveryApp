import 'package:delivery_app/Src/blocs/shared_preferences.dart';
import 'package:delivery_app/Src/configs/constants.dart';
import 'package:delivery_app/Src/models/billing.dart';
import 'package:delivery_app/Src/models/checkout_model.dart';
import 'package:delivery_app/Src/resources/Screens/history_page.dart';
import 'package:delivery_app/Src/resources/Screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/Src/api_util/checkout.dart';
import 'package:http/http.dart' as http;

class CheckoutPage extends StatefulWidget {
  Billing bill;

  CheckoutPage({this.bill});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CheckoutState(bill);
  }
}

class CheckoutState extends State<CheckoutPage> {
  Billing bill;

  CheckoutState(this.bill);

  SaveData _save = new SaveData();

  CheckOutApi api = new CheckOutApi();

  Future<void> pushData() async {
    double amount = tinhtien(bill.distance);
    var date = new DateTime.now().toString();
    CheckOutModel checkoutModel = new CheckOutModel.n(
        "item",
        amount,
        date,
        bill.distance,
        receiverNameController.text,
        receiverPhoneController.text,
        bill.rAddress,
        bill.sAddress,
        "sending");
    String senderId = await _save.getId();
    http.Response response = await api.postTransactionDetail(checkoutModel);
    print(response.body);
    if (response.statusCode == 201) {
      await api.postTransaction(response, senderId);
    } else {
      _errAlert(context, "The system is in error");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HistoryPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Price',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sender',
                    style: TextStyle(fontSize: 17),
                  ),
                  Spacer(),
                  FutureBuilder(
                    future: _save.getName(),
                    builder: (BuildContext context,
                            AsyncSnapshot<String> snapshot) =>
                        Text(
                      snapshot.hasData ? snapshot.data : "Loading",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Address',
                    style: TextStyle(fontSize: 17),
                  ),
                  Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      bill.sAddress.toString(),
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Phone',
                    style: TextStyle(fontSize: 17),
                  ),
                  Spacer(),
                  FutureBuilder(
                    future: _save.getPhoneNum(),
                    builder: (BuildContext context,
                            AsyncSnapshot<String> snapshot) =>
                        Text(
                      snapshot.hasData ? snapshot.data : "Loading",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 1,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Receiver',
                    style: TextStyle(fontSize: 17),
                  ),
                  Spacer(),
                  Text(
                    receiverNameController.text,
                    style: TextStyle(fontSize: 17),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Address',
                    style: TextStyle(fontSize: 17),
                  ),
                  Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      bill.rAddress.toString(),
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Phone',
                    style: TextStyle(fontSize: 17),
                  ),
                  Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      receiverPhoneController.text,
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 1,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Distance',
                    style: TextStyle(fontSize: 17),
                  ),
                  Spacer(),
                  Text(
                    bill.distance.toString() + ' km',
                    style: TextStyle(fontSize: 17),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Price',
                    style: TextStyle(fontSize: 17),
                  ),
                  Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      tinhtien(bill.distance).toStringAsFixed(3),
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 1,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: RaisedButton(
                onPressed: pushData,
                child: Text(
                  "Log In",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                color: Color(0xff3277D8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _errAlert(BuildContext context, String err) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Failed login'),
          content: Text('$err'),
          actions: [
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  double tinhtien(double distance) {
    if (distance < 2) {
      return distance * 14.500;
    } else {
      return 29.000 + (distance - 2) * 5.500;
    }
  }
}
