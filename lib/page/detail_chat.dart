import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/chat_bubble.dart';

class DetailChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      //untuk membuat app bar
      return PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            backgroundColor: backgroundColor1,
            //agar titilenya tidak berada dit engah
            centerTitle: false,
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo_shop.png',
                  width: 50,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shoe Store',
                        style: primaryTextStyle.copyWith(
                            fontSize: 14, fontWeight: medium),
                      ),
                      Text(
                        'online',
                        style: secondaryTextStyle.copyWith(
                            fontSize: 14, fontWeight: light),
                      )
                    ],
                  ),
                )
              ],
            ),
          ));
    }

    //membuat isi chat
    Widget productInput() {
      return Container(
        width: 225,
        height: 74,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            color: backgroundColor5,
            //membuat border
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: primaryTextColor)),
        child: Row(
          //untuk membuat diatas clos
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              //membuat border pada gambar sepatu
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/shoes.png',
                width: 54,
              ),
            ),
            SizedBox(
              width: 6,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'COURT VISIO...',
                    style: primaryTextStyle.copyWith(
                        //agar tuliasan tidak overflow
                        fontSize: 14,
                        overflow: TextOverflow.ellipsis),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    '\$57,15',
                    style: priceTextStyle.copyWith(
                        fontSize: 14, fontWeight: medium),
                  ),
                ],
              ),
            ),

            // membuat button exit
            Image.asset(
              'assets/exit.png',
              width: 22,
            )
          ],
        ),
      );
    }

    // untuk mengimpput chat pada footer tersebut
    Widget chatInput() {
      return Container(
        margin: EdgeInsets.all(20),
        child: Column(
          //agar ukurnya seminimal mungkin atau setinggi chidrennya
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            productInput(),
            Row(children: [
              //untuk
              Expanded(
                child: Container(
                  height: 45,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                      color: backgroundColor4,
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: TextFormField(
                      //collapsed untuk menghilangka garis pada imput
                      decoration: InputDecoration.collapsed(
                          //untuk membuat tex dalam  imput
                          hintText: 'Type message...',
                          hintStyle: subtitleTextStyle),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Image.asset(
                'assets/Send Button.png',
                width: 45,
              )
            ]),
          ],
        ),
      );
    }
    // membuat content chat

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        children: [
          ChatBubble(
            text: ('lakagdfd dffvd fsdfdvvfcdf hhfhggfdgfvrbb dfvg'),
            isSender: true,
            hasProduct: true,
          ),
          ChatBubble(
            text: ('Good night, This item is only available in size 42 and 43'),
            isSender: false,
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      bottomNavigationBar: chatInput(),
      body: content(),
    );
  }
}
