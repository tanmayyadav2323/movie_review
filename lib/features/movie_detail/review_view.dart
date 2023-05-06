import 'package:flutter/material.dart';
import 'package:movie_review/features/movie_detail/review_box.dart';
import 'package:sizer/sizer.dart';

class MovieReview extends StatefulWidget {
  const MovieReview({super.key});

  @override
  State<MovieReview> createState() => _MovieReviewState();
}

class _MovieReviewState extends State<MovieReview>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 2, vsync: this); // Change length to number of tabs you want
    _tabController.addListener(() {
      _selectedIndex = _tabController.index;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TabBar(
                isScrollable: true,
                labelStyle:
                    TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
                controller: _tabController,
                indicatorWeight: 2,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Color(0xffF5C518),
                indicatorPadding:
                    EdgeInsets.only(left: 4.w, right: 12.w, top: 1, bottom: 1),
                tabs: [
                  Tab(
                      child: Row(
                    children: [
                      Text('User Review'),
                      SizedBox(
                        width: 2.w,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xffF5C518),
                      ),
                    ],
                  )),
                  Tab(
                      child: Row(
                    children: [
                      Text('Critic Review'),
                      SizedBox(
                        width: 2.w,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xffF5C518),
                      ),
                    ],
                  )),
                ],
              ),
            ),
            Spacer(),
            Icon(
              Icons.abc,
              color: Colors.white,
            ),
            SizedBox(
              width: 4.w,
            )
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
        Builder(
          builder: (_) {
            if (_selectedIndex == 0) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Row(
                    children: [
                      ReviewBox(),
                      ReviewBox(),
                      ReviewBox(),
                      ReviewBox(),
                    ],
                  ),
                ),
              ); //1st custom tabBarView
            } else if (_selectedIndex == 1) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Row(
                    children: [
                      ReviewBox(),
                      ReviewBox(),
                      ReviewBox(),
                      ReviewBox(),
                    ],
                  ),
                ),
              ); //2nd tabView
            }
            return SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
