import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    //Architecture for uploading image.
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File _image;
  String _uploadedFileURL;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CollegeBay Image Upload'),
      ),
      body: Center( //Creating the buttons and their functions.
        child: Column(
          children: <Widget>[
            Text('Selected Image'),
            _image != null
                ? Image.asset(
              _image.path,
              height: 200,
            )
                : Container(height: 200),
            _image == null
                ? RaisedButton(
              child: Text('Choose File'),
              onPressed: chooseFile,
              color: Colors.indigo,
            )
                : Container(),
            _image != null
                ? RaisedButton(
              child: Text('Upload File'),
              onPressed: uploadFile,
              color: Colors.indigo,
            )
                : Container(),
            _image != null
                ? RaisedButton(
              child: Text('Clear Selection'),
              onPressed: clearSelection,
              color: Colors.grey,
            )
                : Container()

          ],
        ),
      ),
    );
  }

  Future chooseFile() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image = image;
      });
    });
  }

  Future uploadFile() async{
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('gs://collegebay-70c11.appspot.com/');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.onComplete;
    print('File Uploaded');
    storageReference.getDownloadURL().then((fileURL) {
      setState(() {
        _uploadedFileURL = fileURL;
      });
    });
  }

  void clearSelection() {
    setState(() {
      _image = null;
      _uploadedFileURL = null;
    });
  }
}

