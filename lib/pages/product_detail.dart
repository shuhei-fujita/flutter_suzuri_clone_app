import 'package:flutter/material.dart';
import 'package:flutter_hands_on/models/product.dart';

class ProductDetail extends StatelessWidget {

  static const routeName = "/productDetail";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final Product product = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("商品詳細"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: Image.network(product.sampleImageUrl),
            ),
            Text(
              product.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(product.item.humanizeName),
            Text("${product.price.toString()}円"),
            Text("作った人：　${product.material.user.name}"),
          ],
        ),
      ),
    );
  }

  Widget _body() {

  }

}