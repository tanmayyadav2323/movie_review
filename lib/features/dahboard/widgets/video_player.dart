import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

/// Stateful widget to fetch and then display video content.
class VideoApp extends StatefulWidget {
  const VideoApp({super.key});

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
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
      height: 50.h,
      width: MediaQuery.of(context).size.width * 0.9,
      color: Color(0xff171717),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Container(
                color: Colors.white.withOpacity(0.01),
                child: AspectRatio(
                  aspectRatio: 5 / 4,
                  child: _controller.value.isInitialized
                      ? VideoPlayer(
                          _controller,
                        )
                      : SizedBox.shrink(),
                ),
              ),
              Positioned(
                bottom: 1.h,
                right: 2.w,
                child: GestureDetector(
                  onTap: () {
                    if (_controller.value.volume > 0) {
                      _controller.setVolume(0);
                    } else {
                      _controller.setVolume(1);
                    }
                    setState(() {});
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 2.h,
                    child: Icon(
                      _controller.value.volume == 0
                          ? Icons.volume_off
                          : Icons.volume_up,
                      size: 2.5.h,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 1.h,
                left: 2.w,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 2.h,
                        color: Color(0xffF5C518),
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Text("4.8")
                    ],
                  ),
                ),
              )
            ],
          ),
          // Positioned(
          //   bottom: 8.h,
          //   left: 6.w,
          //   child: Row(
          //     children: [
          //       ElevatedButton(
          //         onPressed: () {
          //           if (_controller.value.isPlaying)
          //             _controller.pause();
          //           else
          //             _controller.play();
          //           setState(() {});
          //         },
          //         style: ButtonStyle(
          //           backgroundColor: MaterialStateProperty.all<Color>(
          //             _controller.value.isPlaying ? Colors.black : Colors.white,
          //           ),
          //           foregroundColor: MaterialStateProperty.all<Color>(
          //             _controller.value.isPlaying ? Colors.black : Colors.white,
          //           ),
          //         ),
          //         child: SizedBox(
          //           width: 16.w,
          //           child: Flexible(
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 AutoSizeText(
          //                   _controller.value.isPlaying ? "Pause" : "Play",
          //                   style: TextStyle(
          //                     fontSize: 12.sp,
          //                     color: _controller.value.isPlaying
          //                         ? Colors.white
          //                         : Colors.black,
          //                   ),
          //                 ),
          //                 SizedBox(
          //                   width: 1,
          //                 ),
          //                 Flexible(
          //                   child: Icon(
          //                     _controller.value.isPlaying
          //                         ? Icons.pause_circle
          //                         : Icons.play_circle,
          //                     color: _controller.value.isPlaying
          //                         ? Colors.white
          //                         : Colors.black,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //       SizedBox(
          //         width: 50.w,
          //       ),
          //       Icon(
          //         Icons.volume_up,
          //         color: Colors.white,
          //       ),
          //     ],
          //   ),
          // ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16),
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              "Transformers: Rise of the Beasts",
                              maxLines: 4,
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.share,
                            color: Colors.white,
                            size: 3.h,
                          ),
                          Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 3.5.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (_controller.value.isPlaying) {
                                _controller.pause();
                              } else {
                                _controller.play();
                              }
                              setState(() {});
                            },
                            child: Icon(
                              _controller.value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              color: Colors.white,
                              size: 3.5.h,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
