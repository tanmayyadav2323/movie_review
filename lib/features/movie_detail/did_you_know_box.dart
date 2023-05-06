import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DidYouKnowBox extends StatefulWidget {
  const DidYouKnowBox({super.key});

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
              height: 15.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xff171717),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                  'Dave McKean, who created the covers for the comic series, came out of "Sandman retirement" to design the credits sequences for this series.'),
            ),
          ],
        ),
      ],
    );
  }
}
