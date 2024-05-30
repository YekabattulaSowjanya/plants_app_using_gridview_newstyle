import 'package:flutter/cupertino.dart';
import '../model/plants_model.dart';

class CartProvider with ChangeNotifier{

  ///cart provider
  List<Plants> _cartItems = [];

  List<Plants> get cartItems => _cartItems;

  void addToCart(Plants item) {
    _cartItems.add(item);
    notifyListeners();
  }
}