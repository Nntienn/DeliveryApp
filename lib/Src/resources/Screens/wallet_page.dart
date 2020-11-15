
import 'package:delivery_app/Src/api_util/history.dart';
import 'package:delivery_app/Src/blocs/shared_preferences.dart';
import 'package:delivery_app/Src/configs/constants.dart';
import 'package:delivery_app/Src/models/Product.dart';
import 'package:delivery_app/Src/resources/Widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/Src/models/transaction.dart';
import 'package:http/http.dart';

class WalletPage extends StatelessWidget {

  SaveData save = new SaveData();
  HistoryApi api = new HistoryApi();
  List<Transaction> _list = List();

  Future<void> setListTransaction() async {
    _list = await getListTransaction();
  }

  Future<List<Transaction>> getListTransaction() async {
    String senderId = await save. getId();
    Response response = await api.getTransactionByID(senderId);
    List<Transaction> list  = await api.convertJsonToListTransaction(response);
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Text(
            "Lịch Sử Ví",
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold),
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
                itemBuilder: (context, index) => ItemCard(
                  product: products[index],
                  // press: () => Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => DetailsScreen(
                  //         product: products[index],
                  //       ),
                  //     )),
                )),
          ),
        ),
      ],
    );
  }
}
