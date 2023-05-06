// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:movie_review/features/dahboard/widgets/video_player.dart';
import 'package:movie_review/features/movie_detail/photo_box.dart';
import 'package:movie_review/features/movie_detail/video_box.dart';

class VideoImageView extends StatefulWidget {
  final List<dynamic> videos;
  final List<dynamic> images;
  const VideoImageView({
    Key? key,
    required this.videos,
    required this.images,
  }) : super(key: key);

  @override
  State<VideoImageView> createState() => _VideoImageViewState();
}

class _VideoImageViewState extends State<VideoImageView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 2, vsync: this); // Change length to number of tabs you want
    _tabController.addListener(() {
      _selectedIndex = _tabController.index;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            alignment: Alignment.topLeft,
            width: MediaQuery.of(context).size.width * 0.5,
            child: TabBar(
              labelStyle:
                  TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
              controller: _tabController,
              indicatorWeight: 2,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Color(0xffF5C518),
              indicatorPadding:
                  EdgeInsets.symmetric(horizontal: 2.w, vertical: 1),
              tabs: [
                Tab(text: 'Videos'),
                Tab(text: 'Photos'),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Builder(
          builder: (_) {
            if (_selectedIndex == 0) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Row(
                    children: widget.videos.map((video) {
                      return VideoBox(url: video);
                    }).toList(),
                  ),
                ),
              );
            } else if (_selectedIndex == 1) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: widget.images.map((url) {
                      return PhotoBox(url: url);
                    }).toList(),
                  ),
                ),
              ); //2nd tabView
            }
            return SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
