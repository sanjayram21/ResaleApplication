//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:resale_application/services/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'datum.dart';
import '../services/auth.dart';
import '../main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../model/item_model.dart';

class HomeScreen extends StatefulWidget {
   List<Map<String, dynamic>> items;

   HomeScreen({required this.items});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int expandedCard = 0;

  @override
  Widget build(BuildContext context) {
    printPosts();
    return Scaffold(
      appBar: AppBar(title: Text("Search Product")),
      body:  ListView.builder(
                  itemCount: widget.items.length,
                  itemBuilder: (_, position) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                      child: Card(
                        child: InkWell(
                          onTap: () {
                            if(expandedCard != position) {
                              setState(() {
                                expandedCard = position;
                              });
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.items[position]['name'],
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context).textTheme.headline6,
                                    ),
                                    Icon(expandedCard == position
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down)
                                  ],
                                ),
                                expandedCard == position
                                    ? Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(widget.items[position]['description']),
                                          Text(widget.items[position]['price']),
                                          Text(widget.items[position]['contact']),
                                        ],
                                      )
                                    : SizedBox(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  })
            
          
          );
  }

  void display() {
    print('Home page reached');
  }

  printPosts() async {
    print(await firestoreServices.readAllPosts());
    print(await firestoreServices.readUserPost('users'));
  }
}

