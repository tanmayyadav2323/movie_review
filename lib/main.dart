import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_review/config/cutom_routes.dart';
import 'package:movie_review/config/theme_color.dart';
import 'package:movie_review/features/Splashscreen/splash_screen.dart';
import 'package:movie_review/features/authentication/login_screen.dart';
import 'package:movie_review/features/dahboard/dashboard_screen.dart';
import 'package:movie_review/navbar_screen.dart';
import 'package:movie_review/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<UserProvider>(
      create: (context) => UserProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          backgroundColor: backgroundColor,
          scaffoldBackgroundColor: backgroundColor,
          fontFamily: GoogleFonts.dmSans().fontFamily,
          textTheme: TextTheme(
            displayLarge: TextStyle(color: Colors.white),
            displayMedium: TextStyle(color: Colors.white),
            displaySmall: TextStyle(color: Colors.white),
            headlineMedium: TextStyle(color: Colors.white),
            headlineSmall: TextStyle(color: Colors.white),
            titleLarge: TextStyle(color: Colors.white),
            titleMedium: TextStyle(color: Colors.white),
            titleSmall: TextStyle(color: Colors.white),
            bodyLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Colors.white),
            bodySmall: TextStyle(color: Colors.white),
            labelLarge: TextStyle(color: Colors.white),
            labelSmall: TextStyle(color: Colors.white),
          ),
          primarySwatch: Colors.blue,
        ),
        themeMode: ThemeMode.dark,
        onGenerateRoute: CustomRouter.onGenerateRoute,
        initialRoute: SplashScreen.routename,

      ),
    );
  }
}
