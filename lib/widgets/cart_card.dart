import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/cart_model.dart';
import 'package:shamo/providers/cart_provider.dart';
import 'package:shamo/theme.dart';

class cartCard extends StatelessWidget {
  final CartModel cart;
  cartCard(this.cart);
  @override
  Widget build(BuildContext context) {
    int index = 0;
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Container(
        margin: EdgeInsets.only(top: 30, left: 30, right: 30),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: backgroundColor4,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          image: NetworkImage(cart.product.galleries[0].url))),
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cart.product.name,
                        style: primaryTextStyle.copyWith(fontWeight: semiBold),
                      ),
                      Text(
                        '\$${cart.product.price}',
                        style: priceTextStyle,
                      )
                    ],
                  ),
                ),
                Column(children: [
                  GestureDetector(
                    //untuk menambah quantiy
                    onTap: () {
                      cartProvider.addQuantity(cart.id);
                    },
                    child: Image.asset(
                      'assets/tambah.png',
                      width: 16,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    cart.qunatity.toString(),
                    style: primaryTextStyle.copyWith(fontWeight: medium),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  GestureDetector(
                    onTap: () {
                      cartProvider.reduceQuantity(cart.id);
                    },
                    child: Image.asset(
                      'assets/kurang.png',
                      width: 16,
                    ),
                  ),
                ])
              ],
            ),
            SizedBox(
              height: 12,
            ),
            GestureDetector(
              onTap: () {
                cartProvider.removeCard(cart.id);
              },
              child: Row(
                children: [
                  Image.asset(
                    'assets/hapus.png',
                    width: 12,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    'Remove',
                    style: alertTextStyle.copyWith(fontSize: 12),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
