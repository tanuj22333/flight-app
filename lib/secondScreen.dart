import 'package:flutter/material.dart';

import 'main.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(
          children: <Widget>[
            ClipPath(
              clipper: CustomShapeClipper(),
              child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFFF47D15), Color(0xFFEF772C)]),
                  ),
                  height: 400,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 32),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.location_on,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              "Boston (BOS)",
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              color: Colors.white,
                            ),
                            Spacer(),
                            Icon(
                              Icons.settings,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 26,
                      ),
                      Text(
                        "Where would\nyou want to go?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 18, vertical: 14),
                        margin: EdgeInsets.symmetric(horizontal: 36),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            BorderRadius.all(Radius.circular(32))),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "New York City",
                              style: TextStyle(color: Colors.black),
                            ),
                            Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      CustomSelector(),
                    ],
                  )),
            ),
            Body(),
            SizedBox(
              height: 12,
            )
          ],
        ),
      ),
    );
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    path.lineTo(0, size.height);

    path.quadraticBezierTo(
        size.width * .25, size.height - 50, size.width * .5, size.height - 35);

    path.quadraticBezierTo(
        size.width * .75, size.height - 25, size.width, size.height - 75);
//
//    path.quadraticBezierTo(size.width * .62, size.height - 200, size.width * .75, size.height - 100);
//    path.quadraticBezierTo(size.width * .87, size.height, size.width, size.height - 100);

    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class CustomSelector extends StatefulWidget {
  @override
  _CustomSelectorState createState() {
    return _CustomSelectorState();
  }
}

class _CustomSelectorState extends State<CustomSelector> {
  bool _isFlightSelected = true;

  void _onSelection(bool value) {
    setState(() {
      _isFlightSelected = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        InkWell(
            onTap: () => _onSelection(true),
            child: RowIcon("Flights", Icons.flight, _isFlightSelected)),
        SizedBox(
          width: 12,
        ),
        InkWell(
            onTap: () => _onSelection(false),
            child: RowIcon("Hotels", Icons.hotel, !_isFlightSelected)),
      ],
    );
  }
}

class RowIcon extends StatelessWidget {
  final String _txtData;
  final IconData _icon;
  final bool _isSelected;

  RowIcon(this._txtData, this._icon, this._isSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: _isSelected
          ? BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white.withOpacity(0.20),
      )
          : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            _icon,
            color: Colors.white,
          ),
          SizedBox(
            width: 12,
          ),
          Text(
            _txtData,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
