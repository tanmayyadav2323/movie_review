// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:movie_review/config/theme_color.dart';

class RatingBottomSheet extends StatefulWidget {
  final double initalRating;
  final Function(double) onPressed;

  const RatingBottomSheet({
    Key? key,
    required this.initalRating,
    required this.onPressed,
  }) : super(key: key);
  @override
  _RatingBottomSheetState createState() => _RatingBottomSheetState();
}

class _RatingBottomSheetState extends State<RatingBottomSheet> {
  double _selectedRating = 1;
  final List<int> _ratings = List.generate(10, (index) => index + 1);
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  bool loading = false;

  @override
  void initState() {
    _selectedRating = widget.initalRating;
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollBy(double pixels) {
    if (pixels < 0) {
      _scrollPosition -= MediaQuery.of(context).size.width * 0.4;
      _scrollController.animateTo(
        _scrollPosition,
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 500),
      );
    } else {
      _scrollPosition += MediaQuery.of(context).size.width * 0.4;
      _scrollController.animateTo(
        _scrollPosition,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: lightBlack,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      ),
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        children: [
          SizedBox(
            height: 4.h,
          ),
          Container(
            height: 14.h,
            child: Stack(
              children: [
                Align(
                  child: Icon(
                    Icons.star_outlined,
                    color: Color(0xffF5C518),
                    size: 14.h,
                  ),
                  alignment: Alignment.center,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        '${_selectedRating.toInt()}',
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 6.h,
          ),
          SizedBox(
            height: 8.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    _scrollBy(-1);
                  },
                  child: SizedBox(
                    width: 10.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Spacer(),
                        Expanded(
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white.withOpacity(0.3),
                            size: 4.h,
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    height: 8.h,
                    child: ListView.builder(
                      controller: _scrollController,
                      shrinkWrap: true,
                      padding: EdgeInsets.all(0),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final rating = _ratings[index];
                        return GestureDetector(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Text(
                              '$rating',
                              style: TextStyle(
                                fontSize: 35.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              _selectedRating = double.parse(rating.toString());
                            });
                          },
                        );
                      },
                      itemCount: _ratings.length,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _scrollBy(1);
                  },
                  child: SizedBox(
                    width: 10.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Spacer(),
                        Expanded(
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white.withOpacity(0.3),
                            size: 4.h,
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            height: 5.h,
            child: ElevatedButton(
              onPressed: () {
                if (loading == false) {
                  widget.onPressed(double.parse(_selectedRating.toString()));
                }
                loading = true;
                setState(() {});
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xffF5C518),
                textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              child: loading
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                    )
                  : Text(
                      "Rate",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
