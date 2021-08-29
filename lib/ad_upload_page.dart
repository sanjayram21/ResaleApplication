import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'upload_image_page.dart';

class AdUploadPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _AdUploadPageState();
}

class _AdUploadPageState extends State<AdUploadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ad Upload Page"),
      ),
      body: new Container(
        padding: EdgeInsets.fromLTRB(24, 40, 24, 24),
        child: ListView(children: <Widget>[
          new TextFormField(
            decoration: new InputDecoration(
              labelText: "Product Name",
              fillColor: Colors.grey.shade300,
              filled: true,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                  borderRadius: BorderRadius.circular(0)),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          new TextFormField(
            decoration: new InputDecoration(
              labelText: "Price",
              fillColor: Colors.grey.shade300,
              filled: true,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                  borderRadius: BorderRadius.circular(0)),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          new TextFormField(
            decoration: new InputDecoration(
              labelText: "Details",
              fillColor: Colors.grey.shade300,
              filled: true,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                  borderRadius: BorderRadius.circular(0)),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          new TextFormField(
            decoration: new InputDecoration(
              labelText: "Contact Details",
              fillColor: Colors.grey.shade300,
              filled: true,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue, width: 2.0),
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
                child: new Text('Upload Image'),
              ),
              SizedBox(width: 111,),
              ElevatedButton(onPressed: null, child: new Text('Save details'))
            ],
          )
        ]),
      ),
    );
  }

  Widget uploadDialog() {
    return Dialog(
      child: Column(
        children: [
          AppBar(
            elevation: 1,
            backgroundColor: Colors.white,
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
