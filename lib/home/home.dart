//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:resale_application/services/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'datum.dart';
import '../services/auth.dart';
import '../main.dart';
import 'SearchProduct.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../model/item_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final db = FirebaseFirestore.instance;
  Map<int, bool> countToValue = <int, bool>{};

//initial homescreen
/*
  @override
  Widget build(BuildContext context) {
    printPosts();
    return Scaffold(
      appBar: AppBar(title: Text("Search Product"), actions: <Widget>[
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            })
      ]),
      body: FutureBuilder(
          future: firestoreServices.readAllPosts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final data = snapshot.data as List<Map<String, dynamic>>;
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (_, position) {
                    return Text(data[position]['name']);
                  });
            } else {
              return Container();
            }
          }),
      // body: Stack(
      //   children: <Widget>[
      //     Container(
      //       decoration: BoxDecoration(
      //         image: DecorationImage(
      //             image: AssetImage('assets/bg3.png'), fit: BoxFit.fill),
      //       ),
      //     ),
      //     /*Positioned(
      //       left: 0,
      //       right: 0,
      //       bottom: 0,
      //       child: Container(
      //         padding: const EdgeInsets.fromLTRB(16, 6, 16, 60),
      //         decoration: BoxDecoration(
      //           color: Colors.white,
      //           borderRadius: BorderRadius.only(
      //             topLeft: Radius.circular(9),
      //             topRight: Radius.circular(9),
      //           ),
      //         ),
      //       ),
      //     )*/
      //   ],
      // ),
      // /*
      // floatingActionButton: hbutton(
      //   onPressed: AdUploadPage,
      // ),*/
    );
  }

  void display() {
    print('Home page reached');
  }
}
*/
//listview1
/*  @override
  Widget build(BuildContext context) {
    printPosts();
    return Scaffold(
      appBar: AppBar(title: Text("Search Product"), actions: <Widget>[
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            })
      ]),
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection('user').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: LinearProgressIndicator(),
            );
          } 
          else return Container(
          child: ListTileTheme(
            selectedColor: shrineBrown900,
            child: ListView(
              children: [
                for (int count in List.generate(9, (index) => index + 1))
                  ListTile(
                    title: Text('name'),  //Text(doc.data()['title']
                    isThreeLine: true,
                    subtitle: Text('price\n seller'),
                    leading: Icon(Icons.label),
                    selected: countToValue[count] ?? false,
                  ),
              ],
            )
          ),
  
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/bg2.png'), fit: BoxFit.fill),
         ),
        );
       }
      )
    );
  }
}*/

  @override
  Widget build(BuildContext context) {
    //CollectionReference d = db.collection('users');

    CollectionReference da = db.collection('ads'); //stream da.sanpshots()

    printPosts();
    return Scaffold(
        appBar: AppBar(title: Text("Search Product"), actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                //showSearch(context: context, delegate: SearchBoxDelegate());
                SearchBoxDelegate();
              })
        ]),
        body:
            /*CustomScrollView(
          slivers: [
          SliverPersistentHeaderDelegate(pinned: true, delegate: SearchBoxDelegate()),
         */
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("ads")
                    .snapshots(), //da.snapshots(),
                builder: (context, dataSnapshot) {
                  if (dataSnapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (dataSnapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: LinearProgressIndicator(),
                    );
                  }

                  return SliverStaggeredGrid.countBuilder(
                    crossAxisCount: 1,
                    staggeredTileBuilder: (c) => StaggeredTile.fit(1),
                    itemBuilder: (context, index) {
                      
                      ItemModel model = ItemModel.fromJson(
                          dataSnapshot.data!.docs[index].data);
                      
                      return sourceInfo(model, context);
                    
                    },
                    itemCount: dataSnapshot.data!.docs.length,
                  );

                  /*  return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data!.docs[index]['name']),
                    subtitle: Text(snapshot.data!.docs[index]['description'] +
                        '\nRs.' +
                        snapshot.data!.docs[index]['price'] +
                        '\n'),
                  );
                }, //aCollection[index].reference.collection('aSubCollection').document(docID).data['title']
              );*/
                })
        /* decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/bg2.png'), fit: BoxFit.fill),
         ),*/

        );
  }

  printPosts() async {
    print(await firestoreServices.readAllPosts());
    print(await firestoreServices.readUserPost('users'));
  }
}

class SearchBoxDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) =>
      // show result based on the keyword searched
      InkWell(
          onTap: () {
            Route route = MaterialPageRoute(builder: (c) => SearchProduct());
            Navigator.pushReplacement(context, route);
          },
          child: Container(
              decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                colors: [Colors.black, Colors.grey],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp,
              )),
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: 80.0,
              child: InkWell(
                  child: Container(
                margin: EdgeInsets.only(left: 10.0, right: 10.0),
                width: MediaQuery.of(context).size.width,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.blueGrey,
                      ),
                    )
                  ],
                ),
              ))));
  @override
  double get maxExtent => 80;

  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate) => true;
}

Widget sourceInfo(ItemModel model, BuildContext context) {
  return InkWell(
    onTap: ()
    {
      Route route = MaterialPageRoute(builder: (c) =>SearchProduct(itemModel: model));
      Navigator.pushReplacement(context,route);
    },
      splashColor: Colors.black,
      child: Padding(
          padding: EdgeInsets.all(6.0),
          child: Container(
              height: 190.0,
              width: 50.0,
              child: Row(
                children: [
                  SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  model.name,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Container(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  model.description,
                                  style: TextStyle(
                                      color: Colors.cyan, fontSize: 12.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height:20.0,),
                        Row (
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Colors.black, 
                                ) ,
                              alignment: Alignment.topLeft,
                              width: 40.0,
                              height: 43.0,
                              child:Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                      Text("SSN", style: TextStyle(fontSize: 15.0, color: Colors.white,fontWeight:FontWeight.normal),
                                      ),
                                      Text("exclusive", style: TextStyle(fontSize: 12.0, color: Colors.white,fontWeight:FontWeight.normal),
                                      ),
                                  ],
                                 ) 
                                )
                              ),
                            SizedBox(width:10.0,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                               Padding(
                                 padding: EdgeInsets.only(top:0.0),
                                 child: Row(
                                   children: [
                                     Text('Price: ₹.',
                                     style: TextStyle(
                                       fontSize: 15.0,
                                       color: Colors.grey,
                                      ),
                                     ),
                                    Text(
                                      model.price,
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                   ],
                                  )
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ))));
}

Widget card({Color primaryColor = Colors.redAccent}) {
  return Container();
}
/*
class DataSearch extends SearchDelegate<String> {
  final cities = [
    "calculator",
    "mini drafter",
    "books",
    "laptops",
    "udemy",
    "accounts",
    "locks",
    "bicycles",
    "accesories",
    "electronics",
    "notes",
  ];
  final recentCities = ["mini drafter", "calculator", "books"];
  @override
  List<Widget> buildActions(BuildContext context) {
    // actions for appbar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of the appbar
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, "null");
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // show result based on the keyword searched
    InkWell(
        onTap: () {
          Route route = MaterialPageRoute(builder: (c) => SearchProduct());
          Navigator.pushReplacement(context, route);
        },
        child: Container(
            decoration: new BoxDecoration(
                gradient: new LinearGradient(
              colors: [Colors.black, Colors.grey],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            )),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: 80.0,
            child: InkWell(
                child: Container(
              margin: EdgeInsets.only(left: 10.0, right: 10.0),
              width: MediaQuery.of(context).size.width,
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Icon(
                      Icons.search,
                      color: Colors.blueGrey,
                    ),
                  )
                ],
              ),
            ))));

    return Center(
      child: Container(
        height: 300.0,
        width: 300.0,
        child: Card(
          color: Colors.cyan,
          child: Center(
            child: Text(query),
          ),
        ),
      ),
    );
  }

  /*@override
  Widget buildResults(BuildContext context) {
    // show result based on the keyword searched
    return Center(
      child: Container(
        height: 300.0,
        width: 300.0,
        child: Card(
          color: Colors.cyan,
          child: Center(
            child: Text(query),
          ),
        ),
      ),
    );
  }*/

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when an item is searched
    final suggestionList = query.isEmpty
        ? recentCities
        : cities.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        //leading: Icon(Icons.location_city),
        title: RichText(
            text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style:
                    TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold),
                children: [
              TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(color: Colors.grey))
            ])),
      ),
      itemCount: suggestionList.length,
    );
  }
}
*/
/*
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/bg1.png'), fit: BoxFit.cover),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 6, 16, 60),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(9),
                  topRight: Radius.circular(9),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  */


