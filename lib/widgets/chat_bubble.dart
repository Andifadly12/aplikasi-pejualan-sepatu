import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isSender;
  final bool hasProduct;

  ChatBubble({this.isSender = false, this.text = '', this.hasProduct = false});
  @override
  Widget build(BuildContext context) {
    Widget productPreview() {
      return Container(
        width: 231,
        margin: EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: isSender ? backgroundColor5 : backgroundColor4,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isSender ? 12 : 0),
            topRight: Radius.circular(isSender ? 0 : 12),
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
        child: Container(
          margin: EdgeInsets.only(top: 12, left: 12),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/shoes.png',
                      width: 70,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'COURT VISION 2.0 SHOE',
                          style: primaryTextStyle.copyWith(fontSize: 14),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          '\$57,15',
                          style: priceTextStyle.copyWith(
                              fontSize: 14, fontWeight: medium),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  //membuat button
                  OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                          // untuk menambah bodernya
                          side: BorderSide(color: primaryColor),
                          shape: RoundedRectangleBorder(
                              //agar sisi bordernya melengkung
                              borderRadius: BorderRadius.circular(8))),
                      child: Text(
                        'Add to Cart',
                        style: primaryTextStyle.copyWith(fontSize: 14),
                      )),
                  SizedBox(
                    width: 8,
                  ),
                  OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                          backgroundColor: backgroundColor5,
                          shape: RoundedRectangleBorder(
                              //agar sisinya melengkung
                              borderRadius: BorderRadius.circular(8))),
                      child: Text(
                        'Buy Now',
                        style: purpuleTextStyle.copyWith(
                            fontSize: 14, fontWeight: medium),
                      ))
                ],
              )
            ],
          ),
        ),
      );
    }

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          hasProduct ? productPreview() : SizedBox(),
          Row(
              mainAxisAlignment:
                  isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Container(
                    //untuk agar tidak full layar pesan chat, 60 % lebar laayar
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.6),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                        color: isSender ? backgroundColor5 : backgroundColor4,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(isSender ? 12 : 0),
                            topRight: Radius.circular(isSender ? 0 : 12),
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12))),
                    child: Text(
                      text,
                      style: primaryTextStyle.copyWith(fontSize: 14),
                    ),
                  ),
                )
              ]),
        ],
      ),
    );
  }
}
