import 'package:flutter/material.dart';
import 'package:subtitle/subtitle.dart';
import 'package:video_player/video_player.dart';

class MeditationVideo extends StatefulWidget {
  MeditationVideo() : super();

  final String title = "";


  @override
  _MeditationVideoState createState() => _MeditationVideoState();
}

class _MeditationVideoState extends State<MeditationVideo> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  bool _showControls = false;
  static const vttData = '''WEBVTT

1
00:00:00.310 --> 00:00:02.200
Hey, I'm John.

2
00:00:03.610 --> 00:00:07.300
And in this session, we're going to focus on healing.

3
00:00:11.110 --> 00:00:15.100
To begin. Let's get into a position that you can

4
00:00:15.110 --> 00:00:18.600
hold for a while but isn't one you'd get sleepy

5
00:00:18.610 --> 00:00:26.500
and Try to have an active posture, so your spine

6
00:00:26.510 --> 00:00:31.800
is tall. And your head is resting gently on your

7
00:00:31.810 --> 00:00:41.600
spine. close your eyes or if you're not comfortable, closing

8
00:00:41.610 --> 00:00:46.300
them, let them gaze, gently downward, in a neutral state,

9
00:00:50.710 --> 00:00:54.200
And begin to take slow deep breaths.

10
00:00:56.010 --> 00:00:58.800
Deeper than you've taken all day so far.

11
00:01:02.810 --> 00:01:07.300
Feeling your lungs and your ribcage expand out as you

12
00:01:07.310 --> 00:01:11.200
breathe in. Holding it for a Beat.

13
00:01:13.710 --> 00:01:19.000
And as you exhale out, allow everything to contract back

14
00:01:19.010 --> 00:01:28.400
in. Allowing the next breath to be even deeper than

15
00:01:28.410 --> 00:01:29.600
the one before it.

16
00:01:33.710 --> 00:01:34.900
And each exhale.

17
00:01:35.910 --> 00:01:39.600
Lasting just a bit longer and your inhale.

18
00:01:47.210 --> 00:01:51.500
Continue breathing in the slower purposeful way and as you

19
00:01:51.510 --> 00:01:57.600
do, feel the connectedness of your body to the surface

20
00:01:57.610 --> 00:01:59.800
you're sitting or resting on.

21
00:02:01.710 --> 00:02:09.800
Just let yourself settle into this groundedness, feeling it begin

22
00:02:09.810 --> 00:02:19.300
to expand through your whole body using this feeling and

23
00:02:19.310 --> 00:02:24.100
your breath as your anchors during this meditation to return

24
00:02:24.110 --> 00:02:28.000
you back to the present moment if you get distracted

25
00:02:28.010 --> 00:02:30.100
or your mind wanders off.

26
00:02:41.910 --> 00:02:42.600
What is it?

27
00:02:42.710 --> 00:02:44.400
You'd like to begin to heal?

28
00:02:48.710 --> 00:02:52.000
As you continue breathing, slowly scan your body.

29
00:02:53.510 --> 00:02:58.600
Noticing any areas that might be calling out for your

30
00:02:58.610 --> 00:03:06.900
attention. Areas. That may feel tight sore.

31
00:03:08.110 --> 00:03:17.800
Or unsettled. With gentleness and compassion.

32
00:03:19.310 --> 00:03:21.100
Breathe into those areas.

33
00:03:23.310 --> 00:03:26.100
Allowing the breath to gently ease them.

34
00:03:45.610 --> 00:03:49.600
Now, begin to breathe into the area surrounding your heart.

35
00:03:51.310 --> 00:03:53.800
Focusing all of your attention here.

36
00:03:56.410 --> 00:03:59.200
You can even place your hands over your heart, if

37
00:03:59.210 --> 00:04:07.200
you wish. And as you breathe, listen, deeply with curiosity,

38
00:04:07.510 --> 00:04:12.800
gentleness and compassion to what your heart is trying to

39
00:04:12.810 --> 00:04:33.800
tell you. Oftentimes, we look at the pieces of ourselves

40
00:04:33.810 --> 00:04:38.700
that need healing as broken, less than or not good

41
00:04:38.710 --> 00:04:42.200
enough. We may avoid dealing with them at all and

42
00:04:42.210 --> 00:04:44.700
over time can even come to resent them.

43
00:04:45.410 --> 00:04:49.200
And by holding this judgment, we hold these parts of

44
00:04:49.210 --> 00:04:51.300
ourselves separate from us.

45
00:04:52.710 --> 00:04:55.400
But when we do this, we are not complete.

46
00:04:56.210 --> 00:05:01.000
We are not loving ourselves totally, which only adds to

47
00:05:01.010 --> 00:05:03.600
the disease we feel in the separation.

48
00:05:05.210 --> 00:05:08.400
Healing can only begin when we look at those parts

49
00:05:08.410 --> 00:05:12.300
of ourselves that we've held separate and in judgment and

50
00:05:12.310 --> 00:05:13.700
we start to forgive them.

51
00:05:15.910 --> 00:05:21.500
we hold compassion toward ourselves and others for the choices

52
00:05:21.510 --> 00:05:28.600
made actions taken and words spoken that may not have

53
00:05:28.610 --> 00:05:32.600
been in alignment with the type of person we wanted

54
00:05:32.610 --> 00:05:37.500
to be We look at those places.

55
00:05:38.710 --> 00:05:42.400
We see the gift in them instead of the broken.

56
00:05:49.210 --> 00:05:51.200
so, as we move into the silent part of the

57
00:05:51.210 --> 00:05:56.400
meditation, see if you can begin to open yourself up.

58
00:05:57.410 --> 00:06:00.500
To this acknowledgement and acceptance.

59
00:06:03.610 --> 00:06:07.500
Allow yourself to gently begin to heal the separation.

60
00:06:09.110 --> 00:06:11.100
And embrace all parts of yourself.

61
00:06:12.210 --> 00:07:25.900
With love. Continue breathing, with your eyes closed.

62
00:07:25.910 --> 00:07:30.000
Begin to allow your attention and drift back to the

63
00:07:30.010 --> 00:07:31.200
room that you're in.

64
00:08:35.710 --> 00:08:37.200
Healing is a process.

65
00:08:38.410 --> 00:08:39.900
It doesn't happen all at once.

66
00:08:41.710 --> 00:08:46.500
We carry around our wounds like badges until we understand

67
00:08:46.510 --> 00:08:49.400
that. We don't need them anymore.

68
00:08:51.010 --> 00:08:53.400
They served us at one point.

69
00:08:54.710 --> 00:08:56.200
But now we can let them go.

70
00:08:57.210 --> 00:08:58.100
It by did.

71
00:08:59.510 --> 00:09:00.500
Piece by piece.

72
00:09:02.410 --> 00:09:05.900
That is the healing and the freedom.

73
00:09:05.910 --> 00:09:07.200
We so deeply wine.

74
00:09:10.110 --> 00:09:12.900
Now, let's take three final deep breaths together.

75
00:09:15.210 --> 00:09:17.300
Taking a deep inhale in.

76
00:09:18.910 --> 00:09:20.400
Holding it for a Beat.

77
00:09:22.110 --> 00:09:23.500
And exhaling a now.

78
00:09:27.710 --> 00:09:31.900
Again, an even deeper breath than the one before.

79
00:09:33.010 --> 00:09:36.200
Feeling it weave in and out of your muscles and

80
00:09:36.210 --> 00:09:40.500
cells, and exhaling it out.

81
00:09:43.810 --> 00:09:48.300
Last time, your deepest breath yet, sending that oxygen through

82
00:09:48.310 --> 00:09:56.200
your entire body, and when you're ready, you can open

83
00:09:56.210 --> 00:09:56.800
your eyes.


Simply for <u>everyone</u>''';

  List<Subtitle> _captions = [];
  late SubtitleController _subtitleController;
  Subtitle? activeSubtitle;


  @override
  void initState() {
    _controller = VideoPlayerController.asset('assets/images/meditation.mp4');
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
                    return Text(
                      activeSubtitle?.data ?? '',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
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
