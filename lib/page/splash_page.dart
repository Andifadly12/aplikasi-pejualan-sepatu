import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/product_model.dart';
import 'package:shamo/providers/product_provider.dart';
import 'package:shamo/theme.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  // durasi waktu antara home page dengan login
  void initState() {
    getInit();
    super.initState();
  }

  getInit() async {
    await Provider.of<ProductProvider>(context, listen: false).getProducts();
    Navigator.pushNamed(context, '/sign-in');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //membuat backrout pada body
      backgroundColor: backgroundColor1,
      body: Center(
          //menggunakan container karna ingin meggunakan widgade dekoration
          child: Container(
        width: 130,
        height: 150,
        decoration: BoxDecoration(
            image:
                //memasukkan image
                DecorationImage(image: AssetImage('assets/image_splash.png'))),
      )),
    );
  }
}