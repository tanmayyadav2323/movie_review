import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movie_review/config/error_handling.dart';
import 'package:movie_review/models/user_model.dart';
import 'package:http/http.dart' as http;

import '../../../config/global_variables.dart';
import '../../../config/utils.dart';

class MovieService {
  Future<List<dynamic>> getTrendingMovies(
      {required BuildContext context}) async {
    List<dynamic> trndingMovies = [];
    try {
      http.Response res = await http.get(
        Uri.parse('$uri/api/trending-movies'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );

      log(res.toString());

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          trndingMovies = jsonDecode(res.body);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }

    return trndingMovies;
  }
}
