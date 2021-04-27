import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:college_bay/views/productPage.dart';

void main() {
  HomePageState();
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends StatelessWidget {
  HomePageState();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000080),
      floatingActionButton: null,
      body: StreamBuilder(
        // Creating the stream necessary to access the firestore database
          stream: Firestore.instance.collection('items').limit(10).snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            //Creating the scrolling list of images and titles
            return ListView(
              // Viewing all of the items and their fields in the database
              children: snapshot.data.documents.map((document) {
                return Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xffFF8A09D9)),
                    child: MaterialButton(
                      onPressed: () {
                        var docID = document.documentID;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Product(docID)));
                      },
                      child: Column(
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              child: Text(
                                document['title'],
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: CachedNetworkImage(
                              imageUrl: document['imageLinks'],
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          }),
    );
  }
}
