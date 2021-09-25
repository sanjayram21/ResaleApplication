import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dp.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text("Ad Upload Page"),
      ),*/
      body: new Container(
        padding: EdgeInsets.fromLTRB(24, 40, 24, 24),
        child: ListView(children: <Widget>[
          new TextFormField(
            decoration: new InputDecoration(
              labelText: "Full Name",
              fillColor: Colors.black,
              filled: true,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.circular(0)),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          new TextFormField(
            decoration: new InputDecoration(
              labelText: "Pass out year",
              fillColor: Colors.black,
              filled: true,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.circular(0)),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          new TextFormField(
            decoration: new InputDecoration(
              labelText: "Hostel/ Home Locality",
              fillColor: Colors.black,
              filled: true,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.circular(0)),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          new TextFormField(
            decoration: new InputDecoration(
              labelText: "Phone No.",
              fillColor: Colors.black,
              filled: true,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.circular(0)),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          new Row(
            children: [
              ElevatedButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ImagePickerWidget()),
                  )
                },
                child: new Text('Profile Picture'),
              ),
              SizedBox(
                width: 80,
              ),
              ElevatedButton(onPressed: null, child: new Text('Save details'))
            ],
          )
        ]),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/bg1.png'), fit: BoxFit.fill),
        ),
      ),
    );
  }

  Widget uploadDialog() {
    return Dialog(
      child: Column(
        children: [
          AppBar(
            elevation: 1,
            backgroundColor: Colors.black,
            iconTheme: IconThemeData(color: Colors.amber),
            title: Text(
              'Hello',
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
