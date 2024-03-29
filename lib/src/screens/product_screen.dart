import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:lojavirtual/src/data/cart_product.dart';
import 'package:lojavirtual/src/data/product_data.dart';
import 'package:lojavirtual/src/models/user_model.dart';
import 'package:lojavirtual/src/screens/login_screen.dart';

class ProductScreen extends StatefulWidget {
  final ProductData product;

  const ProductScreen({Key key, this.product}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState(product);
}

class _ProductScreenState extends State<ProductScreen> {
  final ProductData product;
  String size;

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
              SizedBox(height: 16),
              Text("Tamanho",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
              SizedBox(
                height: 34,
                child: GridView(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 8,
                      childAspectRatio: 0.5),
                  children: product.sizes.map((size) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          this.size = size;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          border: Border.all(
                              color: size == this.size
                                  ? primaryColor
                                  : Colors.grey[500],
                              width: 3),
                        ),
                        width: 50,
                        alignment: Alignment.center,
                        child: Text(size),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                height: 44,
                child: RaisedButton(
                  onPressed: this.size != null
                      ? () {
                          if (UserModel.of(context).isLoggedIn()) {
                            CartProduct cartProduct = CartProduct();
                            cartProduct.size = size;
                            cartProduct.quantity = 1;
                            cartProduct.pid = product.id;
                            cartProduct.category = product.category;
                          } else {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                          }
                        }
                      : null,
                  child: Text(
                    UserModel.of(context).isLoggedIn()
                        ? "Adicionar ao carrinho"
                        : "Entre para Comprar",
                    style: TextStyle(fontSize: 18),
                  ),
                  color: primaryColor,
                  textColor: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              Text("Descriçao",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              Text(
                product.description,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
