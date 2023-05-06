// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PhotoBox extends StatefulWidget {
  final dynamic url;
  const PhotoBox({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  State<PhotoBox> createState() => _PhotoBoxState();
}

class _PhotoBoxState extends State<PhotoBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      height: 20.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Image.network(widget.url),
      ),
    );
  }
}
