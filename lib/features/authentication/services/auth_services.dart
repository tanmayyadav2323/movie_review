import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_review/config/global_variables.dart';
import 'package:movie_review/models/user_model.dart';
import 'package:movie_review/navbar_screen.dart';
import 'package:movie_review/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../config/error_handling.dart';
import '../../../config/utils.dart';

String userId ="";

class AuthService {
  Future<String> authenticateUserPhone(
      {required String phoneNumber, required BuildContext context}) async {
    try {
      User user = User(
        phone: phoneNumber,
        id: "",
        name: "",
        email: "",
        password: "",
        imageUrl: "",
        token: "",
        description: "",
      );

      http.Response res = await http.post(
        Uri.parse('$uri/api/authenticatePhone'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: user.toJson(),
      );

      log(res.toString());

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          userId = jsonDecode(res.body)["data"]['userId'];
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }

    return userId;
  }

  Future<void> verifyPhoneNumber(
      {required String otp,
      required BuildContext context,
      required String id}) async {
    try {
      log(id.toString());
      http.Response res = await http.post(
        Uri.parse('$uri/api/verifyPhone'),
        body: jsonEncode({"otp": otp, "userId": id}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      log(res.body.toString());
      // ignore: use_build_context_synchronously
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          log("hello");
          Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          log("hello");
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs
              .setString('x-auth-token', jsonDecode(res.body)["data"]['token'])
              .then((value) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              NavBarScreeen.routename,
              (route) => false,
            );
          });
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  //get user data
  Future<void> getUserData(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
        return;
      }

      var tokenRes = await http.post(Uri.parse('$uri/tokenIsValid'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
          });

      var response = jsonDecode(tokenRes.body);
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      if (response == true) {
        http.Response userRes = await http.get(Uri.parse('$uri/'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'x-auth-token': token
            });
        print(userRes.body);
        userProvider.setUser(userRes.body);
      }
      await http.post(Uri.parse('$uri/tokenIsValid'));
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void logOut(BuildContext context) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.setString('x-auth-token', '');
      // Navigator.pushNamedAndRemoveUntil(
      //   context,
      //   LoginScreen.routename,
      //   (route) => false,
      // );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
