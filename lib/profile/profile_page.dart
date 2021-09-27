import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resale_application/services/firebase.dart';
import 'dp.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {

  TextEditingController _nameContoller = TextEditingController();
  TextEditingController _yearContoller = TextEditingController();
  TextEditingController _hostelContoller = TextEditingController();
  TextEditingController _phoneNumberContoller = TextEditingController();

  bool _isValid = false;

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
            controller: _nameContoller,
            onChanged: (_) {
              if(_nameContoller.text.isNotEmpty && _hostelContoller.text.isNotEmpty && _yearContoller.text.isNotEmpty && _phoneNumberContoller.text.isNotEmpty){
                setState(() {
                  _isValid = true;
                });
              }
              else{
                _isValid = false;
              }
            },
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
            controller: _yearContoller,
            onChanged: (_) {
              if(_nameContoller.text.isNotEmpty && _hostelContoller.text.isNotEmpty && _yearContoller.text.isNotEmpty && _phoneNumberContoller.text.isNotEmpty){
                setState(() {
                  _isValid = true;
                });
              }
              else{
                _isValid = false;
              }
            },
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
            controller: _hostelContoller,
            onChanged: (_) {
              if(_nameContoller.text.isNotEmpty && _hostelContoller.text.isNotEmpty && _yearContoller.text.isNotEmpty && _phoneNumberContoller.text.isNotEmpty){
                setState(() {
                  _isValid = true;
                });
              }
              else{
                _isValid = false;
              }
            },
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
            controller: _phoneNumberContoller,
            onChanged: (_) {
              if(_nameContoller.text.isNotEmpty && _hostelContoller.text.isNotEmpty && _yearContoller.text.isNotEmpty && _phoneNumberContoller.text.isNotEmpty){
                setState(() {
                  _isValid = true;
                });
              }
              else{
                _isValid = false;
              }
            },
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
              ElevatedButton(onPressed: _isValid ? () {
                firestoreServices.writeToProfileCollection("users", {
                  "fullName": _nameContoller.text,
                  "gradYear": _yearContoller.text,
                  "hostel": _hostelContoller.text,
                  "phoneNumber": _phoneNumberContoller.text,
                });
                _nameContoller.clear();
                _yearContoller.clear();
                _hostelContoller.clear();
                _phoneNumberContoller.clear();
              } : null, child: new Text('Save details'))
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
