import 'package:flutter/material.dart';
import 'package:movie_review/features/movie_detail/movie_detail_screen.dart';
import 'package:movie_review/features/movie_detail/review_screen.dart';
import 'package:movie_review/navbar_screen.dart';
import 'package:page_transition/page_transition.dart';

class CustomRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavBarScreeen.routename:
        return MaterialPageRoute(
          settings: const RouteSettings(name: '/'),
          builder: (_) => const NavBarScreeen(),
        );
      case MovieDetailScreen.routename:
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          duration: Duration(milliseconds: 500),
          settings: const RouteSettings(name: MovieDetailScreen.routename),
          child: MovieDetailScreen(),
        );
      case ReviewScreen.routename:
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          duration: Duration(milliseconds: 500),
          settings: const RouteSettings(name: ReviewScreen.routename),
          child: ReviewScreen(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Something went wrong!'),
        ),
      ),
    );
  }
}
