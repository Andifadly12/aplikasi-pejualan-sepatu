import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/product_model.dart';
import 'package:shamo/providers/wishlist_provider.dart';
import 'package:shamo/theme.dart';

class WishlistCart extends StatelessWidget {
  final ProductModel product;

  WishlistCart(this.product);
  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    return Container(
      width: 354,
      height: 88,
      margin:
          EdgeInsets.only(top: 20, left: defaultMargin, right: defaultMargin),
      decoration: BoxDecoration(
          color: backgroundColor4, borderRadius: BorderRadius.circular(12)),
      child: Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.only(top: 10, left: 12, bottom: 14, right: 20),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                product.galleries[0].url,
                width: 60,
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    product.name,
                    style: primaryTextStyle.copyWith(
                        fontSize: 14, fontWeight: semiBold),
                  ),
                  Text(
                    '\$${product.price}',
                    style: priceTextStyle,
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                wishlistProvider.setProduct(product);
              },
              child: Image.asset(
                'assets/button_love.png',
                width: 34,
              ),
            )
          ],
        ),
      ),
    );
  }
}
