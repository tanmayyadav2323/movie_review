// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:movie_review/features/movie_detail/review_screen.dart';
import 'package:sizer/sizer.dart';

import '../../models/review_model.dart';

class ReviewBox extends StatefulWidget {
  final Review review;
  final bool expand;

  const ReviewBox({
    Key? key,
    required this.review,
    this.expand = false,
  }) : super(key: key);

  @override
  State<ReviewBox> createState() => _ReviewBoxState();
}

class _ReviewBoxState extends State<ReviewBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ReviewScreen.routename, arguments: widget.review);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 2.w),
        width: MediaQuery.of(context).size.width * 0.8,
        height: 24.h,
        decoration: BoxDecoration(
          color: Color(0xff171717),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 1.h,
              ),
              Row(
                children: [
                  Text(
                    widget.review.name.isEmpty ? "Guest" : widget.review.name,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Icon(
                        Icons.thumb_up_sharp,
                        color: Colors.white,
                        size: 2.h,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        widget.review.likes.length.toString() + " Likes",
                        style: TextStyle(
                          fontSize: 8.sp,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                    width: 2.w,
                  )
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                widget.review.title,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (widget.review.spolier)
                Text(
                  "Warning: Spoilers ",
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffFF0000),
                  ),
                ),
              if (widget.review.spolier)
                SizedBox(
                  height: 1.h,
                ),
              Flexible(
                child: Text(
                  widget.review.desciption,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 3,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
