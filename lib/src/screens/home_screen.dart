import 'package:flutter/material.dart';
import 'package:lojavirtual/src/tabs/home_tab.dart';
import 'package:lojavirtual/src/tabs/products_tab.dart';
import 'package:lojavirtual/src/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(pageController: _pageController,)
        ),
        Scaffold(
          appBar: AppBar(
            title: (Text("Produtos")),
            centerTitle: true
          ),
          drawer: CustomDrawer(pageController: _pageController),
          body: ProductsTab(),
        ),
      ],
    );
  }
}
