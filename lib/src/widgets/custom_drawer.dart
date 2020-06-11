import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildDrawerBackground() => Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 203, 236, 241), Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        );
    Size size = MediaQuery.of(context).size;
    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBackground(),
          ListView(
            padding: EdgeInsets.only(left: 32.0, top: 16.0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0, 16, 16, 8),
                height: 170.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 8,
                      left: 0,
                      child: Text(
                        "Flutter's\nClothing",
                        style: TextStyle(
                            fontSize: size.width * 0.8,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      bottom: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Olá",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
