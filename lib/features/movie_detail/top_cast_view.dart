import 'package:flutter/material.dart';
import 'package:movie_review/features/movie_detail/member_box.dart';
import 'package:sizer/sizer.dart';

class TopCastView extends StatefulWidget {
  const TopCastView({super.key});

  @override
  State<TopCastView> createState() => _TopCastViewState();
}

class _TopCastViewState extends State<TopCastView> {
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
                "Top Cast",
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
                MemberBox(),
                MemberBox(),
                MemberBox(),
                MemberBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
