import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:movie_review/config/theme_color.dart';
import 'package:movie_review/features/dahboard/dashboard_screen.dart';
import 'package:movie_review/features/movie_detail/movie_detail_screen.dart';
import 'package:sizer/sizer.dart';

class NavBarScreeen extends StatefulWidget {
  static const routename = '/nav-screen';
  const NavBarScreeen({super.key});

  @override
  State<NavBarScreeen> createState() => _NavBarScreeenState();
}

class _NavBarScreeenState extends State<NavBarScreeen> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = <Widget>[
    DashBoardScreen(),
    Center(
      child: Text(
        'Likes',
      ),
    ),
    Center(
      child: Text(
        'Search',
      ),
    ),
    Center(
      child: Text(
        'Profile',
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        height: 10.h,
        decoration: BoxDecoration(
          color: secondaryColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              hoverColor: Colors.grey[100]!,
              activeColor: Colors.black,
              iconSize: 4.h,
              curve: Curves.linear,
              padding: EdgeInsets.symmetric(horizontal: 4.5.w, vertical: 2.w),
              tabBackgroundColor: Color(0xffF5C518),
              color: Colors.white,
              haptic: false,
              tabs: [
                GButton(
                  icon: Icons.home,
                ),
                GButton(
                  icon: Icons.dashboard,
                ),
                GButton(
                  icon: Icons.watch_later,
                ),
                GButton(
                  icon: Icons.person,
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
