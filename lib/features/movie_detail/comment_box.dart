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
      padding: EdgeInsets.symmetric(
        horizontal: 4.w,
      ),
      margin: EdgeInsets.symmetric(vertical: 1.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 2.h,
          ),
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
            height: 3.h,
          ),
          Row(
            children: [
              Column(
                children: [
                  Icon(
                    Icons.thumb_up,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text("5"),
                ],
              ),
              SizedBox(
                width: 4.w,
              ),
              Column(
                children: [
                  Icon(
                    Icons.thumb_down,
                    color: Colors.white.withOpacity(0.3),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text("10"),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 3.h,
          ),
          TextField(
            obscureText: false,
            cursorColor: Colors.white,
            onChanged: (value) {},
            onSubmitted: (_) {},
            maxLength: 100,
            minLines: 1,
            maxLines: 2,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              fillColor: const Color(0xFF202020),
              filled: true,
              hintText: "Reply",
              hintStyle: TextStyle(color: Color(0xFFb4b4b4), fontSize: 12.sp),
              suffixIcon: Padding(
                padding: EdgeInsets.only(top: 1),
                child: Icon(
                  Icons.send,
                  size: 3.h,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Text(
            "Threads",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tanmay",
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              SizedBox(
                height: 0.4.h,
              ),
              Text(
                "If the [style] argument is null, the text will use the style from the closest enclosing [DefaultTextStyle].",
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.6),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
        ],
      ),
    );
  }
}
