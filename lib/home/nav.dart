import 'package:flutter/material.dart';
import 'package:resale_application/services/firebase.dart';
import 'home.dart';
import '../ad_upload/ad_upload.dart';
import '../profile/profile_page.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text('Bottom Navigation Bar Tutorial'),
      ),*/
      body: Center(
        child: <Widget>[
    FutureBuilder(
        future: firestoreServices.readAllPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final data = snapshot.data as List<Map<String, dynamic>>;
            return HomeScreen(
              items: data,
            );
          } else {
            return Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [LinearProgressIndicator()],
              ),
            );
          }
        }),
    AdUploadPage(),
    //Text('Profile'),
    ProfilePage(),
  ][_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Text(
              'Home',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
            ),
            title: Text(
              'Ad Upload',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            title: Text(
              'Profile',
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        selectedFontSize: 13.0,
        unselectedFontSize: 13.0,
      ),
    );
  }
}
