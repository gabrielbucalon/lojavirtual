import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:lojavirtual/src/data/product_data.dart';

class ProductScreen extends StatefulWidget {
  final ProductData product;

  const ProductScreen({Key key, this.product}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState(product);
}

class _ProductScreenState extends State<ProductScreen> {
  final ProductData product;

  _ProductScreenState(this.product);

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(title: Text(product.title), centerTitle: true),
      body: ListView(children: <Widget>[
        AspectRatio(
          aspectRatio: 0.9,
          child: Carousel(
            images: product.images.map((map) {
              return NetworkImage(map);
            }).toList(),
            dotSize: 4,
            dotSpacing: 15,
            dotBgColor: Colors.transparent,
            dotColor: primaryColor,
            autoplay: false,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                product.title,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text("R\$ ${product.price.toStringAsFixed(2)}",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: primaryColor)),
            ],
          ),
        )
      ]),
    );
  }
}
