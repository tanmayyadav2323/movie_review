import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_review/config/error_handling.dart';
import 'package:movie_review/models/review_model.dart';
import 'package:movie_review/models/user_model.dart';
import 'package:http/http.dart' as http;
import '../../../models/category_model.dart' as Cs;
import '../../../config/global_variables.dart';
import '../../../config/utils.dart';
import '../../../models/comment_model.dart';

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

  Future<List<Cs.Category>> getCategoryMovies(
      {required BuildContext context}) async {
    List<Cs.Category> categoryMovies = [];
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/get-category'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            categoryMovies.add(Cs.Category.fromJson(jsonEncode(
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

    return categoryMovies;
  }

  Future<Review?> submitReview(
      {required BuildContext context, required Review review}) async {
    Review? resreview;
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/review-movie'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: review.toJson(),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          resreview = Review.fromJson(res.body);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return resreview;
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

  Future<Comment?> submitComment(
      {required BuildContext context,
      required String reviewId,
      required Comment comment}) async {
    Comment? rescomment;
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/comment'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode({
          "reviewId": reviewId,
          "description": comment.description,
          "likes": comment.likes,
          "dislikes": comment.dislikes,
          "replies": comment.replies,
          "userId": comment.userId,
          "name": comment.name,
          "imageUrl": comment.imageUrl,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          rescomment = Comment.fromJson(res.body);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return rescomment;
  }

  Future<List<Comment>> getComment(
      {required BuildContext context, required String reviewId}) async {
    List<Comment> comments = [];
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/find-comment'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode({"reviewId": reviewId}),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            comments.add(Comment.fromJson(jsonEncode(
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
    log("checkkkk");
    log(comments.toString());
    return comments;
  }

  Future<dynamic> getMovieById(
      {required BuildContext context, required String id}) async {
    Map<String, dynamic> mp = {};
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/get-movie'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode({
          "id": id,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          mp = jsonDecode(res.body);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return mp;
  }

  Future<void> updateComment(
      {required BuildContext context, required Comment comment}) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/update-comment'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode({
          "id": comment.id,
          "description": comment.description,
          "likes": comment.likes,
          "dislikes": comment.dislikes,
          "replies": comment.replies,
          "userId": comment.userId,
          "name": comment.name,
          "imageUrl": comment.imageUrl,
        }),
      );

      log(res.body);

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {},
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> updateRevieww(
      {required BuildContext context,
      required String id,
      required List<String> likes,
      required List<String> dislikes}) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/update-review'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode({"id": id, "likes": likes, "dislikes": dislikes}),
      );

      log(res.body);

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {},
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
