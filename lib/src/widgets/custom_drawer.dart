import 'package:flutter/material.dart';
import 'package:lojavirtual/src/tiles/drawer_tiles.dart';

class CustomDrawer extends StatelessWidget {
  final PageController pageController;

  const CustomDrawer({Key key, @required this.pageController})
      : super(key: key);

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
                      top: 8.0,
                      left: 0.0,
                      child: Text(
                        "Flutter's\nClothing",
                        style: TextStyle(
                            fontSize: 34, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Positioned(
                      left: 0.0,
                      bottom: 0.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Olá,",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              "Entre ou cadastra-se >",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Divider(),
              DrawerTile(
                  icon: Icons.home,
                  text: "Inicio",
                  pageController: pageController, page: 1),
              DrawerTile(
                  icon: Icons.list,
                  text: "Produtos",
                  pageController: pageController, page: 2),
              DrawerTile(
                  icon: Icons.location_on,
                  text: "Lojas",
                  pageController: pageController, page: 3),
              DrawerTile(
                  icon: Icons.playlist_add_check,
                  text: "Meus Pedidos",
                  pageController: pageController, page: 4),
            ],
          ),
        ],
      ),
    );
  }
}
