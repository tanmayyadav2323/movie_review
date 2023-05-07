import 'package:flutter/material.dart';
import 'package:movie_review/features/authentication/login_screen.dart';
import 'package:movie_review/features/authentication/verify_screen.dart';
import 'package:movie_review/features/dahboard/genre_movies_screen.dart';
import 'package:movie_review/features/movie_detail/movie_detail_screen.dart';
import 'package:movie_review/features/movie_detail/review_screen.dart';
import 'package:movie_review/features/splashscreen/splash_screen.dart';
import 'package:movie_review/features/movie_detail/screens/comment_screen.dart';
import 'package:movie_review/features/movie_detail/screens/write_review.dart';
import 'package:movie_review/models/category_model.dart';
import 'package:movie_review/models/review_model.dart';
import 'package:movie_review/navbar_screen.dart';
import 'package:page_transition/page_transition.dart';

class CustomRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routename:
        return MaterialPageRoute(
          settings: const RouteSettings(name: SplashScreen.routename),
          builder: (_) => const SplashScreen(),
        );
      case NavBarScreeen.routename:
        return MaterialPageRoute(
          settings: const RouteSettings(name: NavBarScreeen.routename),
          builder: (_) => const NavBarScreeen(),
        );
      case GenreMovies.routename:
        return PageTransition(
          type: PageTransitionType.bottomToTop,
          duration: Duration(milliseconds: 500),
          settings: const RouteSettings(name: GenreMovies.routename),
          child: GenreMovies(
            category: settings.arguments as Category,
          ),
        );
      case VerifyPhoneNumberScreen.routename:
        return MaterialPageRoute(
          settings:
              const RouteSettings(name: VerifyPhoneNumberScreen.routename),
          builder: (_) => VerifyPhoneNumberScreen(
            phoneNumber: (settings.arguments! as List<String>)[1],
            userId: (settings.arguments! as List<String>)[0],
          ),
        );
      case MovieDetailScreen.routename:
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          duration: Duration(milliseconds: 500),
          settings: const RouteSettings(name: MovieDetailScreen.routename),
          child: MovieDetailScreen(
            id: settings.arguments as String,
          ),
        );
      case ReviewScreen.routename:
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          duration: Duration(milliseconds: 500),
          settings: const RouteSettings(name: ReviewScreen.routename),
          child: ReviewScreen(
            review: settings.arguments as Review,
          ),
        );
      case WriteReviewScreeen.routename:
        return PageTransition(
          type: PageTransitionType.bottomToTop,
          duration: Duration(milliseconds: 500),
          settings: const RouteSettings(name: WriteReviewScreeen.routename),
          child: WriteReviewScreeen(
            movieId: settings.arguments as String,
          ),
        );
      case CommentScreen.routename:
        return PageTransition(
          type: PageTransitionType.bottomToTop,
          duration: Duration(milliseconds: 500),
          settings: const RouteSettings(name: CommentScreen.routename),
          child: CommentScreen(
            reviewId: settings.arguments as String,
          ),
        );
      case LoginPage.routename:
        return MaterialPageRoute(
          settings: const RouteSettings(name: LoginPage.routename),
          builder: (_) => LoginPage(),
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
