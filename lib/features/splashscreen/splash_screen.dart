import 'package:flutter/material.dart';
import 'package:movie_review/features/authentication/login_screen.dart';
import 'package:movie_review/navbar_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../models/user_model.dart' as UserModel;
import '../../providers/user_provider.dart';
import '../authentication/services/auth_services.dart';

class SplashScreen extends StatefulWidget {
  static const routename = '/splashscreen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    checkUserData();
    super.initState();
  }

  void checkUserData() async {
    await authService.getUserData(context).then((value) async {
      final UserModel.User user =
          Provider.of<UserProvider>(context, listen: false).user;

      if (user.token.isEmpty) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          LoginPage.routename,
          (route) => false,
        );
      } else {
        Navigator.pushNamedAndRemoveUntil(
          context,
          NavBarScreeen.routename,
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
