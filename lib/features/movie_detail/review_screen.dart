// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movie_review/features/movie_detail/screens/comment_screen.dart';
import 'package:movie_review/features/movie_detail/services/movie_service.dart';
import 'package:movie_review/models/comment_model.dart';
import 'package:sizer/sizer.dart';

import 'package:movie_review/config/theme_color.dart';
import 'package:movie_review/features/movie_detail/comment_box.dart';
import 'package:movie_review/features/movie_detail/review_box.dart';
import 'package:movie_review/models/review_model.dart';

class ReviewScreen extends StatefulWidget {
  final Review review;
  static const routename = '/review-screen';

  const ReviewScreen({
    Key? key,
    required this.review,
  }) : super(key: key);

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  final MovieService movieService = MovieService();
  List<Comment> comments = [];
  bool isLoading = true;

  @override
  void initState() {
    getComments();
    super.initState();
  }

  getComments() async {
    comments = await movieService.getComment(
      context: context,
      reviewId: widget.review.id,
    );
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 2.w),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Align(
                        child: CustomReviewBox(
                          review: widget.review,
                        ),
                        alignment: Alignment.center,
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Row(
                        children: [
                          Text(
                            "Comments",
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.w600),
                          ),
                          Spacer(),
                          GestureDetector(
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 4.h,
                            ),
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(
                                CommentScreen.routename,
                                arguments: widget.review.id,
                              )
                                  .then((comment) {
                                if (comment != null) {
                                  comments.add(comment as Comment);
                                  setState(() {});
                                }
                              });
                            },
                          ),
                          SizedBox(
                            width: 2.w,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Column(
                        children: comments.map((comment) {
                          return CommentBox(
                            comment: comment,
                          );
                        }).toList(),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

class CustomReviewBox extends StatefulWidget {
  final Review review;
  final bool expand;

  const CustomReviewBox({
    Key? key,
    required this.review,
    this.expand = false,
  }) : super(key: key);

  @override
  State<CustomReviewBox> createState() => _CustomReviewBoxState();
}

class _CustomReviewBoxState extends State<CustomReviewBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ReviewScreen.routename, arguments: widget.review);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 2.w),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color(0xff171717),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 1.h,
              ),
              Row(
                children: [
                  Text(
                    widget.review.name.isEmpty ? "Guest" : widget.review.name,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                widget.review.title,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (widget.review.spolier)
                Text(
                  "Warning: Spoilers ",
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffFF0000),
                  ),
                ),
              if (widget.review.spolier)
                SizedBox(
                  height: 1.h,
                ),
              Text(
                widget.review.desciption,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  wordSpacing: 1.2,
                  height: 1.5,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 2.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
