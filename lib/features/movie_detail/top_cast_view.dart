// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:movie_review/features/movie_detail/member_box.dart';

class TopCastView extends StatefulWidget {
  final List<dynamic> cast;
  const TopCastView({
    Key? key,
    required this.cast,
  }) : super(key: key);

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
              children: widget.cast.map((val) {
                return MemberBox(url: val["photo"], name: val["name"]);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
