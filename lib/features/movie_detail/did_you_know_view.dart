import 'package:flutter/material.dart';
import 'package:movie_review/features/movie_detail/did_you_know_box.dart';
import 'package:sizer/sizer.dart';

class DidYouKnow extends StatefulWidget {
  const DidYouKnow({super.key});

  @override
  State<DidYouKnow> createState() => _DidYouKnowState();
}

class _DidYouKnowState extends State<DidYouKnow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Did you know",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 2.w,
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Color(0xffF5C518),
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                DidYouKnowBox(),
                DidYouKnowBox(),
                DidYouKnowBox(),
                DidYouKnowBox(),
                DidYouKnowBox(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
