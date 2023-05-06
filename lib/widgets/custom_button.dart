// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatefulWidget {
  final Function() onPressed;
  final String text;
  final bool isLoading;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: SizedBox(
        height: 6.h,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: widget.isLoading ? null : widget.onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0XFFf5c518),
          ),
          child: widget.isLoading
              ? CircularProgressIndicator()
              : Text(
                  widget.text,
                  style: TextStyle(
                      color: Color(0XFF000000),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold),
                ),
        ),
      ),
    );
  }
}
