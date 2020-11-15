
import 'package:delivery_app/Src/configs/constants.dart';
import 'package:delivery_app/Src/models/Product.dart';
import 'package:delivery_app/Src/resources/Screens/addfund_page.dart';

import 'package:delivery_app/Src/resources/Widgets/wallet_history_card.dart';
import 'package:flutter/material.dart';


class WalletPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Text(
            "Wallet",
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
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
                        'Amount',
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
              Spacer(),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddfundPage()),
                      );
                    },
                    child: Icon(
                Icons.add_circle_outline,
                size: 50,
                color: Colors.greenAccent,
              ),
                  ))
            ],
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 5),
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
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
            // padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  // mainAxisSpacing: kDefaultPaddin,
                  crossAxisSpacing: kDefaultPaddin,
                  childAspectRatio: 4,
                ),
                itemBuilder: (context, index) => WalletCard(
                      product: products[index],
                      // press: () => Navigator.push(
                      //                       context,
                      //                       MaterialPageRoute(
                      //                         builder: (context) => WalletDetailPage(
                      //                           product: products[index],
                      //                         ),
                      //                       )),
                    )),
          ),
        ),
      ],
    );
  }
}
