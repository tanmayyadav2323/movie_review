import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

class VideoBox extends StatefulWidget {
  const VideoBox({super.key});

  @override
  State<VideoBox> createState() => _VideoBoxState();
}

class _VideoBoxState extends State<VideoBox> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://res.cloudinary.com/dr1a3h3ll/video/upload/v1683311171/TIAA-HACK/Avatar__The_Way_of_Water___New_Trailer_1_p8mebz.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        _controller.setVolume(0);
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        shape: BoxShape.rectangle,
      ),
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      width: 40.w,
      child: AspectRatio(
        aspectRatio: 5 / 4,
        child: _controller.value.isInitialized
            ? ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Stack(
                  children: [
                    VideoPlayer(
                      _controller,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.8),
                            Colors.black.withOpacity(0),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 1.h,
                      left: 4.w,
                      child: Icon(
                        Icons.play_arrow_outlined,
                        color: Colors.white,
                        size: 3.h,
                      ),
                    ),
                  ],
                ),
              )
            : SizedBox.shrink(),
      ),
    );
  }
}
