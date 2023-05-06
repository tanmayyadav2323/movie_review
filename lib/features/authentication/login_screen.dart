// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_review/features/authentication/services/auth_services.dart';
import 'package:movie_review/widgets/custom_button.dart';
import 'package:sizer/sizer.dart';

import 'package:movie_review/features/authentication/square_tile.dart';
import 'package:movie_review/features/authentication/verify_screen.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../config/utils.dart';

class LoginPage extends StatefulWidget {
  static const routename = "/login-page";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();

    SmsAutoFill().getAppSignature.then((signature) {
      setState(() {
        print("Signature:${signature}");
      });
    });
  }

  final AuthService _authService = AuthService();

  final phoneNumberController = TextEditingController();

  void signUserIn() {}
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0XFF0a0a0a),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Icon(
                  Icons.movie_filter_rounded,
                  size: 12.h,
                  color: Color(0xffF5C518),
                ),
                Text(
                  'Movie Mavens',
                  style: TextStyle(
                    color: Color(0xffffffff),
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 8.h),

                Text(
                  'Welcome you\'ve been missed!',
                  style: TextStyle(
                    color: Color(0xffffffff),
                    fontSize: 12.sp,
                  ),
                ),

                SizedBox(height: 4.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: TextField(
                    controller: phoneNumberController,
                    obscureText: false,
                    cursorColor: Colors.white,
                    onChanged: (value) {
                      if (value.length == 10) {
                        FocusScope.of(context).unfocus();
                      }
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      fillColor: const Color(0xFF202020),
                      filled: true,
                      hintText: "Enter Your Phone Number",
                      hintStyle: const TextStyle(color: Color(0xFFb4b4b4)),
                    ),
                  ),
                ),

                SizedBox(height: 4.h),

                // sign in button
                CustomButton(
                  text: "Login",
                  isLoading: isloading,
                  onPressed: () async {
                    if (isloading == false) {
                      setState(() {
                        isloading = true;
                      });
                      if (phoneNumberController.text.length != 10) {
                        showSnackBar(
                          context,
                          "Phone number must be of 10 digits",
                        );
                      } else {
                      String userId =
                            await _authService.authenticateUserPhone(
                          phoneNumber: phoneNumberController.text,
                          context: context,
                        );

                        Navigator.of(context).pushNamed(
                          VerifyPhoneNumberScreen.routename,
                          arguments: [userId, phoneNumberController.text],
                        ).then((value) {});
                      }
                      setState(() {
                        isloading = false;
                      });
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
