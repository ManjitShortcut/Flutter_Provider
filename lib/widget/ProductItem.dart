import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../BusinessObect/ProductInfo.dart';
import '../widget/ProductDetail.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("render method call");
    final Product item = Provider.of<Product>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(ProductDetail.routeName, arguments: item.id);
          },
          child: Image.network(
            item.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.red[50],
          title: Text(
            item.title,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black),
            overflow: TextOverflow.fade,
          ),
          // there is also another way to get provider valye iseing consumer.
          // It is special type of widget where user will get value . but the benifit will it will
          //only specific element.
          leading: Consumer<Product>(
            builder: (ctx, product, child) => IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: item.isFavorite ? Colors.red : Colors.black,
                ),
                onPressed: () {
                  item.setFavorite();
                }),
          ),
          trailing: IconButton(
              icon: Icon(
                Icons.shop,
                color: Colors.red,
              ),
              onPressed: () {}),
        ),
      ),
    );
  }
}
