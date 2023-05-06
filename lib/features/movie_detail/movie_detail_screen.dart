// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:movie_review/config/theme_color.dart';
import 'package:movie_review/features/movie_detail/creators_view.dart';
import 'package:movie_review/features/movie_detail/did_you_know_view.dart';
import 'package:movie_review/features/movie_detail/rating_bottom_sheet.dart';
import 'package:movie_review/features/movie_detail/review_view.dart';
import 'package:movie_review/features/movie_detail/top_cast_view.dart';
import 'package:movie_review/features/movie_detail/video_image_view.dart';

class MovieDetailScreen extends StatefulWidget {
  static const routename = "movie-detail-screen";
  final dynamic movie;

  const MovieDetailScreen({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late dynamic movie;

  @override
  void initState() {
    movie = widget.movie;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40)),
                        ),
                        context: context,
                        builder: (context) => RatingBottomSheet(),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: lightBlack,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star_border,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            "Rate",
                            style: TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(
                  movie["photos"][0] ?? '',
                  height: 30.h,
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              movie["title"],
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              "2022\t\t${movie["region"] ?? ''}",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Wrap(
              runSpacing: 2.h,
              spacing: 10.w,
              children: (movie["genre"] as List).map((name) {
                return Chip(
                  label: Text(
                    name,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: secondaryColor,
                  surfaceTintColor: secondaryColor,
                  shadowColor: secondaryColor,
                );
              }).toList(),
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 4.h,
                      child: Text(
                        (movie["rating"] ?? 0).toString(),
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w900,
                          color: Color(0xffF5C518),
                        ),
                      ),
                    ),
                    Text(
                      (movie["ratedBy"].length ?? 0).toString(),
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 4.h,
                      child: Text(
                        (movie["runtime"] * 60).toString(),
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Text(
                      "${(movie["runtime"]).toString()} min",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 4.h,
                      child: Icon(
                        Icons.share,
                        size: 3.5.h,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Share",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 4.h,
                      child: Icon(
                        Icons.add,
                        size: 3.5.h,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Add",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Text(
                movie["summary"],
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            VideoImageView(
              videos: movie["videos"],
              images: movie["photos"],
            ),
            SizedBox(
              height: 4.h,
            ),
            MovieReview(),
            SizedBox(
              height: 4.h,
            ),
            TopCastView(),
            SizedBox(
              height: 4.h,
            ),
            CreatorsVew(),
            SizedBox(
              height: 4.h,
            ),
            DidYouKnow(),
            SizedBox(
              height: 4.h,
            ),
          ],
        ),
      )),
    );
  }
}
