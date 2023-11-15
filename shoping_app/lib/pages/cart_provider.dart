import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> cart = [];
  void addProduct(Map<String, dynamic> product) {
    cart.add(product); //it will add the list of data to the new list we
    //will be creating to use for cart page
    notifyListeners();
  }

  void removeProduct(Map<String, dynamic> product) {
    cart.remove(product); //list mein map ko add kardega
    notifyListeners();
  }
}
