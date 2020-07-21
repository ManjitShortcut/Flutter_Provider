import 'package:flutter/material.dart';
import 'package:productapp/BusinessObect/ProductList.dart';
import 'package:provider/provider.dart';
import './widget/ProductDetail.dart';
import './widget/ProductListGridView.dart';
import './BusinessObect/ShoppingList.dart';
import './widget/BadgeCount.dart';
import './widget/ShoppingDetail.dart';

void main() => runApp(MyApp());
enum FilterOption { FilterOptionFav, FilterOptionAll }

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProductList(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => ShoppingList(),
        ),
      ],
      // when you are using creating new object instance the user provider.create
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          "/": (ctx) => HomePage(),
          ProductDetail.routeName: (ctx) => ProductDetail(),
          ShoppingDetail.routeName: (ctx) => ShoppingDetail(),
        },
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool favorite = false;
  void shoppingCartClick() {
    Navigator.of(context).pushNamed(ShoppingDetail.routeName);
  }

  @override
  Widget build(BuildContext context) {
    print("  uild contex method again call");
    // Provider.of<ProductList>(context, listen: false);
    //Provider.of<ShoppingList>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: Text("Company Product"),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOption selectedValue) {
              setState(() {
                if (selectedValue == FilterOption.FilterOptionFav) {
                  favorite = true;
                } else {
                  favorite = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                  child: Text("Only favorites"),
                  value: FilterOption.FilterOptionFav),
              PopupMenuItem(
                  child: Text("Show All"), value: FilterOption.FilterOptionAll),
            ],
          ),
          Consumer<ShoppingList>(
            builder: (ctx, shoppinglist, child) =>
                BadgeCount(shoppinglist.shoppingCount,shoppingCartClick),
          ),
        ],
      ),
      body: PorductListGridView(favorite),
    );
  }
}
