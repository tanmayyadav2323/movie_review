// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:movie_review/config/theme_color.dart';
import 'package:sizer/sizer.dart';

class MovieBox extends StatefulWidget {
  final String imagename;
  const MovieBox({
    Key? key,
    required this.imagename,
  }) : super(key: key);

  @override
  State<MovieBox> createState() => _MovieBoxState();
}

class _MovieBoxState extends State<MovieBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      color: Color(0xff171717),
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/${widget.imagename}.jpeg",
            fit: BoxFit.fitWidth,
            width: 40.w,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  "Strange Things",
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.star,
                            size: 2.h,
                            color: Color(0xffF5C518),
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Text("4.8")
                        ],
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 2.w,
                    )
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
