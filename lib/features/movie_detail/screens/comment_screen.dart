import 'package:flutter/material.dart';
import 'package:movie_review/config/utils.dart';
import 'package:movie_review/widgets/custom_button.dart';
import 'package:sizer/sizer.dart';

class CommentScreen extends StatefulWidget {
  static const routename = 'comment-screen';
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final TextEditingController commentController = TextEditingController();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "Write Comment",
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  TextField(
                    controller: commentController,
                    obscureText: false,
                    cursorColor: Colors.white,
                    onChanged: (value) {},
                    onSubmitted: (_) {},
                    maxLength: 300,
                    minLines: 5,
                    maxLines: 6,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 1.5.h, horizontal: 4.w),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      fillColor: const Color(0xFF202020),
                      filled: true,
                      hintText: "Comment",
                      hintStyle:
                          TextStyle(color: Color(0xFFb4b4b4), fontSize: 12.sp),
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  CustomButton(
                    onPressed: () {
                      if (commentController.text.length == 0) {
                        showSnackBar(context, "Enter Comment");
                      }
                      if (loading) return;
                      loading = true;
                      setState(() {});
                    },
                    text: "Add Comment",
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
