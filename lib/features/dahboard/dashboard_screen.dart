import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_review/features/dahboard/widgets/video_player.dart';
import 'package:movie_review/widgets/category_container.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 2.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Text(
              "Trending",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w800),
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          CarouselSlider.builder(
            itemCount: 10,
            itemBuilder: (context, index, pageIndex) {
              return VideoApp();
            },
            options: CarouselOptions(
              aspectRatio: 4 / 3,
              enlargeCenterPage: true,
              enlargeFactor: 0.32,
              viewportFraction: 0.8,
              autoPlay: true,
              height: 40.h,
              pauseAutoPlayOnTouch: true,
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          CategoryContainer(),
        ],
      ),
    ));
  }
}
