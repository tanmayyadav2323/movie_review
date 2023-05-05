import 'package:flutter/material.dart';
import 'package:movie_review/config/theme_color.dart';
import 'package:movie_review/features/movie_detail/video_image_view.dart';
import 'package:sizer/sizer.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({super.key});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 6.h,
            ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(
                  "assets/images/img3.jpeg",
                  height: 30.h,
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "The Sandman",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              "2022\t\tUnited Kingdom",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Wrap(
              direction: Axis.horizontal,
              children: [
                Chip(
                  label: Text(
                    "Fantasy",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: secondaryColor,
                  surfaceTintColor: secondaryColor,
                  shadowColor: secondaryColor,
                ),
                SizedBox(
                  width: 3.w,
                ),
                Chip(
                  label: Text(
                    "Fantasy",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: secondaryColor,
                  surfaceTintColor: secondaryColor,
                  shadowColor: secondaryColor,
                ),
                SizedBox(
                  width: 3.w,
                ),
                Chip(
                  label: Text(
                    "Fantasy",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: secondaryColor,
                  surfaceTintColor: secondaryColor,
                  shadowColor: secondaryColor,
                ),
                SizedBox(
                  width: 3.w,
                ),
                Chip(
                  label: Text(
                    "Fantasy",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: secondaryColor,
                  surfaceTintColor: secondaryColor,
                  shadowColor: secondaryColor,
                ),
                SizedBox(
                  width: 3.w,
                ),
                Chip(
                  label: Text(
                    "Fantasy",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: secondaryColor,
                  surfaceTintColor: secondaryColor,
                  shadowColor: secondaryColor,
                )
              ],
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
                        "7.8",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w900,
                          color: Color(0xffF5C518),
                        ),
                      ),
                    ),
                    Text(
                      "300",
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
                        "546",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Text(
                      "45 min",
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
                "Upon escaping after decades of imprisonment by a mortal wizard, Dream, the personification of dreams, sets about to reclaim his lost equipment.",
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            VideoImageView()
          ],
        ),
      )),
    );
  }
}
