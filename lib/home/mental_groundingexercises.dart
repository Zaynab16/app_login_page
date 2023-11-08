import 'package:flutter/material.dart';
import 'package:subtitle/subtitle.dart';
import 'package:video_player/video_player.dart';

class GroundingExercisesVideo extends StatefulWidget {
  GroundingExercisesVideo() : super();

  final String title = "";


  @override
  _GroundingExercisesVideoState createState() => _GroundingExercisesVideoState();
}

class _GroundingExercisesVideoState extends State<GroundingExercisesVideo> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  bool _showControls = false;
  static const vttData = '''WEBVTT

1
00:00:00.710 --> 00:00:02.300
Counting down from 5.

2
00:00:02.710 --> 00:00:05.400
Use your senses to list things around.

3
00:00:05.410 --> 00:00:10.200
You make an effort to notice details about these things.

4
00:00:11.710 --> 00:00:13.000
This is how to do it.

5
00:00:14.310 --> 00:00:18.100
Start by breathing in deeply in through your nose and

6
00:00:18.110 --> 00:00:19.200
out through your mouth.

7
00:00:29.210 --> 00:00:34.800
Then slowly, look at your surroundings, find five things that

8
00:00:34.810 --> 00:00:36.100
you can see around you.

9
00:00:37.610 --> 00:00:40.200
Maybe you see a colorful poster on the wall?

10
00:00:41.210 --> 00:00:43.300
The spider web on the bookshelf.

11
00:00:44.510 --> 00:00:46.600
The lamp on the nightstand.

12
00:00:46.710 --> 00:00:51.600
With the red shade, the cat sleeping peacefully on the

13
00:00:51.610 --> 00:00:54.900
chair. The cactus on the dresser.

14
00:00:54.910 --> 00:00:56.500
That is finally bloomed.

15
00:00:58.010 --> 00:01:02.100
Then list four things that you can touch the warm

16
00:01:02.110 --> 00:01:03.600
mug in your hands.

17
00:01:05.410 --> 00:01:07.700
The soft comforter on the bed.

18
00:01:10.710 --> 00:01:12.600
The denim of your jeans.

19
00:01:14.810 --> 00:01:17.400
The scratchy carpet under your feet.

20
00:01:18.610 --> 00:01:24.200
Next, listen for three things, you can hear maybe the

21
00:01:24.210 --> 00:01:25.400
ticking of a clock.

22
00:01:29.410 --> 00:01:31.500
The quiet hum of your computer.

23
00:01:38.410 --> 00:01:40.800
The sound of traffic from outside.

24
00:01:46.010 --> 00:01:49.600
Now try to find two things that you can smell,

25
00:01:51.110 --> 00:01:55.300
the tea in your mug, the clean scent of your

26
00:01:55.310 --> 00:02:02.900
clothes. Finally, list one emotion that you feel.

27
00:02:07.510 --> 00:02:10.300
This is a way to ground yourself so you can

28
00:02:10.310 --> 00:02:13.800
feel present in the moment and in control of your

29
00:02:13.810 --> 00:02:19.100
surroundings. Now you try.

30
00:03:35.210 --> 00:03:39.100
Use this method when you feel overwhelmed to bring yourself

31
00:03:39.110 --> 00:03:41.000
back to the present moment.


Simply for <u>everyone</u>''';

  List<Subtitle> _captions = [];
  late SubtitleController _subtitleController;
  Subtitle? activeSubtitle;


  @override
  void initState() {
    _controller = VideoPlayerController.asset('assets/images/groundingexercises.mp4');
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(false);
    _controller.setVolume(5.0);
    _subtitleController = SubtitleController(
        provider: SubtitleProvider.fromString(
          data: vttData,
          type: SubtitleType.vtt,
        ));

    _subtitleController.initial();
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
                    padding: EdgeInsets.only(top: (screenHeight*0.25) ), // Add top padding here
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
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.25),
                child: FloatingActionButton(
                  backgroundColor: DarkBlue, // Set the desired color here
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
              ),

            Positioned(
              bottom: 16,
              child: FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    Duration videoPosition = _controller.value.position;
                    // Find the active subtitle for the current video position

                    for (var subtitle in _subtitleController.subtitles) {
                      if (subtitle.start <= videoPosition && videoPosition <= subtitle.end) {
                        activeSubtitle = subtitle;
                        break;
                      }
                    }
                    return Container(
                      color: Colors.yellow, // Set your desired background color here
                      child: Text(
                        activeSubtitle?.data ?? '',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
