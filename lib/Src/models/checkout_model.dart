part 'checkout_model.g.dart';

class CheckOut_Model{
  String item;
  double amount;
  String useTime;
  String pickedTime;
  String completedTime;
  double distance;
  String receiverName;
  String receiverPhoneNum;
  String receiverAddress;
  String senderAddress;
  String status;
  String description;

  CheckOut_Model();
  CheckOut_Model.n(this.item, this.amount, this.useTime, this.distance, this.receiverName, this.receiverPhoneNum, this.receiverAddress, this.senderAddress, this.status);

  factory CheckOut_Model.fromJson(Map<String, dynamic> json) => _$CheckOutModelFromJson(json);
  Map<String, dynamic> toJson() => _$CheckOutModelToJson(this);
}