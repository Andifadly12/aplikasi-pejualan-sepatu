import 'package:flutter/material.dart';
import 'package:shamo/page/home/chat_page.dart';
import 'package:shamo/page/home/home_page.dart';
import 'package:shamo/page/home/profile_page.dart';
import 'package:shamo/page/home/wishlist_page.dart';
import 'package:shamo/theme.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget cardButton() {
      return FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/card');
        },
        backgroundColor: secondaryColor,
        child: Image.asset(
          'assets/Cart Icon.png',
          width: 20,
        ),
      );
    }

    Widget customBottmNav() {
      //membuat lengkungan pada kanan dan kiri
      return ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        //agar lengkungan pada button ditengah
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 12,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            //agar bisa menentukan yang mana page yang ingindi buka
            backgroundColor: backgroundColor4,
            currentIndex: currentIndex,
            onTap: (value) {
              // print(value); untuk mengetes agar mengetahui apakah page jalan atau tidak
              setState(() {
                currentIndex = value;
              });
            },
            //agar warnanya berubah
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 20, bottom: 10),
                    child: Image.asset(
                      'assets/Home.png',
                      width: 21,
                      //jika currentIndex = 0 maka tombol home akan berubah menjadi ungu
                      color:
                          currentIndex == 0 ? primaryColor : Color(0xff808191),
                    ),
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 20, bottom: 10),
                    child: Image.asset(
                      'assets/Chat Icon.png',
                      width: 20,
                      //jika currentIndex = 1 maka tombol home akan berubah menjadi ungu
                      color:
                          currentIndex == 1 ? primaryColor : Color(0xff808191),
                    ),
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 20, bottom: 10),
                    child: Image.asset(
                      'assets/wishlist.png',
                      width: 20,
                      //jika currentIndex = 2 maka tombol home akan berubah menjadi ungu
                      color:
                          currentIndex == 2 ? primaryColor : Color(0xff808191),
                    ),
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 20, bottom: 10),
                    child: Image.asset(
                      'assets/name.png',
                      width: 18,
                      //jika currentIndex = 3 maka tombol home akan berubah menjadi ungu
                      color:
                          currentIndex == 3 ? primaryColor : Color(0xff808191),
                    ),
                  ),
                  label: ''),
            ],
          ),
        ),
      );
    }

    //untuk mebuka page page yang sudah di sediakan
    Widget body() {
      switch (currentIndex) {
        case 0:
          return HomePage();
          break;
        case 1:
          return ChatPage();
          break;
        case 2:
          return WishlistPage();
          break;
        case 3:
          return ProfilePage();
          break;
        default:
          return HomePage();
      }
    }

    return Scaffold(
      backgroundColor: currentIndex == 0 ? backgroundColor1 : backgroundColor3,
      //membuat button bawah kanan untuk menmabah
      floatingActionButton: cardButton(),
      //membuat button ditengah bawah
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //membuat button yng di bawah
      bottomNavigationBar: customBottmNav(),
      body: body(),
    );
  }
}
