import 'package:flutter/material.dart';
import 'package:movie_review/config/theme_color.dart';
import 'package:movie_review/features/movie_detail/comment_box.dart';
import 'package:movie_review/features/movie_detail/review_box.dart';
import 'package:sizer/sizer.dart';

class ReviewScreen extends StatefulWidget {
  static const routename = '/review-screen';
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
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
                  // child: ReviewBox(),
                  alignment: Alignment.center,
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  "Comments",
                  style:
                      TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 2.h,
                ),
                CommentBox(),
                CommentBox(),
                CommentBox(),
                CommentBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
