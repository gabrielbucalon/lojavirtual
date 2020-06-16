import 'package:flutter/material.dart';
import 'package:lojavirtual/src/data/product_data.dart';

class ProductScreen extends StatefulWidget {

  final ProductData product;

  const ProductScreen({Key key, this.product}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  final ProductData product;

  _ProductScreenState(this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}