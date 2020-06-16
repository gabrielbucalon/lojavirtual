import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lojavirtual/src/data/product_data.dart';
import 'package:lojavirtual/src/tiles/product_tiles.dart';

class CategoryScreen extends StatelessWidget {
  final DocumentSnapshot snapshot;

  const CategoryScreen({Key key, @required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: Text(snapshot.data["title"]),
              centerTitle: true,
              bottom: TabBar(indicatorColor: Colors.white, tabs: <Widget>[
                Tab(icon: Icon(Icons.grid_on)),
                Tab(icon: Icon(Icons.list))
              ]),
            ),
            body: FutureBuilder<QuerySnapshot>(
                future: Firestore.instance
                    .collection("products")
                    .document(snapshot.documentID)
                    .collection("items")
                    .getDocuments(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 4,
                                      crossAxisSpacing: 4,
                                      childAspectRatio: 0.65),
                              itemCount: snapshot.data.documents.length,
                              itemBuilder: (context, index) {
                                return ProductTiles(
                                    type: "grid",
                                    data: ProductData.fromDocument(
                                        snapshot.data.documents[index]));
                              }),
                          ListView.builder(
                              padding: EdgeInsets.all(4),
                              itemCount: snapshot.data.documents.length,
                              itemBuilder: (context, index) {
                                return ProductTiles(
                                    type: "list",
                                    data: ProductData.fromDocument(
                                        snapshot.data.documents[index]));
                              })
                        ]);
                  }
                })));
  }
}
