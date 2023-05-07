import 'package:flutter/material.dart';
import 'package:movie_review/features/dahboard/genre_movies_screen.dart';
import 'package:sizer/sizer.dart';

// Widget GenreCard(String title, String imageUrl) {
//   return
// }

class GenreCard extends StatefulWidget {
  final String title, imageUrl;
  const GenreCard({
    Key? key,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  @override
  State<GenreCard> createState() => _GenreCardState();
}

class _GenreCardState extends State<GenreCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).pushNamed(GenreMovies.routename);

        Navigator.of(context).pushNamed(
          GenreMovies.routename,
          arguments: [widget.title],
        ).then((value) {});
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        width: 50.0.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          image: DecorationImage(
            image: NetworkImage(widget.imageUrl),
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
                Colors.black.withOpacity(0.2),
              ],
            ),
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
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
