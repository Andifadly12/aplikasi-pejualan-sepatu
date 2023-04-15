import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class ChatFile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail-chat');
      },
      child: Container(
        margin: EdgeInsets.only(top: 33),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/shop_logo.png',
                  width: 54,
                ),
                SizedBox(
                  width: 12,
                ),
                //afar colom memiliki ruangan yang tersisah dan juga untuk mengatasi overflow
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shoe Store',
                        style: primaryTextStyle.copyWith(fontSize: 15),
                      ),
                      Text(
                        'Good night, This item is on',
                        style: secondaryTextStyle.copyWith(
                            fontSize: 14, fontWeight: light),
                        //agar jika tulisannya full akn menjadi ...
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                Text(
                  'Now',
                  style: secondaryTextStyle.copyWith(fontSize: 10),
                )
              ],
            ),
            SizedBox(
              height: 12,
            ),
            //untuk garisnya bawah
            Divider(
              thickness: 1,
              color: Color(0xff2B2939),
            )
          ],
        ),
      ),
    );
  }
}
