import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:productapp/BusinessObect/ProductInfo.dart';

class ShoppingList with ChangeNotifier {
  List<ShoppingItem> _shoppingList = [];
  String get shoppingCount {
    return _shoppingList.length.toString();
  }

  int get itemCount {
    return _shoppingList.length;
  }

  ShoppingItem getItemForIndex(int position) {
    return _shoppingList[position];
  }

  double get totalAmount {
    return _shoppingList.fold(
        0, (element1, element2) => element1 + element2.totalAmount);
  }

  void addItemToShpooingList(Product productItem) {
    ShoppingItem shopingItem = findOutItem(productItem);
    if (shopingItem != null) {
      shopingItem.inCrementItem(1);
    } else {
      _shoppingList.add(ShoppingItem(product: productItem, count: 1));
    }
    notifyListeners();
  }

  void deleteItem(Product productItem) {
    ShoppingItem shopingItem = findOutItem(productItem);
    if (shopingItem != null) {
    _shoppingList.remove(shopingItem);
    }
    notifyListeners();
  }

  void increseDecreseItem(int count) {}
  // find out item is present or not
  ShoppingItem findOutItem(Product productItem) {
    return _shoppingList.firstWhere((item) => productItem.id == item.product.id,
        orElse: () => null);
  }
}

class ShoppingItem {
  final Product product;
  int count = 1;
  ShoppingItem({this.product, this.count});
  void inCrementItem(int increse) {
    this.count += increse;
  }

  double get totalAmount {
    return (product.price) * (this.count.toDouble());
  }
}
