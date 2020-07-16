import 'package:flutter/material.dart';
import '../BusinessObect/ProductList.dart';
import '../BusinessObect/ProductInfo.dart';
import 'package:provider/provider.dart';
import './ProductItem.dart';

class PorductListGridView extends StatelessWidget {
  final bool isFavorite;
  PorductListGridView(this.isFavorite);
  @override
  Widget build(BuildContext context) {
    final ProductList productList = Provider.of<ProductList>(context);
    final List<Product> list = isFavorite?productList.favoriteList:productList.list;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          childAspectRatio: 3 / 2),
      itemBuilder: (cnx, index) => ChangeNotifierProvider.value(
        value: list[
            index], //when ever you are using already allocated object or existing object then use provier value
        child: ProductItem(),
      ),
      itemCount: list.length,
    );
  }
}
