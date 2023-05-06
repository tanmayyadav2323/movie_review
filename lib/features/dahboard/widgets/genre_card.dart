import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget GenreCard(String title, String imageUrl) {
  return Container(
    margin: const EdgeInsets.all(8),
    width: 50.0.w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16.0),
      image: DecorationImage(
        image: NetworkImage(imageUrl),
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
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  );
}
