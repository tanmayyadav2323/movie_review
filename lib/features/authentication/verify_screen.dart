// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movie_review/features/authentication/services/auth_services.dart';

import 'package:sizer/sizer.dart';
import 'package:sms_autofill/sms_autofill.dart';

class VerifyPhoneNumberScreen extends StatefulWidget {
  static const routename = '/verify-phone-screen';
  final String userId;
  final String phoneNumber;

  const VerifyPhoneNumberScreen({
    Key? key,
    required this.userId,
    required this.phoneNumber,
  }) : super(key: key);
  @override
  _VerifyPhoneNumberScreenState createState() =>
      _VerifyPhoneNumberScreenState();
}

class _VerifyPhoneNumberScreenState extends State<VerifyPhoneNumberScreen>
    with SingleTickerProviderStateMixin {
  final AuthService _authService = AuthService();
  AnimationController? _animationController;
  int levelClock = 120;

  bool isButtonDisabled = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(seconds: levelClock));

    _animationController!.forward();

    _animationController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isButtonDisabled = false;
        });
      }
    });

    _listenSmsCode();
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    _animationController!.dispose();
    super.dispose();
  }

  _listenSmsCode() async {
    await SmsAutoFill().listenForCode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    "OTP Verification",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Text(
                      "Enter the OTP that sent on your mobile number through SMS",
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Resend OTP in",
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Countdown(
                        animation: StepTween(
                          begin: levelClock,
                          end: 0,
                        ).animate(_animationController!),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PinFieldAutoFill(
                          onCodeChanged: (String? value) async {
                            if (value != null && value.length == 6) {
                              String otp = value.toString();
                              await _authService.verifyPhoneNumber(
                                otp: otp,
                                context: context,
                                id: widget.userId,
                              );
                            }
                          },
                          codeLength: 6,
                          autoFocus: true,
                          decoration: BoxLooseDecoration(
                            textStyle: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                            bgColorBuilder:
                                FixedColorBuilder(Colors.transparent),
                            strokeColorBuilder: FixedColorBuilder(Colors.white),
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Didn’t receive the code ?",
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            OutlinedButton(
                              style: ButtonStyle(
                                side: MaterialStateProperty.all<BorderSide>(
                                  isButtonDisabled
                                      ? BorderSide(
                                          color: Color(0xffB70450), width: 0.5)
                                      : BorderSide(
                                          color: Colors.white, width: 0.5),
                                ),
                              ),
                              onPressed: isButtonDisabled
                                  ? null
                                  : () {
                                      _animationController!.reset();
                                      _animationController!.forward();
                                      isButtonDisabled = true;
                                      setState(() {});
                                    },
                              child: Text(
                                "Resend",
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w300,
                                  color: isButtonDisabled
                                      ? Color(0xffB70450)
                                      : Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Countdown extends AnimatedWidget {
  Countdown({Key? key, required this.animation})
      : super(key: key, listenable: animation);
  Animation<int> animation;

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);

    String timerText =
        '${clockTimer.inMinutes.remainder(60).toString()}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';
    return Text(
      timerText,
      style: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
