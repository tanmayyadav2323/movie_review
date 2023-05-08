// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:movie_review/config/session_helper.dart';
import 'package:movie_review/features/movie_detail/services/movie_service.dart';
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
  final MovieService movieService = MovieService();

  bool added = false;

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
        color: const Color(0xff171717),
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
            SizedBox(
              width: 40.w,
              height: 13.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 1.h,
                    ),
                    SizedBox(
                      child: Text(
                        widget.name,
                        style: TextStyle(
                            fontSize: 12.sp, fontWeight: FontWeight.w500),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Spacer(),
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
                                color: const Color(0xffF5C518),
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                              Text(widget.rating.toString())
                            ],
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () async {
                            if (SessionHelper.movieListIds.contains(
                              MovieBox(
                                  imagename: widget.imagename,
                                  name: widget.name,
                                  rating: widget.rating,
                                  id: widget.id),
                            )) {
                              SessionHelper.movieList.remove(
                                MovieBox(
                                    imagename: widget.imagename,
                                    name: widget.name,
                                    rating: widget.rating,
                                    id: widget.id),
                              );
                            } else {
                              SessionHelper.movieList.add(
                                MovieBox(
                                    imagename: widget.imagename,
                                    name: widget.name,
                                    rating: widget.rating,
                                    id: widget.id),
                              );
                            }
                            setState(() {});
                            // await movieService.addWatch(
                            //     context: context, movieId: widget.id);
                            // added = false;
                            // setState(() {});
                          },
                          child: SessionHelper.movieList.contains(
                            MovieBox(
                                imagename: widget.imagename,
                                name: widget.name,
                                rating: widget.rating,
                                id: widget.id),
                          )
                              ? Icon(Icons.check)
                              : Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
