import 'package:flutter/material.dart';
import 'package:shamo/models/cart_model.dart';
import 'package:shamo/models/product_model.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _carts = [];
  List<CartModel> get carts => _carts;

  set carts(List<CartModel> carts) {
    _carts = carts;
    notifyListeners();
  }

  addCart(ProductModel product) {
    if (productExist(product)) {
      //jika producnya sudah ada dan mau di tmabah maka hanya quantitynya yang di tambah
      int index =
          _carts.indexWhere((element) => element.product.id == product.id);
      _carts[index].qunatity++;
    } else {
      //jika produknya blum ada dan mau ditambah
      _carts.add(CartModel(id: _carts.length, product: product, qunatity: 1));
    }
    notifyListeners();
  }

  //membah fuction remove cart
  removeCard(int id) {
    _carts.removeAt(id);
    notifyListeners();
  }
  //untuk menambah quantity

  addQuantity(int id) {
    _carts[id].qunatity++;
    notifyListeners();
  }
  //untuk mengurang quantity

  reduceQuantity(int id) {
    _carts[id].qunatity--;
    if (_carts[id].qunatity == 0) {
      _carts.removeAt(id);
    }
    notifyListeners();
  }

  // untuk menghitung total items
  totalItems() {
    int total = 0;
    for (var item in _carts) {
      total += item.qunatity;
    }
    return total;
  }

  //untuk menghitung total belianya
  totalPrice() {
    double total = 0;
    for (var item in _carts) {
      total += (item.qunatity * item.product.price);
    }
    return total;
  }

  productExist(ProductModel product) {
    if (_carts.indexWhere((element) => element.product.id == product.id) ==
        -1) {
      return false;
    } else {
      return true;
    }
  }
}
