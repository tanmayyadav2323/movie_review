import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movie_review/config/session_helper.dart';
import 'package:movie_review/features/movie_detail/services/movie_service.dart';
import 'package:sizer/sizer.dart';

class WatchListScreen extends StatefulWidget {
  const WatchListScreen({super.key});

  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {
  final MovieService movieService = MovieService();
  dynamic ids;
  bool loading = false;
  List<String> ls = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    // ids = await movieService.getWatch(context: context, movieId: "");
    // for (int i = 0; i < ids.length; i++) {
    //   log(ids[i]);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.w),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  Center(
                    child: Text(
                      "Watch List",
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Wrap(
                    direction: Axis.horizontal,
                    children: SessionHelper.movieList,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
