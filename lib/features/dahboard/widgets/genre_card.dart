// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:movie_review/features/dahboard/genre_movies_screen.dart';
import 'package:movie_review/models/category_model.dart';

// Widget GenreCard(String title, String imageUrl) {
//   return
// }

class GenreCard extends StatefulWidget {
  final Category category;

  const GenreCard({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<GenreCard> createState() => _GenreCardState();
}

class _GenreCardState extends State<GenreCard> {
  late Category category;

  @override
  void initState() {
    category = widget.category;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          GenreMovies.routename,
          arguments: category,
        );
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          image: DecorationImage(
            image: NetworkImage(category.image),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [
                Colors.black.withOpacity(0.8),
                Colors.black.withOpacity(0.4),
              ],
            ),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                category.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
