import 'package:delivery_app/Src/configs/constants.dart';
import 'package:delivery_app/Src/models/Product.dart';
import 'package:flutter/material.dart';

class BookingDetailPage extends StatelessWidget {
  //thay cai product bang transaction detail
  Product product;

  BookingDetailPage({this.product});

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
                  'Details',
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
                    style: TextStyle( fontSize: 17),
                  ),
                  Spacer(),
                  Text(
                    'Hoang Nhat Thuan',
                    style: TextStyle( fontSize: 17),
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
                    style: TextStyle( fontSize: 17),
                  ),
                  Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width*0.5,
                    child: Text(
                      '47 Vườn lài quận 12dsdsdasdsadadsadasdsadasdadsdas',
                      textAlign: TextAlign.right,
                      style: TextStyle( fontSize: 17),
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
                    style: TextStyle( fontSize: 17),
                  ),
                  Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width*0.5,
                    child: Text(
                      '0961515949',
                      textAlign: TextAlign.right,
                      style: TextStyle( fontSize: 17),
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
                    'sent time',
                    style: TextStyle( fontSize: 17),
                  ),
                  Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width*0.5,
                    child: Text(
                      '12h15 27/2/2020',
                      textAlign: TextAlign.right,
                      style: TextStyle( fontSize: 17),
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
                    style: TextStyle( fontSize: 17),
                  ),
                  Spacer(),
                  Text(
                    'Hoang Nhat Thuan',
                    style: TextStyle( fontSize: 17),
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
                    style: TextStyle( fontSize: 17),
                  ),
                  Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width*0.5,
                    child: Text(
                      '47 Vườn lài quận 12dsdsdasdsadadsadasdsadasdadsdas',
                      textAlign: TextAlign.right,
                      style: TextStyle( fontSize: 17),
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
                    style: TextStyle( fontSize: 17),
                  ),
                  Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width*0.5,
                    child: Text(
                      '0961515949',
                      textAlign: TextAlign.right,
                      style: TextStyle( fontSize: 17),
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
                    'receive time',
                    style: TextStyle( fontSize: 17),
                  ),
                  Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width*0.5,
                    child: Text(
                      '12h15 27/2/2020',
                      textAlign: TextAlign.right,
                      style: TextStyle( fontSize: 17),
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
                    style: TextStyle( fontSize: 17),
                  ),
                  Spacer(),
                  Text(
                    '500 km',
                    style: TextStyle( fontSize: 17),
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
                    'Status',
                    style: TextStyle( fontSize: 17),
                  ),
                  Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width*0.5,
                    child: Text(
                      'Sending',
                      textAlign: TextAlign.right,
                      style: TextStyle( fontSize: 17),
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
                    'Decription',
                    style: TextStyle( fontSize: 17),
                  ),
                  Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width*0.5,
                    child: Text(
                      'Nguoi nhan la cai loai gi do khong giong con nguoi nua roi',
                      textAlign: TextAlign.right,
                      style: TextStyle( fontSize: 17),
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
                    'Price',
                    style: TextStyle( fontSize: 17),
                  ),
                  Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width*0.5,
                    child: Text(
                      '1.000.000 Vnđ',
                      textAlign: TextAlign.right,
                      style: TextStyle( fontSize: 17,color: Colors.redAccent,fontWeight: FontWeight.bold),
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
