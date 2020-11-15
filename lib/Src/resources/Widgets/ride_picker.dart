
import 'package:delivery_app/Src/models/place_item_res.dart';
import 'package:delivery_app/Src/resources/Screens/ride_picker_page.dart';
import 'package:flutter/material.dart';

class RidePicker extends StatefulWidget {
  final Function(PlaceItemRes, bool) onSelected;
  RidePicker(this.onSelected);

  @override
  _RidePickerState createState() => _RidePickerState();
}

class _RidePickerState extends State<RidePicker> {
  PlaceItemRes toAddress;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black26),
          borderRadius: BorderRadius.all(Radius.circular(90)),
          ),
      child: FlatButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  RidePickerPage(toAddress == null ? "" : toAddress.name,
                      (place, isFrom) {
                    widget.onSelected(place, isFrom);
                    toAddress = place;
                    setState(() {});
                  }, false)));
        },
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            alignment: AlignmentDirectional.centerStart,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10, right: 50),
                child: Text(
                  toAddress == null ? "Nhập địa chỉ" : toAddress.address,
                  overflow: TextOverflow.ellipsis,
                  style:
                      TextStyle(fontSize: 13,),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
