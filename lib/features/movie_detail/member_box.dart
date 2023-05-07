// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MemberBox extends StatefulWidget {
  final String url;
  final String name;

  const MemberBox({
    Key? key,
    required this.url,
    required this.name,
  }) : super(key: key);

  @override
  State<MemberBox> createState() => _MemberBoxState();
}

class _MemberBoxState extends State<MemberBox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          height: 20.h,
          width: 40.w,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.network(
              widget.url,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        Text(
          widget.name,
          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
