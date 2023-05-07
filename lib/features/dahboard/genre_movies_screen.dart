import 'package:flutter/material.dart';
import 'package:movie_review/widgets/movie_box.dart';
import 'package:sizer/sizer.dart';

class GenreMovies extends StatefulWidget {
  const GenreMovies({super.key});

  @override
  State<GenreMovies> createState() => _GenreMoviesState();
}

class _GenreMoviesState extends State<GenreMovies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Text(
              "Action",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w800),
            ),
          ),
          SizedBox(height: 2.h),
          Expanded(
            child: Container(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.59,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                padding: EdgeInsets.only(
                    left: 4.w, right: 4.w, top: 4.h, bottom: 4.h),
                children: const [
                  // MovieBox(imagename: "img1"),
                  // MovieBox(imagename: "img2"),
                  // MovieBox(imagename: "img3"),
                  // MovieBox(imagename: "img4"),
                  // MovieBox(imagename: "img1"),
                  // MovieBox(imagename: "img2"),
                  // MovieBox(imagename: "img3"),
                  // MovieBox(imagename: "img4"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
