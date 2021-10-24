import 'package:cloud_firestore/cloud_firestore.dart';

class ItemModel {
  String name='';
  String description='';
  String price='';
  String contact='';

  ItemModel(
      {
        required this.name,
        required this.description,
        required this.price,
        required this.contact,
        }
        );

  ItemModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    price = json['price'];
    contact = json['contact'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['contact'] = this.contact;
    data['price'] = this.price;
    data['description'] = this.description;
    return data;
  }
}

