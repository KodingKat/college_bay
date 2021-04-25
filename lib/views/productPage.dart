import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Product extends StatefulWidget {

  final docId;
  Product(this.docId);

  @override
  State<StatefulWidget> createState() => _ProductState(docId);
}

class _ProductState extends State<Product> {

  final docId;
  _ProductState(this.docId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFF8A09D9),
      appBar: AppBar(
        title: Text(
            'Product'
        ),
      ),
      body: ListView(
        children: <Widget>[
          StreamBuilder<DocumentSnapshot>(
            stream: Firestore.instance.collection('items').document(docId).snapshots(),
            builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) return Text('Error: ${snapshot.error}');
              if (!snapshot.hasData) return Container(
                child: Center(
                    child: CircularProgressIndicator()
                ),
              );
              return Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      snapshot.data['title'],
                      style: TextStyle(
                          fontSize: 24.0
                      ),
                    ),
                  ),
                  Container(
                    child: Image(
                      image: NetworkImage(
                          snapshot.data['imageLinks']
                      ),
                    ),
                  ),
                  Container(
                      child: Text(
                          snapshot.data['itemDescr']
                      )
                  )
                ],
              );
            },
          )
        ],
      ),
    );
  }
}