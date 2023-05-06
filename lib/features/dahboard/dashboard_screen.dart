import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_review/features/dahboard/widgets/video_player.dart';
import 'package:movie_review/features/movie_detail/movie_detail_screen.dart';
import 'package:movie_review/features/movie_detail/services/movie_service.dart';
import 'package:movie_review/widgets/category_container.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final MovieService movieService = MovieService();
  List<dynamic> trendingMovies = [];
  bool loading = false;

  @override
  void initState() {
    getTrendingMovies();
    super.initState();
  }

  void getTrendingMovies() async {
    loading = true;
    setState(() {});
    trendingMovies = await movieService.getTrendingMovies(context: context);
    loading = false;
    setState(() {});
    log(trendingMovies.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
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
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.w800),
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  CarouselSlider.builder(
                    itemCount: trendingMovies.length,
                    itemBuilder: (context, index, pageIndex) {
                      return GestureDetector(
                        child: VideoApp(
                          movie: trendingMovies[index],
                        ),
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            MovieDetailScreen.routename,
                            arguments: trendingMovies[index],
                          );
                        },
                      );
                    },
                    options: CarouselOptions(
                      aspectRatio: 4 / 3,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.32,
                      viewportFraction: 0.8,
                      enableInfiniteScroll: true,
                      pauseAutoPlayInFiniteScroll: true,
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
            ),
    ));
  }
}
