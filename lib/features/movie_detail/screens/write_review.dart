// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:movie_review/config/theme_color.dart';
import 'package:movie_review/config/utils.dart';
import 'package:movie_review/features/movie_detail/services/movie_service.dart';
import 'package:movie_review/models/review_model.dart';
import 'package:movie_review/widgets/custom_button.dart';

class WriteReviewScreeen extends StatefulWidget {
  final String movieId;
  static const routename = 'write-review';

  const WriteReviewScreeen({
    Key? key,
    required this.movieId,
  }) : super(key: key);

  @override
  State<WriteReviewScreeen> createState() => _WriteReviewScreeenState();
}

class _WriteReviewScreeenState extends State<WriteReviewScreeen> {
  final TextEditingController controller = TextEditingController();
  String _selectedOption = 'User Review';

  String _spolierSelection = 'No';
  final FocusNode _focusNode = FocusNode();
  bool sploier = false;
  bool userReview = true;
  bool isLoading = false;

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "Write Review",
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  TextField(
                    controller: controller,
                    obscureText: false,
                    cursorColor: Colors.white,
                    onChanged: (value) {},
                    maxLength: 20,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 1.5.h, horizontal: 4.w),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      fillColor: const Color(0xFF202020),
                      filled: true,
                      hintText: "Title",
                      hintStyle:
                          TextStyle(color: Color(0xFFb4b4b4), fontSize: 12.sp),
                    ),
                  ),
                  TextField(
                    controller: controller,
                    obscureText: false,
                    cursorColor: Colors.white,
                    onChanged: (value) {},
                    minLines: 8,
                    maxLines: 10,
                    maxLength: 3000,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      fillColor: const Color(0xFF202020),
                      filled: true,
                      hintText: "Enter review",
                      hintStyle: const TextStyle(color: Color(0xFFb4b4b4)),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "Review Type",
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Radio<String>(
                            value: 'User Review',
                            groupValue: _selectedOption,
                            hoverColor: Colors.white,
                            activeColor: selectedIconColor,
                            onChanged: (value) {
                              setState(() {
                                _selectedOption = value!;
                                userReview = true;
                              });
                            },
                          ),
                          Text("User Review")
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Radio<String>(
                            value: 'Critic Review',
                            groupValue: _selectedOption,
                            hoverColor: Colors.white,
                            activeColor: selectedIconColor,
                            onChanged: (value) {
                              setState(() {
                                _selectedOption = value!;
                                userReview = false;
                              });
                            },
                          ),
                          Text("Critic Review")
                        ],
                      ),
                      Spacer(),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "Spolier",
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio<String>(
                            value: 'Yes',
                            groupValue: _spolierSelection,
                            activeColor: selectedIconColor,
                            onChanged: (value) {
                              setState(() {
                                sploier = true;
                                _spolierSelection = value!;
                              });
                            },
                          ),
                          Text("Yes")
                        ],
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio<String>(
                            value: 'No',
                            activeColor: selectedIconColor,
                            groupValue: _spolierSelection,
                            onChanged: (value) {
                              setState(() {
                                sploier = false;
                                _spolierSelection = value!;
                              });
                            },
                          ),
                          Text("No")
                        ],
                      ),
                      Spacer()
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  CustomButton(
                    onPressed: () async {
                      if (controller.text.length == 0) {
                        showSnackBar(context, "Please Enter Review");
                        return;
                      }
                      if (isLoading) return;
                      isLoading = true;
                      setState(() {});
                      await MovieService()
                          .submitReview(
                        context: context,
                        review: Review(
                          movieId: widget.movieId,
                          id: "",
                          desciption: controller.text,
                          spolier: sploier,
                          userReview: userReview,
                          comments: [],
                        ),
                      )
                          .then((value) {
                        setState(() {
                          isLoading = false;
                        });
                        Navigator.of(context).pop();
                      });
                    },
                    text: "Save",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
