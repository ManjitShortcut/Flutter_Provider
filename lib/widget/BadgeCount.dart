import 'package:flutter/material.dart';

class BadgeCount extends StatelessWidget {
  final String count;
  final Function clickOnBadge;
  BadgeCount(this.count,this.clickOnBadge);
  @override
  Widget build(BuildContext context) {
    print(count);
    return Stack(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: this.clickOnBadge,
        ),
        Positioned(
          right: 0,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
            padding: EdgeInsets.all(6),
            child: Text(
              count,
              style: TextStyle(fontSize: 15),
            ),
          ),
        ),
      ],
    );
  }
}
