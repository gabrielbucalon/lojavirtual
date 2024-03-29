import 'package:flutter/material.dart';
import 'package:lojavirtual/src/data/product_data.dart';
import 'package:lojavirtual/src/screens/product_screen.dart';

class ProductTiles extends StatelessWidget {
  final String type;
  final ProductData data;

  const ProductTiles({Key key, this.type, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => (ProductScreen(product: data))));
      },
      child: Card(
        child: type == "grid"
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 0.8,
                    child: Image.network(
                      data.images[0],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Text(
                          data.title,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Text("R\$ ${data.price.toStringAsFixed(2)}",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 17,
                                fontWeight: FontWeight.w900))
                      ],
                    ),
                  )),
                ],
              )
            : Row(
                children: [
                  Flexible(
                      flex: 1,
                      child: Image.network(data.images[0],
                          fit: BoxFit.cover, height: 250)),
                  Flexible(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(data.title,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17)),
                            Text("R\$ ${data.price.toStringAsFixed(2)}",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17))
                          ],
                        ),
                      ))
                ],
              ),
      ),
    );
  }
}
