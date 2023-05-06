import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'member_box.dart';

class CreatorsVew extends StatefulWidget {
  const CreatorsVew({super.key});

  @override
  State<CreatorsVew> createState() => _CreatorsVewState();
}

class _CreatorsVewState extends State<CreatorsVew> {
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
                "Creators",
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
