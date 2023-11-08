import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class WaterVideo extends StatefulWidget {
  WaterVideo() : super();

  final String title = "Anger Management Techniques";

  @override
  _WaterVideoState createState() => _WaterVideoState();
}

class _WaterVideoState extends State<WaterVideo> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  bool _showControls = false;

  @override
  void initState() {
    _controller = VideoPlayerController.asset('assets/images/waterfall.mp4');
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(5.0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DateTime currentTime = DateTime.now();

    // Check if it's evening (past 6 p.m.)
    bool isEvening = currentTime.hour < 18;
    // Define the colors
    Color NewColor = isEvening ? Color(0xFF181939) : Color(0xFF020A48);
    Color DarkBlue = isEvening ? Color(0xFF3D3463) : Color(0xFF163EB9);
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DarkBlue,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            _showControls = true;
          });
          Future.delayed(Duration(seconds: 2), () {
            setState(() {
              _showControls = false;
            });
          });
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Container(
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            if (_showControls)
                FloatingActionButton(
                  backgroundColor: DarkBlue,
                  onPressed: () {
                    setState(() {
                      if (_controller.value.isPlaying) {
                        _controller.pause();
                      } else {
                        _controller.play();
                      }
                    });
                  },
                  child: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
                ),
          ],
        ),
      ),
    );
  }
}
