import 'package:flutter/material.dart';
import 'package:simple_app/model/Product.dart';

class DetailScreen extends StatelessWidget {

  final Product _product;

  DetailScreen(this._product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: <Widget>[
            Image.network(_product.imageUrl),
            Text(
              _product.name,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Description: " + _product.description,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
