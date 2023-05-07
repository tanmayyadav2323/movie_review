// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:movie_review/config/theme_color.dart';
import 'package:sizer/sizer.dart';

import 'member_box.dart';

class AwardsView extends StatefulWidget {
  final List<dynamic> awards;
  const AwardsView({
    Key? key,
    required this.awards,
  }) : super(key: key);

  @override
  State<AwardsView> createState() => _AwardsViewState();
}

class _AwardsViewState extends State<AwardsView> {
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
                "Awards",
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
              children: widget.awards.map((val) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
                  margin: EdgeInsets.only(left: 4.w),
                  decoration: BoxDecoration(
                    color: lightBlack,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 0.w),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/trophy.png",
                          height: 3.h,
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          val.toString(),
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
