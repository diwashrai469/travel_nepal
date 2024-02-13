import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class KvideoPlayer extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool looping;

  const KvideoPlayer({
    super.key,
    required this.videoPlayerController,
    required this.looping,
  });

  @override
  State<KvideoPlayer> createState() => _KvideoPlayerState();
}

class _KvideoPlayerState extends State<KvideoPlayer> {
  late ChewieController _chewieController;

  @override
  void initState() {
    _initializeChewieController();
    super.initState();
  }

  @override
  void didUpdateWidget(KvideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.videoPlayerController != oldWidget.videoPlayerController) {
      _disposeChewieController();
      _initializeChewieController();
    }
  }

  void _initializeChewieController() {
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      aspectRatio: 16 / 9,
      autoPlay: true,
      looping: widget.looping,
      autoInitialize: true,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(errorMessage),
        );
      },
    );
  }

  void _disposeChewieController() {
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(controller: _chewieController);
  }

  @override
  void dispose() {
    _disposeChewieController();
    widget.videoPlayerController.dispose();
    super.dispose();
  }
}
