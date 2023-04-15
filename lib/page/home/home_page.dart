import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/user_model.dart';
import 'package:shamo/providers/authprovider.dart';
import 'package:shamo/providers/product_provider.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/product.tile.dart';
import 'package:shamo/widgets/product_card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //menambahkan providenya
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserMadel user = authProvider.user;
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultMargin, right: defaultMargin, left: defaultMargin),
        child: Row(
          children: [
            //agar tidak overflow
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hallo, ${user.name}",
                    style: primaryTextStyle.copyWith(
                        fontSize: 24, fontWeight: semiBold),
                  ),
                  Text(
                    "@${user.username}",
                    style: subtitleTextStyle.copyWith(fontSize: 16),
                  )
                ],
              ),
            ),
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(user.profilePhotoUrl))),
            )
          ],
        ),
      );
    }

    //membuat widget kategory

    Widget categories() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        //untuk bisa di scrol
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            SizedBox(
              width: defaultMargin,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: subtitleColor),
                  color: primaryColor),
              child: Text(
                'All shoes',
                style:
                    primaryTextStyle.copyWith(fontSize: 13, fontWeight: medium),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: subtitleColor),
                  color: trasparentColor),
              child: Text(
                'Running',
                style:
                    primaryTextStyle.copyWith(fontSize: 13, fontWeight: medium),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: subtitleColor),
                  color: trasparentColor),
              child: Text(
                'Training',
                style:
                    primaryTextStyle.copyWith(fontSize: 13, fontWeight: medium),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: subtitleColor),
                  color: trasparentColor),
              child: Text(
                'Baskettball',
                style:
                    primaryTextStyle.copyWith(fontSize: 13, fontWeight: medium),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: subtitleColor),
                  color: trasparentColor),
              child: Text(
                'Hiking',
                style:
                    primaryTextStyle.copyWith(fontSize: 13, fontWeight: medium),
              ),
            )
          ]),
        ),
      );
    }

    //membuat popupalr produk title

    Widget popularProducksTitle() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultMargin, left: defaultMargin, right: defaultMargin),
        child: Text(
          'Popular Producs',
          style: primaryTextStyle.copyWith(fontSize: 22, fontWeight: semiBold),
        ),
      );
    }

    //mamebuat produk popular

    Widget popularProducks() {
      return Container(
          margin: EdgeInsets.only(top: 14),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: defaultMargin,
                ),
                Row(
                  children: productProvider.products
                      .map((product) => ProductCard(product))
                      .toList(),
                )
              ],
            ),
          ));
    }

    //title arival produk
    Widget NewArrivalTitle() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultMargin, left: defaultMargin, right: defaultMargin),
        child: Text(
          'New Arivals',
          style: primaryTextStyle.copyWith(fontSize: 22, fontWeight: semiBold),
        ),
      );
    }

    //arival produk
    Widget ArivalProducks() {
      return Container(
          margin: EdgeInsets.only(top: 14),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
                children: productProvider.products
                    .map((product) => ProductTile(product))
                    .toList()),
          ));
    }

    return ListView(
      children: [
        header(),
        categories(),
        popularProducksTitle(),
        popularProducks(),
        NewArrivalTitle(),
        ArivalProducks()
      ],
    );
  }
}
