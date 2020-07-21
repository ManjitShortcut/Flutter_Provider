import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../BusinessObect/ShoppingList.dart';
import '../widget/ShopingItemUI.dart';
class ShoppingDetail extends StatelessWidget {
  static const String routeName = "/CartDetail";
  @override
  Widget build(BuildContext context) {
   final shoppingList = Provider.of<ShoppingList>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        title: Text("Shopping Detail"),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
           Expanded(child: ListView.builder(itemCount: shoppingList.itemCount,itemBuilder: (ctx,index)=> 
              ShopingItemUI(shoppingList.getItemForIndex(index)),
           )),
            Center(
              child: CupertinoButton(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white),
                    padding: EdgeInsets.all(5),
                    height: 50,
                    width: MediaQuery.of(context).size.width - 30,
                    alignment: Alignment.center,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.payment,
                          size: 25,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Pay Amount :",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Consumer<ShoppingList>(builder: (ctx, shoppinglist, child) =>
                        Text(
                          "${shoppingList.totalAmount}",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.normal),
                        ),
                        ),
                      ],
                    ),
                  ),
                  onPressed: () {}),
            )
          ],
        ),
      ),
    );
  }
}
