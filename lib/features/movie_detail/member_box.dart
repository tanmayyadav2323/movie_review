import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MemberBox extends StatefulWidget {
  const MemberBox({super.key});

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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset("assets/images/img5.jpeg"),
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        Text(
          "Name",
          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
