import 'package:shamo/models/product_model.dart';

class CartModel {
  int id;
  ProductModel product;
  int qunatity;

  CartModel({this.id, this.product, this.qunatity});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = ProductModel.formJson(json['product']);
    qunatity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'product': product, 'quantity': qunatity};
  }

  double getTotalPrice() {
    return product.price * qunatity;
  }
}
