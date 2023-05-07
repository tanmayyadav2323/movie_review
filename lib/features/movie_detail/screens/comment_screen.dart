// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:movie_review/config/session_helper.dart';
import 'package:movie_review/features/movie_detail/services/movie_service.dart';
import 'package:movie_review/models/comment_model.dart';
import 'package:sizer/sizer.dart';

import 'package:movie_review/config/utils.dart';
import 'package:movie_review/widgets/custom_button.dart';

class CommentScreen extends StatefulWidget {
  final String reviewId;

  static const routename = 'comment-screen';
  const CommentScreen({
    Key? key,
    required this.reviewId,
  }) : super(key: key);

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
                    onPressed: () async {
                      if (commentController.text.length == 0) {
                        showSnackBar(context, "Enter Comment");
                      }
                      if (loading) return;
                      loading = true;
                      setState(() {});
                      Comment comment = Comment(
                        imageUrl: "",
                        userId: SessionHelper.id,
                        name: "",
                        id: "",
                        description: commentController.text,
                        likes: [],
                        dislikes: [],
                        replies: [],
                      );
                      await MovieService().submitComment(
                        context: context,
                        reviewId: widget.reviewId,
                        comment: comment,
                      );
                      Navigator.of(context).pop(comment);
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
