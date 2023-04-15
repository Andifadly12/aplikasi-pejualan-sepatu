import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/providers/authprovider.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/loding_button.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //membuat controller untuk setiap imputannya
  TextEditingController nameController = TextEditingController(text: '');

  TextEditingController usernameController = TextEditingController(text: '');

  TextEditingController emailController = TextEditingController(text: '');

  TextEditingController passwordController = TextEditingController(text: '');

  bool isLoding = false;
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    handleSingUp() async {
      setState(() {
        isLoding = true;
      });
      if (await authProvider.register(
          name: nameController.text,
          username: usernameController.text,
          email: emailController.text,
          password: passwordController.text)) {
        Navigator.pushNamed(context, '/home');
      } else {
        //menambah flooter untuk bisa mengetahu apakah gagal regster
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: alertColor,
            content: Text(
              'gagal register',
              textAlign: TextAlign.center,
            )));
      }
      setState(() {
        isLoding = false;
      });
    }

    //membuat widget heder untuk lebih mudah menyusunnya
    //widget header
    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        //untuk semuanya ratakiri
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //text Login dan copywith agar kita bisa meruah hurfnya bagaimana
          Text(
            'Sign Up',
            style: primaryTextStyle.copyWith(
              fontSize: 24,
              fontWeight: semiBold,
            ),
          ),
          //untuk jarak antara huruf
          SizedBox(
            height: 2,
          ),
          //text sign it to degna warna huruf sub titile
          Text(
            'Register and Happy Shoping',
            style: subtitleTextStyle,
          )
        ]),
      );
    }

    //widget body
    //widget name imput
    Widget nameInput() {
      return Container(
        //jarak antara widget header dan widget body
        margin: EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Full Name',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            //membuat kolom email
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              //agar semua sisinya mempunyai jarak 16
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                  color: backgroundColor2,
                  borderRadius: BorderRadius.circular(12)),
              // icaon gambar email yg ternadapat di column email
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/Username_Icon.png',
                      width: 17,
                    ),
                    // text input email yang ada pada column email
                    SizedBox(
                      width: 16,
                    ),
                    // expanded agar lebarnya seperti lebar colom ygng di buat
                    Expanded(
                        child: TextFormField(
                      // jika dimput warna tulisannya primaryTesxtStyle
                      style: primaryTextStyle,

                      //controller
                      controller: nameController,
                      //collaps agar saat mengimput tidak mempunyai geris bawah
                      decoration: InputDecoration.collapsed(
                          hintText: 'Your Full Name',
                          hintStyle: subtitleTextStyle),
                    ))
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    //widget password
    Widget UsernameInput() {
      return Container(
        //jarak antara widget email dan widget password
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            //membuat kolom password
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              //agar semua sisinya mempunyai jarak 16
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                  color: backgroundColor2,
                  borderRadius: BorderRadius.circular(12)),
              // icaon gambar email yg ternadapat di column email
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/username.png',
                      width: 17,
                    ),
                    // text input email yang ada pada column email
                    SizedBox(
                      width: 16,
                    ),
                    // expanded agar lebarnya seperti lebar colom ygng di buat
                    Expanded(
                        child: TextFormField(
                      // jika dimput warna tulisannya primaryTesxtStyle
                      style: primaryTextStyle,
                      //controller
                      controller: usernameController,
                      //collaps agar saat mengimput tidak mempunyai geris bawah
                      decoration: InputDecoration.collapsed(
                          hintText: 'Your Password',
                          hintStyle: subtitleTextStyle),
                    ))
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    //widget email
    Widget emailInput() {
      return Container(
        //jarak antara widget header dan widget body
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email Address',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            //membuat kolom email
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              //agar semua sisinya mempunyai jarak 16
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                  color: backgroundColor2,
                  borderRadius: BorderRadius.circular(12)),
              // icaon gambar email yg ternadapat di column email
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/Email_Icon.png',
                      width: 17,
                    ),
                    // text input email yang ada pada column email
                    SizedBox(
                      width: 16,
                    ),
                    // expanded agar lebarnya seperti lebar colom ygng di buat
                    Expanded(
                        child: TextFormField(
                      // jika dimput warna tulisannya primaryTesxtStyle
                      style: primaryTextStyle,
                      //controller
                      controller: emailController,
                      //collaps agar saat mengimput tidak mempunyai geris bawah
                      decoration: InputDecoration.collapsed(
                          hintText: 'Your Email Address',
                          hintStyle: subtitleTextStyle),
                    ))
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    //widget password
    Widget passwordInput() {
      return Container(
        //jarak antara widget email dan widget password
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            //membuat kolom password
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              //agar semua sisinya mempunyai jarak 16
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                  color: backgroundColor2,
                  borderRadius: BorderRadius.circular(12)),
              // icaon gambar email yg ternadapat di column email
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/Password_Icon.png',
                      width: 17,
                    ),
                    // text input email yang ada pada column email
                    SizedBox(
                      width: 16,
                    ),
                    // expanded agar lebarnya seperti lebar colom ygng di buat
                    Expanded(
                        child: TextFormField(
                      // jika dimput warna tulisannya primaryTesxtStyle
                      style: primaryTextStyle,
                      //controller
                      controller: passwordController,
                      //agar pasword tidak kelihatan
                      obscureText: true,
                      //collaps agar saat mengimput tidak mempunyai geris bawah
                      decoration: InputDecoration.collapsed(
                          hintText: 'Your Password',
                          hintStyle: subtitleTextStyle),
                    ))
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    //widget button
    Widget signUpButton() {
      return Container(
          height: 50,
          //agar tombaol button selebar layar aplikasi
          width: double.infinity,
          margin: EdgeInsets.only(top: 30),
          child: TextButton(
            onPressed: handleSingUp,
            style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                //untuk memberi border radius
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            child: Text(
              'Sign Up',
              style:
                  primaryTextStyle.copyWith(fontSize: 12, fontWeight: medium),
            ),
          ));
    }

    //widget footer
    Widget footer() {
      return Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Already have an accaunt?",
              style: subtitleTextStyle.copyWith(fontSize: 12),
            ),
            GestureDetector(
              onTap: () {
                // widget agar bisa kembali kehalaman sebelumnya
                Navigator.pop(context);
              },
              child: Text(
                ' Sign in',
                style:
                    purpuleTextStyle.copyWith(fontSize: 12, fontWeight: medium),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
        backgroundColor: backgroundColor1,
        //agar tidak muncul button over flow
        resizeToAvoidBottomInset: false,
        //savearea agar tidak ketutupi navbarnya
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                nameInput(),
                UsernameInput(),
                emailInput(),
                passwordInput(),
                //agar tulisannya kebawah untuk embuat footer
                isLoding ? LoadingButton() : signUpButton(),
                Spacer(),
                footer()
              ],
            ),
          ),
        ));
  }
}
