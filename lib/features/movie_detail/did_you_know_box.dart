// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DidYouKnowBox extends StatefulWidget {
  final String text;
  const DidYouKnowBox({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<DidYouKnowBox> createState() => _DidYouKnowBoxState();
}

class _DidYouKnowBoxState extends State<DidYouKnowBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 2.w),
              padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
              width: MediaQuery.of(context).size.width * 0.8,
              height: 20.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xff171717),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                widget.text,
                overflow: TextOverflow.ellipsis,
                maxLines: 7,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
