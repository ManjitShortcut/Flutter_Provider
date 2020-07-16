import 'package:flutter/material.dart';
import 'package:productapp/BusinessObect/ProductList.dart';
import 'package:provider/provider.dart';
import './widget/ProductDetail.dart';
import './widget/ProductListGridView.dart';

void main() => runApp(MyApp());
enum FilterOption { FilterOptionFav, FilterOptionAll }
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) =>
          ProductList(), // when you are using creating new object instance the user provider.create
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          "/": (ctx) => HomePage(),
          ProductDetail.routeName: (ctx) => ProductDetail(),
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
  @override
  Widget build(BuildContext context) {
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
        ],
      ),
      body: PorductListGridView(favorite),
    );
  }
}
