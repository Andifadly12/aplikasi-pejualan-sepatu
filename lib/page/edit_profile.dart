import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/user_model.dart';
import 'package:shamo/providers/authprovider.dart';
import 'package:shamo/theme.dart';

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //menambahkan providenya
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserMadel user = authProvider.user;

    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            //untuk secara otomatis akan kembali ke halaman sebelumnya
            Navigator.pushNamedAndRemoveUntil(
                context, '/sign-in', (route) => false);
          },
        ),
        elevation: 0,
        centerTitle: true,
        title: Text('Edit Profil'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.check,
                color: primaryColor,
              ))
        ],
      );
    }

    Widget nameInput() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'name',
            style: secondaryTextStyle.copyWith(fontSize: 13),
          ),
          //untuk membuat imputan
          TextFormField(
            //untuk membuat warna
            style: primaryTextStyle,
            decoration: InputDecoration(
                hintText: user.name,
                hintStyle: primaryTextStyle,
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: subtitleColor))),
          )
        ]),
      );
    }

    Widget UserName() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Username',
            style: secondaryTextStyle.copyWith(fontSize: 13),
          ),
          //untuk membuat imputan
          TextFormField(
            decoration: InputDecoration(
                hintText: '@${user.username}',
                hintStyle: primaryTextStyle,
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: subtitleColor))),
          )
        ]),
      );
    }

    Widget emailName() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Email Address',
            style: secondaryTextStyle.copyWith(fontSize: 13),
          ),
          //untuk membuat imputan
          TextFormField(
            decoration: InputDecoration(
                hintText: user.email,
                hintStyle: primaryTextStyle,
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: subtitleColor))),
          )
        ]),
      );
    }

    Widget userInput() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'name',
            style: secondaryTextStyle.copyWith(fontSize: 13),
          ),
          //untuk membuat imputan
          TextFormField(
            decoration: InputDecoration(
                hintText: user.name,
                hintStyle: primaryTextStyle,
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: subtitleColor))),
          )
        ]),
      );
    }

    Widget content() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: 100,
                height: 100,
                margin: EdgeInsets.only(top: defaultMargin),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(user.profilePhotoUrl))),
              ),
            ),
            nameInput(),
            UserName(),
            emailName()
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor4,
      appBar: header(),
      body: Container(
        child: content(),
      ),
      //agar tidak over floww
      resizeToAvoidBottomInset: false,
    );
  }
}
