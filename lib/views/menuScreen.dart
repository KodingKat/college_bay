import 'package:college_bay/views/homepage.dart';
import 'package:flutter/material.dart';
import 'package:college_bay/views/homepage.dart';
import 'package:college_bay/views/uploadProduct.dart';


class MenuScreen extends StatefulWidget {
  MenuScreen();
  @override
  MenuScreenState createState() => MenuScreenState();
}
// Creating the bottom navigation bar and its functionality
class MenuScreenState extends State<MenuScreen> {
  MenuScreenState();
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: null,
      body: DefaultTabController(
        length: 2,
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
            ),
            Scaffold(
              bottomNavigationBar: Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: TabBar(
                  tabs: <Widget>[
                    Tab(icon: Icon(Icons.home),),
                    Tab(icon: Icon(Icons.account_box),),
                  ],
                  labelColor: Colors.red,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(color: Colors.red, width: 4.0),
                    insets: EdgeInsets.only(bottom: 44)
                  ),
                  unselectedLabelColor: Color(0xff000080),
                )
              ),
              body: TabBarView(
                children: <Widget>[
                  HomePageState(),
                  UploadProduct(),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}