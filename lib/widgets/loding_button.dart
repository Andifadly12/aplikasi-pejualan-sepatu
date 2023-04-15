import 'package:flutter/material.dart';

import '../theme.dart';

class LoadingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        //agar tombaol button selebar layar aplikasi
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              //untuk memberi border radius
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 16,
                  height: 16,
                  //menampilkan fiture loding
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation(primaryTextColor),
                  )),
              SizedBox(
                width: 4,
              ),
              Text(
                'Loding',
                style:
                    primaryTextStyle.copyWith(fontSize: 12, fontWeight: medium),
              ),
            ],
          ),
        ));
  }
}
