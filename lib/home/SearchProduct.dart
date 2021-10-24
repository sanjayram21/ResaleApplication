import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resale_application/services/firebase.dart';
import '../model/item_model.dart';

class SearchProduct extends StatefulWidget {
  final ItemModel itemModel;
  SearchProduct({this.itemModel});

  @override
  _SearchProduct createState() => _SearchProduct();
}

class _SearchProduct extends State<SearchProduct> {
  int quantityOfItems = 1;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Details",
            style: TextStyle(fontSize: 55.0, color: Colors.white),
          ),
        ),
        body: ListView(
          children: [
            Container(
                padding: EdgeInsets.all(8.0),
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          color: Colors.grey[300],
                          child: SizedBox(
                            height: 1.0,
                            width: double.infinity,
                          ),
                        ),
                      ],
                    ), //to add img in children
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.itemModel.name,
                              style: boldTextStyle,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              widget.itemModel.description,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Price: ₹.' + widget.itemModel.price,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              widget.itemModel.contact,
                              style: boldTextStyle,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

const boldTextStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
const largeTextStyle = TextStyle(fontWeight: FontWeight.normal, fontSize: 20);
