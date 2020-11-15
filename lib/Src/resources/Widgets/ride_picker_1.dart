
import 'package:delivery_app/Src/models/place_item_res.dart';
import 'package:delivery_app/Src/resources/Screens/ride_picker_page.dart';
import 'package:flutter/material.dart';

class RidePicker1 extends StatefulWidget {
  final Function(PlaceItemRes, bool) onSelected;
  RidePicker1(this.onSelected);
  @override
  _RidePickerState createState() => _RidePickerState();
}

class _RidePickerState extends State<RidePicker1> {
  PlaceItemRes fromAddress;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.all(Radius.circular(90)),
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 50,
            child: FlatButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RidePickerPage(
                        fromAddress == null ? "" : fromAddress.name,
                            (place, isFrom) {
                          widget.onSelected(place, isFrom);
                          fromAddress = place;
                          setState(() {});
                        }, true)));
              },
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  alignment: AlignmentDirectional.centerStart,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 40, right: 50),
                      child: Text(
                        fromAddress == null ? "Nhập địa chỉ" : fromAddress.name,
                        overflow: TextOverflow.ellipsis,
                        style:
                        TextStyle(fontSize: 16, color: Color(0xff323643)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
