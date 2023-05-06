// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:movie_review/features/movie_detail/screens/comment_screen.dart';
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
  List<CommentBox> comments = [
    CommentBox(),
    CommentBox(),
    CommentBox(),
    CommentBox(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
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
                  child: ReviewBox(
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
                            .pushNamed(CommentScreen.routename);
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
                  children: comments,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
