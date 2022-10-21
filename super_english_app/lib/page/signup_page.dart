import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:super_english_app/page/login_page.dart';

import '../utils/colors.dart';
import '../widget/or_divider.dart';
import '../widget/social_icon.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    void handleOnPressLoginText() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
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
              'Tạo tài khoản',
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
                              blurRadius: 7,
                              color: Colors.black.withOpacity(0.1))
                        ]),
                    child: Padding(
                      padding: EdgeInsets.only(left: screenSize.width * 0.05),
                      child: TextFormField(
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
                              blurRadius: 7,
                              color: Colors.black.withOpacity(0.1))
                        ]),
                    child: Padding(
                      padding: EdgeInsets.only(left: screenSize.width * 0.05),
                      child: TextFormField(
                        obscureText: isObscure,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                            hintText: 'Mật khẩu',
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              icon: isObscure
                                  ? Image(
                                      image: AssetImage(
                                          'assets/images/eyeOff.png'),
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
                  SizedBox(
                    height: screenSize.height * 0.02,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 7,
                              color: Colors.black.withOpacity(0.1))
                        ]),
                    child: Padding(
                      padding: EdgeInsets.only(left: screenSize.width * 0.05),
                      child: TextFormField(
                        obscureText: isObscure,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                            hintText: 'Xác nhận mật khẩu',
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              icon: isObscure
                                  ? Image(
                                      image: AssetImage(
                                          'assets/images/eyeOff.png'),
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
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.05,
            ),
            Container(
              alignment: Alignment.center,
              height: screenSize.height * 0.06,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize:
                      Size(screenSize.width * 0.7, screenSize.height * 0.06),
                  primary: MyColor.mainColor,
                  onPrimary: Colors.white,
                ),
                child: FittedBox(
                  child: Text(
                    'Đăng ký',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                onPressed: () {
                  print('Đăng ký');
                },
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.1,
            ),
            Container(
              alignment: Alignment.center,
              child: OrDivider(text: 'Hoặc đăng ký với'),
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
        padding: EdgeInsets.only(bottom: screenSize.height * 0.05),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Đã có tài khoản? ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              InkWell(
                child: Text(
                  'Đăng nhập',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: MyColor.mainColor),
                ),
                onTap: handleOnPressLoginText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
