import 'package:flutter/material.dart';
import 'package:shamo/models/cart_model.dart';
import 'package:shamo/theme.dart';

class checkoutCard extends StatelessWidget {
  final CartModel cart;
  checkoutCard(this.cart);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 13),
      color: backgroundColor4,
      child: Row(children: [
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
                style: primaryTextStyle.copyWith(fontWeight: medium),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 2,
              ),
              Text('\$${cart.product.price}', style: priceTextStyle)
            ],
          ),
        ),
        SizedBox(
          width: 12,
        ),
        Text(
          '${cart.qunatity} Items',
          style: secondaryTextStyle.copyWith(fontSize: 12),
        )
      ]),
    );
  }
}
