import 'dart:ffi';
import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/cart_model.dart';
import 'package:shamo/models/product_model.dart';
import 'package:shamo/providers/cart_provider.dart';
import 'package:shamo/providers/wishlist_provider.dart';
import 'package:shamo/theme.dart';

class pruductPage extends StatefulWidget {
  final ProductModel product;
  pruductPage(this.product);
  @override
  State<pruductPage> createState() => _pruductPageState();
}

class _pruductPageState extends State<pruductPage> {
  List images = ['assets/shoes.png', 'assets/shoes.png', 'assets/shoes.png'];
  List familiarShoses = [
    'assets/shoes.png',
    'assets/shoes.png',
    'assets/shoes.png',
    'assets/shoes.png',
    'assets/shoes.png',
    'assets/shoes.png',
    'assets/shoes.png',
    'assets/shoes.png',
    'assets/shoes.png'
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    CartProvider cartProvider = Provider.of<CartProvider>(context);
    //membuat model dialok untuk bisa mengakrifkan jika sudah du upload
    //membuat function
    Future<void> showSuccessDialog() async {
      return showDialog(
        context: context,
        builder: (BuildContext context) => Container(
          width: MediaQuery.of(context).size.width - (2 * defaultMargin),
          child: AlertDialog(
            backgroundColor: backgroundColor3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            content: SingleChildScrollView(
                child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.close,
                      color: primaryTextColor,
                    ),
                  ),
                ),
                Image.asset(
                  'assets/success.png',
                  width: 100,
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Hurray :)',
                  style: primaryTextStyle.copyWith(
                      fontSize: 18, fontWeight: semiBold),
                ),
                SizedBox(
                  height: 12,
                ),
                Text('Item added successfully', style: secondaryTextStyle),
                Container(
                  width: 154,
                  height: 44,
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/card');
                    },
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: primaryColor),
                    child: Text(
                      'View My Card',
                      style: primaryTextStyle.copyWith(
                          fontSize: 18, fontWeight: medium),
                    ),
                  ),
                )
              ],
            )),
          ),
        ),
      );
    }

    //widget indikator untuk membuat crol terlihat
    Widget indicator(int index) {
      return Container(
        width: currentIndex == index ? 16 : 4,
        height: 4,
        margin: EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: currentIndex == index ? primaryColor : Color(0xffC4C4C4)),
      );
    }

    Widget familiarshosecard(String imageUrl) {
      return Container(
        width: 54,
        height: 54,
        margin: EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            image: DecorationImage(image: AssetImage(imageUrl))),
      );
    }

    //memuat widget header
    Widget header() {
      int index = -1;
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                top: 20, right: defaultMargin, left: defaultMargin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.chevron_left)),
                Icon(
                  Icons.shopping_bag,
                  color: backgroundColor1,
                )
              ],
            ),
          ),
          //untuk menampilkan gambarnya secara beruutan agar bisa di scroll
          CarouselSlider(
              items: widget.product.galleries
                  .map((image) => Image.network(
                        image.url,
                        width: MediaQuery.of(context).size.width,
                        height: 310,
                        fit: BoxFit.cover,
                      ))
                  .toList(),
              options: CarouselOptions(
                  initialPage: 0,
                  //unutk mengikuti insexnya
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  })),
          SizedBox(
            height: 20,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.product.galleries.map((e) {
                index++;
                return indicator(index);
              }).toList())
        ],
      );
    }

    //widget contennya

    Widget content() {
      int index = -1;
      return Container(
        margin: EdgeInsets.only(
          top: 17,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            color: backgroundColor1),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: defaultMargin,
                  left: defaultMargin,
                  right: defaultMargin),
              child: Row(children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.name,
                        style: primaryTextStyle.copyWith(
                            fontSize: 18, fontWeight: semiBold),
                      ),
                      Text(
                        widget.product.category.name,
                        style: secondaryTextStyle.copyWith(fontSize: 12),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    wishlistProvider.setProduct(widget.product);
                    //untuk membuat navbar untuk memastikan kesuksesan suatu inputan yang paling bawa di footer
                    if (wishlistProvider.isWishlist(widget.product)) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: secondaryColor,
                          content: Text(
                            'Has been added to the Whitelist',
                            textAlign: TextAlign.center,
                          )));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: alertColor,
                          content: Text(
                            'Has been removed from the Whitelist',
                            textAlign: TextAlign.center,
                          )));
                    }
                  },
                  child: Image.asset(
                    wishlistProvider.isWishlist(widget.product)
                        ? 'assets/button_love.png'
                        : 'assets/button_wishlist.png',
                    width: 46,
                  ),
                )
              ]),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 330,
              height: 50,
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: backgroundColor4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price starts from',
                    style: primaryTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '\$${widget.product.price}',
                    style: priceTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  ),
                ],
              ),
            ),

            //NOTE Description
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                  top: defaultMargin,
                  left: defaultMargin,
                  right: defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: primaryTextStyle.copyWith(fontWeight: medium),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    widget.product.description,
                    style: subtitleTextStyle.copyWith(fontWeight: light),
                    //untuk rata kiri dan kanan
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            ),
            //Note: familiar sohse
            Container(
              margin: EdgeInsets.only(top: defaultMargin),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: Text(
                      'Fimiliar shose',
                      style: primaryTextStyle.copyWith(fontWeight: medium),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: familiarShoses.map((image) {
                        return Container(
                            margin: EdgeInsets.only(left: index == 0 ? 16 : 0),
                            child: familiarshosecard(image));
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),

            // NOTE :untuk bottumm
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                  top: defaultMargin,
                  bottom: defaultMargin,
                  left: defaultMargin),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/detail-chat');
                },
                child: Row(
                  children: [
                    Container(
                      width: 54,
                      height: 54,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/Button Chat.png'))),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Container(
                      height: 54,
                      width: 245,
                      child: TextButton(
                        onPressed: () {
                          //unutk menambah ke eranjang
                          cartProvider.addCart(widget.product);
                          showSuccessDialog();
                        },
                        //untuk membuat style dari button
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            backgroundColor: primaryColor),
                        child: Text(
                          'Add to Card',
                          style: primaryTextStyle.copyWith(
                              fontSize: 16, fontWeight: semiBold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
        backgroundColor: backgroundColor6,
        body: ListView(
          children: [header(), content()],
        ));
  }
}

class RaundedRectangleBorder {}
