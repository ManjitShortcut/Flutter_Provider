import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../BusinessObect/ProductList.dart';

class ProductDetail extends StatelessWidget {
  static String routeName = "/productDetail";
  @override
  Widget build(BuildContext context) {
    final String productId =
        ModalRoute.of(context).settings.arguments as String;
    final loadedProduct =
        Provider.of<ProductList>(context,listen: false).findProductById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: Text("Product Detail"),
    );
  }
}
