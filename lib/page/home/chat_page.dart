import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/chat_file.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //widget header pada konten chat
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        //agar titlenya bisa ditengah
        centerTitle: true,
        title: Text(
          'Message Support',
          style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
        ),
        //agar tidak ada banyangan
        elevation: 0,
        //agar tidak ada tombol kembali
        automaticallyImplyLeading: false,
      );
    }

    //membuat emty chat atau chat yang masuk
    Widget Empty() {
      return Expanded(
          child: Container(
        width: double.infinity,
        color: backgroundColor3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/hedset_icon.png',
              width: 80,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Opss no message yet?',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'You have never done a transaction',
              style: secondaryTextStyle.copyWith(fontSize: 14),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 44,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                    backgroundColor: primaryColor,
                    //menambahakan borderraidus
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                child: Text(
                  'Explorre Store',
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium),
                ),
              ),
            )
          ],
        ),
      ));
    }
    //widget konten pada halama pertama

    Widget content() {
      //untuk memberitahu bahawa sisah dari header akan diisi oleh conten
      return Expanded(
          child: Container(
        width: double.infinity,
        color: backgroundColor3,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [ChatFile()],
        ),
      ));
    }

    return Column(
      children: [header(), content()],
    );
  }
}
