import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movie_review/config/error_handling.dart';
import 'package:movie_review/models/review_model.dart';
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

  Future<void> submitReview(
      {required BuildContext context, required Review review}) async {
    try {
      http.Response res = await http.post(Uri.parse('$uri/api/review-movie'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          },
          body: review.toJson());

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {},
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<List<Review>> getReviews(
      {required BuildContext context, required List<dynamic> reviewIds}) async {
    List<Review> reviews = [];
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/find-review'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode({"reviewIds": reviewIds}),
      );

      log(res.body);

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            reviews.add(Review.fromJson(jsonEncode(
              jsonDecode(
                res.body,
              )[i],
            )));
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return reviews;
  }
}
