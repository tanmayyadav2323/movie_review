// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:movie_review/features/movie_detail/review_box.dart';
import 'package:movie_review/features/movie_detail/review_screen.dart';
import 'package:movie_review/features/movie_detail/screens/write_review.dart';
import 'package:movie_review/models/review_model.dart';

class MovieReview extends StatefulWidget {
  final String movieId;
  final List<Review> userReview;
  final List<Review> criticReview;

  const MovieReview({
    Key? key,
    required this.movieId,
    required this.userReview,
    required this.criticReview,
  }) : super(key: key);

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
            GestureDetector(
              child: Image.asset("assets/images/write_icon.png"),
              onTap: () async {
                await Navigator.of(context)
                    .pushNamed(WriteReviewScreeen.routename,
                        arguments: widget.movieId)
                    .then((review) {
                  if (review != null) {
                    Review re = review as Review;
                    if (re.userReview) {
                      widget.userReview.add(re);
                    } else {
                      widget.criticReview.add(re);
                    }
                    setState(() {});
                  }
                });
              },
            ),
            SizedBox(
              width: 6.w,
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
                    children: widget.userReview.map((review) {
                      return ReviewBox(
                        review: review,
                      );
                    }).toList(),
                  ),
                ),
              ); //1st custom tabBarView
            } else if (_selectedIndex == 1) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Row(
                    children: widget.criticReview.map((review) {
                      return ReviewBox(
                        review: review,
                      );
                    }).toList(),
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
