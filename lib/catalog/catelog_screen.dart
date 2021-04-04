import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_provider/catalog/cart_provider.dart';
import 'package:flutter_provider/catalog/date_time_provider.dart';
import 'package:provider/provider.dart';

import 'cart_screen.dart';
import 'item_model.dart';

class CatalogScreen extends StatefulWidget {
  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  List<ItemModel> mentItemslist = [];

  prepareMenu() {
    mentItemslist.add(ItemModel(name: "Eggs", price: 36.5));
    mentItemslist.add(ItemModel(name: "Chicken", price: 200));
    mentItemslist.add(ItemModel(name: "Mutton", price: 850));
    mentItemslist.add(ItemModel(name: "Fish", price: 145));
    mentItemslist.add(ItemModel(name: "Soda", price: 70));
  }

  CartProvider cartProvider;

  @override
  void initState() {
    prepareMenu();
    cartProvider = Provider.of<CartProvider>(context, listen: false);

    var timeDateProvider =
        Provider.of<DateTimeProvider>(context, listen: false);

    Timer.periodic(Duration(seconds: 1), (timer) {
      timeDateProvider.updateTimeDate();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog"),
        actions: [
          IconButton(
              icon: Icon(Icons.menu_book_outlined),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartScreen()));
              })
        ],
      ),
      body: ListView.builder(
          itemCount: mentItemslist.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(
                  mentItemslist[index].name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "\$ " + mentItemslist[index].price.toString(),
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Colors.green,
                  ),
                  onPressed: () {
                    cartProvider.addToCart(mentItemslist[index]);
                  },
                ),
              ),
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: RaisedButton(
          color: Colors.blue,
          child: Consumer<DateTimeProvider>(
            builder: (contex, value, child) {
              return Text("Date " + value.dateTime.toString());
            },
          ),
          onPressed: () {}),
    );
  }
}
