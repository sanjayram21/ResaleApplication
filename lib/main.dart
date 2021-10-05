import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        //primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ));
    });
    //=> Navigator.pushReplacement(
    //   context, MaterialPageRoute(builder: (context) => SecondScreen())));

    //Timer(
    //  Duration(seconds: 5),
    // () => Navigator.pushReplacement(
    //    context, MaterialPageRoute(builder: (context) => LoginPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(title: Text("CRA: Goods from people you know")),
        body: Center(
      child: Image(
        image: AssetImage('assets/spla2.gif'),
        width: 500,
        height: 800,
        fit: BoxFit.cover,
        //semanticLabel: 'logo',
      ),
    ));
  }
}
