import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/providers/authprovider.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/loding_button.dart';

class SingInPage extends StatefulWidget {
  @override
  State<SingInPage> createState() => _SingInPageState();
}

class _SingInPageState extends State<SingInPage> {
  TextEditingController emailController = TextEditingController(text: '');

  TextEditingController passwordController = TextEditingController(text: '');

  bool isLoding = false;
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    handleSingIn() async {
      setState(() {
        isLoding = true;
      });
      if (await authProvider.login(
          email: emailController.text, password: passwordController.text)) {
        Navigator.pushNamed(context, '/home');
      } else {
        //menambah flooter untuk bisa mengetahu apakah gagal regster
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: alertColor,
            content: Text(
              'gagal lllogin',
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
            'Login',
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
            'Sign In to Continue',
            style: subtitleTextStyle,
          )
        ]),
      );
    }

    //widget body
    //widget email
    Widget emailInput() {
      return Container(
        //jarak antara widget header dan widget body
        margin: EdgeInsets.only(top: 70),
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
                      //mambuat controller
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
                      //agar pasword tidak kelihatan
                      obscureText: true,
                      //membuat controller password
                      controller: passwordController,
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
    Widget signInButton() {
      return Container(
          height: 50,
          //agar tombaol button selebar layar aplikasi
          width: double.infinity,
          margin: EdgeInsets.only(top: 30),
          child: TextButton(
            onPressed: handleSingIn,
            style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                //untuk memberi border radius
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            child: Text(
              'Sign In',
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
              "Don't have an account?",
              style: subtitleTextStyle.copyWith(fontSize: 12),
            ),
            //membuat on tipe untuk memidakan kehalaman sign up page
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/sign-up');
              },
              child: Text(
                ' Sign Up',
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
                emailInput(),
                passwordInput(),
                isLoding ? LoadingButton() : signInButton(),
                //agar tulisannya kebawah untuk embuat footer
                Spacer(),
                footer()
              ],
            ),
          ),
        ));
  }
}
