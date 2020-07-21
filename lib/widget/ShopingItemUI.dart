import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../BusinessObect/ShoppingList.dart';

class ShopingItemUI extends StatelessWidget {
  final ShoppingItem item;
  ShopingItemUI(this.item);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(item.product.id),
      direction: DismissDirection.endToStart, // right to left
      onDismissed: (direction) {
        Provider.of<ShoppingList>(context,listen: false).deleteItem(item.product);
      },
      background: Container(
        color: Colors.blueAccent,
        child: Icon(
          Icons.delete,
          color: Colors.black,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.only(left: 10, right: 5, top: 2),
      ),
      child: Card(
        margin: EdgeInsets.only(left: 10, right: 5, top: 2),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Row(children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    this.item.product.imageUrl,
                    fit: BoxFit.cover,
                    height: 100,
                    width: 80,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      this.item.product.title,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "Total prise =: ${this.item.product.price.toString()}",
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
              ]),
              Spacer(),
              Text("Quantity: ${this.item.count}")
            ],
          ),
        ),
      ),
    );
  }
}
