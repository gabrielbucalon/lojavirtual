import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final int a1, r1, g1, b1, a2, r2, g2, b2;

  const Background({
    Key key,
    this.a1,
    this.r1,
    this.g1,
    this.b1,
    this.a2,
    this.r2,
    this.g2,
    this.b2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(a1, r1, g1, b1),
        Color.fromARGB(a2, r2, g2, b1)
      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
    );
  }
}
