import 'package:flutter/material.dart';
import 'package:ui_app/secondScreen.dart';

void main() {
//  runApp(MyApp());
  runApp(SecondScreen());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
//        primarySwatch: Colors.orange,
        primaryColor: Colors.orange,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(),
          bottomNavigationBar: CustomNavBar(),
          body: Text(""),
      ),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 0, 12, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Currently Watched Items",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  Text(
                    "VIEW ALL (12)",
                    style: TextStyle(color: Colors.orange),
                  ),
                ],
              ),
            ),
            Container(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Card(imageSrc: "assets/images/athens.jpg"),
                  Card(imageSrc: "assets/images/lasvegas.jpg"),
                  Card(imageSrc: "assets/images/sydney.jpeg"),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class Card extends StatelessWidget {
  final String imageSrc;

  Card({this.imageSrc});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 180,
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                child: Container(
                    height: 210,
                    width: 160,
                    child: Image.asset(
                      imageSrc,
                      fit: BoxFit.cover,
                    )),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 80,
                  width: 160,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      gradient: LinearGradient(
                        colors: [Colors.black, Colors.black.withOpacity(0.1)],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      )),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 80,
                  width: 160,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        "Les Vegas",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Text(
                            "Feb 2019",
                            style: TextStyle(color: Colors.white),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: Text(
                              "45 %",
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 12,
              ),
              Text(
                "\$2,250",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              SizedBox(
                width: 12,
              ),
              Text(
                "(\$4,250)",
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CustomNavBar extends StatefulWidget {
  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _selectedIndex = 0;

  var _textStyle = TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.orange,
              ),
              title: Text(
                "Explore",
                style: _textStyle,
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: Colors.black,
              ),
              title: Text(
                "Watchlist",
                style: _textStyle,
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.local_offer,
                color: Colors.black,
              ),
              title: Text(
                "Deals",
                style: _textStyle,
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
                color: Colors.black,
              ),
              title: Text(
                "Notifcations",
                style: _textStyle,
              )),
        ]);
  }
}
