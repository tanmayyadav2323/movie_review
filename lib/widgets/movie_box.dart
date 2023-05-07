// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:movie_review/config/theme_color.dart';
import 'package:movie_review/features/movie_detail/movie_detail_screen.dart';

class MovieBox extends StatefulWidget {
  final String imagename;
  final String name;
  final int rating;
  final String id;

  const MovieBox({
    Key? key,
    required this.imagename,
    required this.name,
    required this.rating,
    required this.id,
  }) : super(key: key);

  @override
  State<MovieBox> createState() => _MovieBoxState();
}

class _MovieBoxState extends State<MovieBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          MovieDetailScreen.routename,
          arguments: widget.id,
        );
      },
      child: Container(
        width: 40.w,
        height: 40.h,
        color: Color(0xff171717),
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(
              widget.imagename,
              fit: BoxFit.fill,
              width: 40.w,
              height: 27.h,
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
                    widget.name,
                    style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 2.w, vertical: 1.h),
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
                            Text(widget.rating.toString())
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
      ),
    );
  }
}
