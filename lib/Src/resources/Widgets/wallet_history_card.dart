
import 'package:delivery_app/Src/models/Product.dart';
import 'package:flutter/material.dart';

class WalletCard extends StatelessWidget {
  final Product product;
  final Function press;

  const WalletCard({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Text('Withdraw'),//thay bang loai giao dich
                Spacer(),
                Text(
                  'Amount',//thay bằng số tiền
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),//đoạn này cộng chuỗi lấy điểm gửi
            Text('At:'),//Đoạn này cộng chuỗi lấy thời gian gửi
            Row(
              children: [
                Text('Decription'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
