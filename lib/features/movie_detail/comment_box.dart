// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movie_review/config/session_helper.dart';
import 'package:movie_review/features/movie_detail/services/movie_service.dart';
import 'package:sizer/sizer.dart';

import 'package:movie_review/models/comment_model.dart';

import '../../config/theme_color.dart';

class CommentBox extends StatefulWidget {
  final Comment comment;
  const CommentBox({
    Key? key,
    required this.comment,
  }) : super(key: key);

  @override
  State<CommentBox> createState() => _CommentBoxState();
}

class _CommentBoxState extends State<CommentBox> {
  bool isClosed = true;
  final MovieService movieService = MovieService();
  final TextEditingController _replyController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: lightBlack,
      padding: EdgeInsets.symmetric(
        horizontal: 4.w,
      ),
      margin: EdgeInsets.symmetric(vertical: 1.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 2.h,
          ),
          Text(
            widget.comment.name == "" ? "Guest" : widget.comment.name,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 0.5.h,
          ),
          Text(widget.comment.description),
          SizedBox(
            height: 3.h,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  if (widget.comment.likes.contains(SessionHelper.id) ==
                      false) {
                    if (widget.comment.dislikes.contains(SessionHelper.id)) {
                      widget.comment.dislikes.remove(SessionHelper.id);
                    }
                    widget.comment.likes.add(SessionHelper.id);
                  } else {
                    widget.comment.likes.remove(SessionHelper.id);
                  }
                  updateComment();
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.thumb_up,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(widget.comment.likes.length.toString()),
                  ],
                ),
              ),
              SizedBox(
                width: 4.w,
              ),
              GestureDetector(
                onTap: () {
                  if (widget.comment.dislikes.contains(SessionHelper.id) ==
                      false) {
                    if (widget.comment.likes.contains(SessionHelper.id)) {
                      widget.comment.likes.remove(SessionHelper.id);
                    }
                    widget.comment.dislikes.add(SessionHelper.id);
                  } else {
                    widget.comment.dislikes.remove(SessionHelper.id);
                  }
                  updateComment();
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.thumb_down,
                      color: Colors.white.withOpacity(0.3),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(widget.comment.dislikes.length.toString()),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 3.h,
          ),
          TextField(
            controller: _replyController,
            obscureText: false,
            cursorColor: Colors.white,
            onChanged: (value) {},
            onSubmitted: (value) {},
            maxLength: 100,
            minLines: 1,
            maxLines: 2,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              fillColor: const Color(0xFF202020),
              filled: true,
              hintText: "Reply",
              hintStyle: TextStyle(color: Color(0xFFb4b4b4), fontSize: 12.sp),
              suffixIcon: GestureDetector(
                onTap: () {
                  widget.comment.replies.add(
                    Reply(
                      id: "",
                      name: SessionHelper.name,
                      imageUrl: SessionHelper.imageUrl,
                      userId: SessionHelper.id,
                      desciption: _replyController.text,
                    ),
                  );
                  updateComment();
                  _replyController.clear();
                  FocusScope.of(context).unfocus();
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 1),
                  child: Icon(
                    Icons.send,
                    size: 3.h,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Text(
                "Threads",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  isClosed = !isClosed;
                  setState(() {});
                },
                child: Icon(
                  isClosed == false
                      ? Icons.keyboard_arrow_down
                      : Icons.keyboard_arrow_up,
                  color: Colors.white,
                  size: 4.h,
                ),
              )
            ],
          ),
          if (isClosed)
            Column(
              children: widget.comment.replies.map((reply) {
                String jsonString = reply;

                Map<String, dynamic> jsonMap = jsonDecode(jsonString);
                Map<String, String> myMap = Map<String, String>.from({
                  'name': jsonMap['name'],
                  'imageUrl': jsonMap['imageUrl'],
                  'userId': jsonMap['userId'],
                  'description': jsonMap['desciption']
                });
                String name = myMap["name"] ?? "";
                String description = myMap["description"] ?? "";
                if (name == "") name = "Guest";

                return Column(
                  children: [
                    SizedBox(
                      height: 1.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                        SizedBox(
                          height: 0.4.h,
                        ),
                        Text(
                          description,
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }).toList(),
            ),
          SizedBox(
            height: 2.h,
          ),
        ],
      ),
    );
  }

  void updateComment() async {
    await movieService.updateComment(context: context, comment: widget.comment);
    setState(() {});
  }
}
