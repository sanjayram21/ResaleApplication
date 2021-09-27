import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resale_application/services/firebase.dart';
import 'upload_image_page.dart';

class AdUploadPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _AdUploadPageState();
}

class _AdUploadPageState extends State<AdUploadPage> {
  TextEditingController _nameContoller = TextEditingController();
  TextEditingController _priceContoller = TextEditingController();
  TextEditingController _detailsContoller = TextEditingController();
  TextEditingController _contactContoller = TextEditingController();

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
              if(_nameContoller.text.isNotEmpty && _contactContoller.text.isNotEmpty && _detailsContoller.text.isNotEmpty && _priceContoller.text.isNotEmpty) {
                setState(() {
                    _isValid = true;
                });
              } else {
                _isValid = false;
              }
            },
            decoration: new InputDecoration(
              labelText: "Product Name",
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
            controller: _priceContoller,
            onChanged: (_) {
              if(_nameContoller.text.isNotEmpty && _contactContoller.text.isNotEmpty && _detailsContoller.text.isNotEmpty && _priceContoller.text.isNotEmpty) {
                setState(() {
                    _isValid = true;
                });
              } else {
                _isValid = false;
              }
            },
            decoration: new InputDecoration(
              labelText: "Price",
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
            controller: _detailsContoller,
            onChanged: (_) {
              if(_nameContoller.text.isNotEmpty && _contactContoller.text.isNotEmpty && _detailsContoller.text.isNotEmpty && _priceContoller.text.isNotEmpty) {
                setState(() {
                    _isValid = true;
                });
              } else {
                _isValid = false;
              }
            },
            decoration: new InputDecoration(
              labelText: "Details",
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
            controller: _contactContoller,
            onChanged: (_) {
              if(_nameContoller.text.isNotEmpty && _contactContoller.text.isNotEmpty && _detailsContoller.text.isNotEmpty && _priceContoller.text.isNotEmpty) {
                setState(() {
                    _isValid = true;
                });
              } else {
                _isValid = false;
              }
            },
            decoration: new InputDecoration(
              labelText: "Contact Details",
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ImagePickerWidget()),
                  )
                },
                child: new Text('Upload Image'),
              ),
              
              ElevatedButton(onPressed: _isValid ? () {
                firestoreServices.writeToCollection("users", {
                  "name": _nameContoller.text,
                  "price": _priceContoller.text,
                  "description": _detailsContoller.text,
                  "contact": _contactContoller.text,
                });
                _nameContoller.clear();
                _contactContoller.clear();
                _detailsContoller.clear();
                _priceContoller.clear();
              } : null, child: new Text('Save details'))
            ],
          )
        ]),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/bg2.png'), fit: BoxFit.fill),
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