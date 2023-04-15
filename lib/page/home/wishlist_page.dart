import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/providers/wishlist_provider.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/wishlist_cart.dart';

class WishlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    Widget header() {
      return AppBar(
        //bacround dari header
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text(
          'Favorite Shoes',
          style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    //membuat widget empity wishly

    Widget emptyWishlist() {
      return Expanded(
        child: Container(
          color: backgroundColor3,
          //contanernya selebar layar
          width: double.infinity,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              'assets/iconlove.png',
              width: 100,
            ),
            SizedBox(height: 28),
            Text(
              'You dont \'t have dream shoes?',
              style:
                  primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Let\'s find your favorite shoes',
              style: secondaryTextStyle.copyWith(fontSize: 14),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 44,
              child: TextButton(
                onPressed: () {},
                //untuk menambahakan style pada button
                style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                child: Text(
                  'Explore Store',
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium),
                ),
              ),
            )
          ]),
        ),
      );
    }

    //membuat content untuk widget wishlis

    Widget content() {
      return Expanded(
          child: Container(
        margin: EdgeInsets.only(top: 10),
        color: backgroundColor3,
        child: ListView(
          children: wishlistProvider.wishlist
              .map((product) => WishlistCart(product))
              .toList(),
        ),
      ));
    }

    return Column(
      children: [
        header(),
        wishlistProvider.wishlist.length == 0 ? emptyWishlist() : content()
      ],
    );
  }
}
