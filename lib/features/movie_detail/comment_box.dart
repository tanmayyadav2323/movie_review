import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../config/theme_color.dart';

class CommentBox extends StatefulWidget {
  const CommentBox({super.key});

  @override
  State<CommentBox> createState() => _CommentBoxState();
}

class _CommentBoxState extends State<CommentBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: lightBlack,
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
      margin: EdgeInsets.symmetric(vertical: 1.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tanmay",
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 0.5.h,
          ),
          Text(
              "Upon escaping after decades of imprisonment by a mortal wizard, Dream, the personification of dreams, sets about to reclaim his lost equipment."),
          SizedBox(
            height: 1.h,
          ),
        ],
      ),
    );
  }
}
