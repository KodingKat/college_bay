import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;

class HomePageState extends StatelessWidget {
  HomePageState();

  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    final logo = Image.asset(
      "assets/logo.png",
      fit: BoxFit.contain,
    );

    final itemsList = Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          StreamBuilder(
              stream: Firestore.instance.collection('items').snapshots(),
              builder: (context, snapshot) {
                return ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (BuildContext context, int index) {
                      DocumentSnapshot items = snapshot.data.documents[index];
                      return ListTile(
                        leading: Image.network(items['imageLinks']),
                        title: Text(items['title']),
                      );
                    });
              }),
        ]);

    return Scaffold(
      backgroundColor: Color(0xffDA70D6),
      body: Padding(
        padding: EdgeInsets.all(36),
        child: Column(ry
            children: <Widget>[
              itemsList,
            ]),
      ),
    );
  }
}
