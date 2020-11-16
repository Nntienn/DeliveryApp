
import 'package:delivery_app/Src/models/history_model.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final History_Model history;
  final Function press;

  const ItemCard({
    Key key,
    this.history,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(history.time);
    print('thuandeptrai');
    return GestureDetector(
      onTap: press,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.6,
                    child: Text('From:' + history.senderAddress, overflow: TextOverflow.ellipsis,)),
                Spacer(),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 22, 0),
                  child: Text(
                    history.price.toString() + 'Vnđ',//thay bằng số tiền
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),//đoạn này cộng chuỗi lấy điểm gửi
            Container(
                width: MediaQuery.of(context).size.width*0.8,
                child: Text('To:' + history.receiverAddress, overflow: TextOverflow.ellipsis,)),//đoạn này cộng chuỗi lấy điểm nhận
            Text('At: ' + history.time),//Đoạn này cộng chuỗi lấy thời gian gửi
            Row(
              children: [
                Text(history.status),
                Spacer(),
                Container(height: 18,
                  child: FlatButton(
                    child: Text('detail', textAlign: TextAlign.end,style: TextStyle(color: Colors.redAccent, fontSize: 13),),
                  ),
                )

              ],
            ),
            SizedBox(
              height: 14,
            ),
            const Divider(
              height: 1,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
