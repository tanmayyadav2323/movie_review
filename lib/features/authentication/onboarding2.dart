import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_review/features/authentication/onboarding3.dart';

class OnboardingScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0a0a0a),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/animations/my_lottie_file.json',
                    width: 350,
                    height: 350,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    height: 50.0,
                    width: double.infinity,
                    child: Text(
                      'Rate the Movies',
                      style: TextStyle(
                        fontFamily: 'SF Pro',
                        color: Color(0xFFFFFFFF),
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    height: 70.0,
                    width: double.infinity,
                    child: Text(
                      'Create your profile and share your opinions on the latest movies.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontFamily: 'SF Pro',
                        color: Color(0xFFb4b4b4),
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    height: 60.0,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OnboardingScreen3(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0XFFf5c518),
                      ),
                      child: const Text(
                        'Next',
                        style: TextStyle(
                          color: Color(0XFF000000),
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
