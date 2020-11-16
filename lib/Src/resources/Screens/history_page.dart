import 'package:delivery_app/Src/configs/constants.dart';
import 'package:delivery_app/Src/resources/Widgets/delivery_history_card.dart';
import 'package:delivery_app/Src/models/transaction.dart';
import 'package:delivery_app/Src/api_util/history.dart';
import 'package:delivery_app/Src/blocs/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/Src/models/transaction_detail.dart';
import 'package:delivery_app/Src/models/history_model.dart';
import 'package:http/http.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  SaveData save = new SaveData();

  HistoryApi api = new HistoryApi();

  Future<List<History_Model>> getListTransaction() async {
    String senderId = await save.getId();
    print(senderId);
    Response response = await api.getTransactionBySenderID(senderId);
    List<Transaction> list = await api.convertJsonToListTransaction(response);
    List<Transaction> listTransactionTypeSending =
    await api.getListTransactionTypeSending(list);
    list.clear();
    List<History_Model> listHistoryModel = List();
    for (int i = 0; i < listTransactionTypeSending.length; i++) {
      Response json = await api.getTransactionDetailByID(
          listTransactionTypeSending[i].transactionDetailsId.toString());
      print(json.body);
      TransactionDetail transactionDetail =
      await api.convertJsonToTransactionDetail(json);
      print(transactionDetail.transactionDetailsId.toString() +
          transactionDetail.receiverAddress);
      listHistoryModel.add(new History_Model(
          listTransactionTypeSending[i].type,
          transactionDetail.senderAddress,
          transactionDetail.receiverAddress,
          transactionDetail.useTime,
          transactionDetail.status,
          transactionDetail.amount));
    }
    listTransactionTypeSending.clear();
    return listHistoryModel;
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
            "Booking History",
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
            child: FutureBuilder<List<History_Model>>(
              future: getListTransaction(),
              initialData: [],
              builder: (BuildContext context,
                      AsyncSnapshot<List<History_Model>> snapshot) =>
                  GridView.builder(
                itemCount: (snapshot.data != null) ? snapshot.data.length : 0,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  // mainAxisSpacing: kDefaultPaddin,
                  crossAxisSpacing: kDefaultPaddin,
                  childAspectRatio: 4,
                ),
                itemBuilder: (context, index) => ItemCard(
                  history: snapshot.data[index],
                  // press: () => Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => BookingDetailPage(
                  //         history: snapshot.data[index],
                  //       ),
                  //     )),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
