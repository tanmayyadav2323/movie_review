import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PhotoBox extends StatefulWidget {
  const PhotoBox({super.key});

  @override
  State<PhotoBox> createState() => _PhotoBoxState();
}

class _PhotoBoxState extends State<PhotoBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      height: 20.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Image.asset("assets/images/img1.jpeg"),
      ),
    );
  }
}
