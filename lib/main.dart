import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/cart_model.dart';
import 'package:shamo/page/card_page.dart';
import 'package:shamo/page/checkout_page.dart';
import 'package:shamo/page/checkout_success.dart';
import 'package:shamo/page/detail_chat.dart';
import 'package:shamo/page/edit_profile.dart';
import 'package:shamo/page/home/main_page.dart';
import 'package:shamo/page/product_page.dart';
import 'package:shamo/page/sign_in_page.dart';
import 'package:shamo/page/sign_up_page.dart';
import 'package:shamo/page/splash_page.dart';
import 'package:shamo/providers/authprovider.dart';
import 'package:shamo/providers/cart_provider.dart';
import 'package:shamo/providers/product_provider.dart';
import 'package:shamo/providers/transaction_provider.dart';
import 'package:shamo/providers/wishlist_provider.dart';
import 'package:shamo/services/auth_services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //membuat perovider pada halaman regis dan login
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        //membuat provider pada halaman product
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        //membuat provider pada halaman wihlist
        ChangeNotifierProvider(create: (context) => WishlistProvider()),
        //memebuat provider pada halaman cart
        ChangeNotifierProvider(create: (context) => CartProvider()),
        //membuat halaman provider pada chelout
        ChangeNotifierProvider(create: (context) => TransactionProvider())
      ],
      child: MaterialApp(
        //untuk menghilangkan bennner DEBUG pada tampilan layar
        debugShowCheckedModeBanner: false,
        //roote pengan ti home untuk menjalankan [ackage yang kita buat] dengan menggunakan tipe maps
        routes: {
          // rout /dengan velue context yang akan meriten spashpage
          '/': (context) => SplashPage(),
          // rout / sign-in dengan velue context yang akan merturn SingInPage
          '/sign-in': (context) => SingInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => MainPage(),
          '/detail-chat': (context) => DetailChat(),
          '/edit-profile': (context) => EditProfile(),
          '/card': (context) => cardPage(),
          '/checkout': (context) => checkoutPage(),
          '/checkoutSuccess': (context) => checkoutSuccess()
        },
      ),
    );
  }
}
