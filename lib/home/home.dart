import 'package:flutter/material.dart';
import 'package:resale_application/services/firebase.dart';

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
      appBar: AppBar(title: Text("Search Product"), actions: <Widget>[
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            })
      ]),
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

printPosts() async {
  print(await firestoreServices.readAllPosts());
  print(await firestoreServices.readUserPost('users'));
}
