import 'package:flutter/material.dart';
import 'package:flutter_provider/catalog/cart_provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cart"),
        ),
        body: Consumer<CartProvider>(
          builder: (context, data, child) {
            return ListView.builder(
                itemCount: data.myCartItemsList.length,
                itemBuilder: (context, index) {
                  return data.myCartItemsList == null ||
                          data.myCartItemsList.length == 0
                      ? Text("No items in the cart")
                      : Card(
                          child: ListTile(
                            title: Text(
                              data.myCartItemsList[index].name,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "\$ " +
                                  data.myCartItemsList[index].price.toString(),
                              style: TextStyle(fontWeight: FontWeight.w400),
                            ),
                          ),
                        );
                });
          },
        ),
        floatingActionButton: Consumer<CartProvider>(
          builder: (_, data, child) {
            return Text("Cart Total \$ ${data.cartvalue}");
          },
        ));
  }
}
