import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:super_english_app/page/Homepage/HomePage.dart';
import 'package:super_english_app/page/User/signup_page.dart';
import 'package:super_english_app/utils/colors.dart';
import 'package:super_english_app/widget/or_divider.dart';
import 'package:super_english_app/widget/social_icon.dart';

import '../../widget/login_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    void handleOnPressSignUpText() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SignUpPage(),
        ),
      );
    }

    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              screenSize.width * 0.05,
              screenSize.height * 0.1,
              screenSize.width * 0.05,
              screenSize.height * 0.1),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                  Widget>[
            Container(
                alignment: Alignment.center,
                child: Image(image: AssetImage('assets/images/res-logo.png'))),
            SizedBox(
              height: screenSize.height * 0.05,
            ),
            const Text(
              'Đăng nhập để tiếp tục',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            Form(
                child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 7, color: Colors.black.withOpacity(0.1))
                      ]),
                  child: Padding(
                    padding: EdgeInsets.only(left: screenSize.width * 0.05),
                    child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          hintText: 'Email', border: InputBorder.none),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 7, color: Colors.black.withOpacity(0.1))
                      ]),
                  child: Padding(
                    padding: EdgeInsets.only(left: screenSize.width * 0.05),
                    child: TextFormField(
                      controller: passController,
                      obscureText: isObscure,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                          hintText: 'Mật khẩu',
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                            icon: isObscure
                                ? Image(
                                    image:
                                        AssetImage('assets/images/eyeOff.png'),
                                    height: screenSize.height * 0.03,
                                    width: screenSize.width * 0.05,
                                  )
                                : Image(
                                    image:
                                        AssetImage('assets/images/eyeOn.png'),
                                    height: screenSize.height * 0.03,
                                    width: screenSize.width * 0.05,
                                  ),
                            onPressed: () => setState(() {
                              isObscure = !isObscure;
                            }),
                          )),
                    ),
                  ),
                ),
              ],
            )),
            SizedBox(
              height: screenSize.height * 0.05,
            ),
            Container(
              alignment: Alignment.center,
              height: screenSize.height * 0.06,
              child: reusable_button(context, "Sign In", () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passController.text)
                      .then((value) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                }),
            ),
            SizedBox(
              height: screenSize.height * 0.1,
            ),
            Container(
              alignment: Alignment.center,
              child: OrDivider(
                text: 'Hoặc đăng nhập với',
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.01,
            ),
            Container(
              // color: Colors.amber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocialIcon(
                    iconSrc: 'assets/images/apple.png',
                    press: () {},
                  ),
                  SocialIcon(
                    iconSrc: 'assets/images/google.png',
                    press: () {},
                  ),
                  SocialIcon(
                    iconSrc: 'assets/images/fb.png',
                    press: () {},
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: screenSize.height * 0.1),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Chưa có tài khoản? ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              InkWell(
                child: Text(
                  'Đăng ký',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: MyColor.mainColor),
                ),
                onTap: handleOnPressSignUpText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
