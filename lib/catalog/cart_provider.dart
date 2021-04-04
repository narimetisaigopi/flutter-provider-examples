import 'package:flutter/material.dart';
import 'package:flutter_provider/catalog/item_model.dart';

class CartProvider extends ChangeNotifier {
  List<ItemModel> myCartItemsList = [];
  double cartvalue = 0;

  addToCart(ItemModel itemModel) {
    myCartItemsList.add(itemModel);
    cartvalue += itemModel.price;
    notifyListeners();
    print("Added to Cart");
  }
}
