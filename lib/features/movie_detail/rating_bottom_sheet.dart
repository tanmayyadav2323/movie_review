import 'package:flutter/material.dart';
import 'package:movie_review/config/theme_color.dart';
import 'package:sizer/sizer.dart';

class RatingBottomSheet extends StatefulWidget {
  @override
  _RatingBottomSheetState createState() => _RatingBottomSheetState();
}

class _RatingBottomSheetState extends State<RatingBottomSheet> {
  int _selectedRating = 1;
  final List<int> _ratings = List.generate(10, (index) => index + 1);
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: lightBlack,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        children: [
          SizedBox(
            height: 4.h,
          ),
          Container(
            height: 10.h,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 10.h,
                    backgroundColor: Colors.white,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    '$_selectedRating',
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 6.h,
          ),
          Container(
            height: 16.h,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              controller: _scrollController,
              shrinkWrap: true,
              padding: EdgeInsets.all(0),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final rating = _ratings[index];
                return GestureDetector(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
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
                      _selectedRating = rating;
                    });
                  },
                );
              },
              itemCount: _ratings.length,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            height: 5.h,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Color(0xffF5C518),
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              child: Text("Rate"),
            ),
          ),
        ],
      ),
    );
  }
}
