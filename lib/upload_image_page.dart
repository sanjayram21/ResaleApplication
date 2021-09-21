import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? _image;

  Future getImage() async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (image != null) {
        _image = File(image.path);
      } else {
        print('no image selected');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog (
      child: Column(
        children: [
          AppBar(
            elevation: 1,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            title: Text(
              'Upload image',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  child: FittedBox(
                    child: _image == null
                        ? Icon(CupertinoIcons.photo_on_rectangle)
                        : Image.file(_image!),
                  ),
                ),
                SizedBox(height: 20,),
                Row(children: [
                  Expanded(
                      child: ElevatedButton(
                          onPressed: getImage, child: Text('Upload Image')))
                ])
              ],
            ),
          )
        ],
      ),
    );
  }
}
