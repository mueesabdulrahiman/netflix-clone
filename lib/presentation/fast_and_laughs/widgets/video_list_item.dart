import 'package:flutter/material.dart';
import 'package:netfilx/application/fast_laugh/fastlaugh_bloc.dart';
import 'package:netfilx/core/colors.dart';
import 'package:netfilx/core/strings.dart';
import 'package:netfilx/domain/downloads/models/downloads.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

class VideoListItemInheritedWidget extends InheritedWidget {
  final Widget widget;
  final Downloads movieData;
  const VideoListItemInheritedWidget({
    Key? key,
    required this.widget,
    required this.movieData,
  }) : super(key: key, child: widget);

  @override
  bool updateShouldNotify(covariant VideoListItemInheritedWidget oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static VideoListItemInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListItemInheritedWidget>();
  }
}

class VideoListItem extends StatelessWidget {
  const VideoListItem({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final posterPath =
        VideoListItemInheritedWidget.of(context)?.movieData.posterPath;
    final videoUrl = dummyVideoUrls[index % dummyVideoUrls.length];
    return Stack(
      children: [
        FastLaughsVideoPlayer(videoUrl: videoUrl, onStateChanged: (value) {}),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 30.0,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.volume_mute,
                        size: 35.0,
                      )),
                ),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: posterPath == null
                          ? null
                          : NetworkImage('$kImageAppendUrl$posterPath'),
                    ),
                    ValueListenableBuilder(
                      valueListenable: likeVideosIdsNotifier,
                      builder: (BuildContext ctx, Set<int> newList, Widget? _) {
                        if (newList.contains(index)) {
                          return GestureDetector(
                            onTap: () {
                              likeVideosIdsNotifier.value.remove(index);
                              likeVideosIdsNotifier.notifyListeners();
                            },
                            child: const VideoActions(
                              icon: Icons.emoji_emotions,
                              iconColor: Colors.yellow,
                              title: 'Lol',
                              titleColor: Colors.yellow,
                            ),
                          );
                        } else {
                          return GestureDetector(
                            onTap: () {
                              likeVideosIdsNotifier.value.add(index);
                              likeVideosIdsNotifier.notifyListeners();
                            },
                            child: const VideoActions(
                              icon: Icons.emoji_emotions,
                              title: 'Lol',
                            ),
                          );
                        }
                      },
                    ),
                    const VideoActions(
                      icon: Icons.add,
                      title: 'My List',
                    ),
                    GestureDetector(
                      onTap: () {
                        final videoName =
                            VideoListItemInheritedWidget.of(context)
                                ?.movieData
                                .posterPath;
                        if (posterPath != null) {
                          Share.share(videoName!);
                        }
                      },
                      child: const VideoActions(
                        icon: Icons.share,
                        title: 'Share',
                      ),
                    ),
                    const VideoActions(
                      icon: Icons.play_arrow,
                      title: 'Play',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class VideoActions extends StatelessWidget {
  const VideoActions(
      {Key? key,
      required this.icon,
      required this.title,
      this.iconColor,
      this.titleColor})
      : super(key: key);
  final IconData icon;
  final String title;
  final Color? iconColor;
  final Color? titleColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: Column(
        children: [
          Icon(
            icon,
            color: iconColor ?? kWhiteColor,
          ),
          Text(
            title,
            style: TextStyle(color: titleColor ?? kWhiteColor),
          ),
        ],
      ),
    );
  }
}

class FastLaughsVideoPlayer extends StatefulWidget {
  const FastLaughsVideoPlayer(
      {Key? key, required this.videoUrl, required this.onStateChanged})
      : super(key: key);
  final String videoUrl;
  final void Function(bool isPlaying) onStateChanged;

  @override
  State<FastLaughsVideoPlayer> createState() => _FastLaughsVideoPlayerState();
}

class _FastLaughsVideoPlayerState extends State<FastLaughsVideoPlayer> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    _videoPlayerController.initialize().then((value) {
      setState(() {});
      _videoPlayerController.play();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: _videoPlayerController.value.isInitialized
          ? AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController),
            )
          : const Center(
              child: CircularProgressIndicator(
              strokeWidth: 2,
            )),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}
