import 'package:flutter/material.dart';
import 'package:movie_review/widgets/movie_box.dart';
import 'package:sizer/sizer.dart';

class CategoryContainer extends StatefulWidget {
  const CategoryContainer({super.key});

  @override
  State<CategoryContainer> createState() => _CategoryContainerState();
}

class _CategoryContainerState extends State<CategoryContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Top Rated Thriller",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 0.5.h,
          ),
          Text(
            "New and Upcoming Prequels, Sequels, and Spin-Offs",
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                MovieBox(imagename: "img1"),
                MovieBox(imagename: "img2"),
                MovieBox(imagename: "img3"),
                MovieBox(imagename: "img4"),
                MovieBox(imagename: "img5"),
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
        ],
      ),
    );
  }
}
