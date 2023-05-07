import 'package:flutter/material.dart';
import 'package:movie_review/models/category_model.dart';
import 'package:movie_review/widgets/movie_box.dart';
import 'package:sizer/sizer.dart';

class GenreMovies extends StatefulWidget {
  final Category category;
  static const routename = "/genre-movies";
  // const GenreMovies({super.key});
  const GenreMovies({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<GenreMovies> createState() => _GenreMoviesState();
}

class _GenreMoviesState extends State<GenreMovies> {
  late Category category;
  @override
  void initState() {
    category = widget.category;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 8.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Text(
                  category.title,
                  style:
                      TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: 3.h),
              Container(
                child: Wrap(
                  spacing: 2.w,
                  runSpacing: 2.h,
                  children: category.movies.map((movie) {
                    return MovieBox(
                      imagename: movie["thumbnail"],
                      name: category.name,
                      rating: movie["rating"] ?? 0,
                      id: movie["detail"],
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
