import 'package:flutter/material.dart';
import 'package:subtitle/subtitle.dart';
import 'package:video_player/video_player.dart';

class AngerManagementVideo extends StatefulWidget {
  AngerManagementVideo() : super();

  final String title = "";


  @override
  _AngerManagementVideoState createState() => _AngerManagementVideoState();
}

class _AngerManagementVideoState extends State<AngerManagementVideo> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  bool _showControls = false;
  static const vttData = '''WEBVTT

1
00:00:05.210 --> 00:00:08.200
Hi friends. Do you ever feel so angry that you

2
00:00:08.210 --> 00:00:09.600
want to explode?

3
00:00:09.710 --> 00:00:13.400
Do you ever feel annoyed irritated mad or Furious?

4
00:00:13.410 --> 00:00:16.200
Anger is a very common and normal emotion

5
00:00:16.210 --> 00:00:18.600
that everyone experiences. Uncontrolled

6
00:00:18.610 --> 00:00:21.500
anger can get you into lots of trouble and can

7
00:00:21.510 --> 00:00:24.100
cause harm to your health and to your relationships.

8
00:00:24.310 --> 00:00:26.500
It can cause you to say and do things

9
00:00:26.510 --> 00:00:28.800
you would never do if you were calm and under

10
00:00:28.810 --> 00:00:32.300
control. It is important to practice healthy ways to manage

11
00:00:32.310 --> 00:00:33.600
your anger. Today

12
00:00:33.610 --> 00:00:36.900
you will learn about five different types of coping skills

13
00:00:36.910 --> 00:00:40.000
to help you control your angry emotions. Coping skills are

14
00:00:40.010 --> 00:00:43.000
things you can do to calm your brain and body

15
00:00:43.110 --> 00:00:44.200
and think more clearly.

16
00:00:44.210 --> 00:00:47.800
When your temper rises before turning to coping skills, it

17
00:00:47.810 --> 00:00:50.700
can be helpful to notice warning signs in your body

18
00:00:50.710 --> 00:00:53.600
that let you know you are feeling angry. Examples of

19
00:00:53.610 --> 00:00:58.700
warning signs include heavy breathing, racing heartbeat feeling, hot clenching,

20
00:00:58.710 --> 00:00:59.700
your fists or jaw,

21
00:01:00.310 --> 00:01:02.500
shaking or tightness in your chest.

22
00:01:02.510 --> 00:01:06.000
They also might include actions such as raising your voice,

23
00:01:06.010 --> 00:01:10.900
arguing, yelling, refusing to talk, threatening others, or pacing back

24
00:01:10.910 --> 00:01:14.100
and forth. These symptoms can be helpful warning signs to

25
00:01:14.110 --> 00:01:16.700
let you know that you need to stop and calm

26
00:01:16.710 --> 00:01:20.100
down. Here are five different types of coping skills that

27
00:01:20.110 --> 00:01:22.200
can help you better manage your anger.

28
00:01:22.310 --> 00:01:27.100
Number one, relaxation skills. Relaxation skills can help to relax your

29
00:01:27.110 --> 00:01:28.300
brain and body.

30
00:01:28.410 --> 00:01:29.800
These might include tensing.

31
00:01:30.010 --> 00:01:33.600
And relaxing your muscles spending time in nature, taking a

32
00:01:33.610 --> 00:01:38.900
nap, doing a 5 minute, meditation, grounding exercises or practicing

33
00:01:38.910 --> 00:01:40.300
deep breathing techniques.

34
00:01:40.510 --> 00:01:43.400
Try the following deep breathing techniques for 2 to 3

35
00:01:43.410 --> 00:01:47.600
minutes or until you feel calm belly breathing, breathe deep

36
00:01:47.610 --> 00:01:50.000
through your nose, feeling your belly, expand.

37
00:01:50.110 --> 00:01:51.900
Hold your breath for a couple seconds.

38
00:01:51.910 --> 00:01:54.300
Then breathe long and slow out your mouth.

39
00:01:54.410 --> 00:01:56.900
Feeling your belly return to its resting position.

40
00:01:57.410 --> 00:02:01.200
Square. Breathing breathe in your nose for four seconds hold

41
00:02:01.210 --> 00:02:02.700
your breath for four seconds.

42
00:02:02.910 --> 00:02:05.900
Breathe out your mouth for four seconds rest for four

43
00:02:05.910 --> 00:02:08.900
seconds. Trace the shape of a square in the air

44
00:02:09.010 --> 00:02:10.200
as you do your breathing.

45
00:02:10.410 --> 00:02:13.700
Triangle. Breathing breathe in your nose for three seconds.

46
00:02:13.910 --> 00:02:15.500
Hold your breath for three seconds.

47
00:02:15.610 --> 00:02:17.600
Breathe out your mouth for three seconds NHS.

48
00:02:17.810 --> 00:02:20.000
Number two, distraction skills.

49
00:02:20.110 --> 00:02:23.900
Distraction skills help get your mind off the angry situation.

50
00:02:24.010 --> 00:02:27.900
Practice creative outlets such as hobbies, art, or writing in

51
00:02:27.910 --> 00:02:31.600
a journal. Other healthy distractions might include counting from one

52
00:02:31.610 --> 00:02:35.000
to one hundred, listening to music, watching a movie, or

53
00:02:35.010 --> 00:02:36.100
playing with a pet.

54
00:02:36.210 --> 00:02:39.000
Number three, movie agent or physical release.

55
00:02:39.110 --> 00:02:42.800
Sometimes, anger can cause you to get physically aggressive, which

56
00:02:42.810 --> 00:02:45.500
can result in harm to yourself or others.

57
00:02:45.610 --> 00:02:49.200
It is important to practice healthy movement activities to release

58
00:02:49.210 --> 00:02:51.000
your anger in a productive way.

59
00:02:51.110 --> 00:02:55.300
This might include walking away from the angry situation, running,

60
00:02:55.410 --> 00:02:59.800
biking, swimming, March Arts or exercises in your bedroom such

61
00:02:59.810 --> 00:03:04.600
as push-ups. Sit-ups wall, sits planks, or stretching number for

62
00:03:04.710 --> 00:03:06.700
thinking skills, thinking, skills, help?

63
00:03:06.710 --> 00:03:09.800
You notice negative thoughts that trigger your anger and then

64
00:03:09.810 --> 00:03:13.300
change these thoughts to something more helpful and encouraging.

65
00:03:13.310 --> 00:03:16.600
For example, maybe you're thinking about how unfair it is

66
00:03:16.610 --> 00:03:18.500
that you have to do your homework before.

67
00:03:18.510 --> 00:03:21.000
You can watch TV or how rude it is that

68
00:03:21.010 --> 00:03:24.100
your friend brags after beating you at a board game.

69
00:03:24.110 --> 00:03:27.500
Instead of letting these thoughts take over, you can Change

70
00:03:27.510 --> 00:03:30.100
your thoughts by telling yourself relax.

71
00:03:30.110 --> 00:03:31.700
It's okay, time out.

72
00:03:31.710 --> 00:03:34.900
I'm taking a walk or I'm letting this one go.

73
00:03:35.110 --> 00:03:38.200
It's not worth getting angry about it is important to

74
00:03:38.210 --> 00:03:41.500
remember that. Your thoughts can affect your feelings, and your

75
00:03:41.510 --> 00:03:45.100
actions. So if you change your thoughts, then you can

76
00:03:45.110 --> 00:03:47.500
change the way you feel and how you act.

77
00:03:48.210 --> 00:03:50.800
Number 5 communication skills.

78
00:03:51.010 --> 00:03:53.600
It can be helpful to use your words to express.

79
00:03:53.610 --> 00:03:54.500
How you feel?

80
00:03:54.710 --> 00:03:57.200
Tell the other person how they made you feel, but

81
00:03:57.210 --> 00:04:00.500
don't blame judge or criticize use.

82
00:04:00.510 --> 00:04:04.400
I statements such as I feel mad when you brag

83
00:04:04.410 --> 00:04:07.800
about winning because it seems like you don't care about

84
00:04:07.810 --> 00:04:11.900
my feelings. You can also use communication skills by asking

85
00:04:11.910 --> 00:04:15.300
for help or talking to a supportive person such as

86
00:04:15.310 --> 00:04:20.000
a friend parent-teacher, Or counselor you may not be able

87
00:04:20.010 --> 00:04:23.600
to completely get rid of your angry feelings, but coping

88
00:04:23.610 --> 00:04:26.200
skills can help you reduce your anger to a more

89
00:04:26.210 --> 00:04:30.100
manageable level and anger, thermometer can be a useful visual

90
00:04:30.110 --> 00:04:32.200
tool to help you manage your anger.

91
00:04:32.310 --> 00:04:36.000
First. You can identify your level of Anger from annoyed,

92
00:04:36.010 --> 00:04:39.300
too enraged, then you can move across to the, corresponding

93
00:04:39.310 --> 00:04:42.700
coping skills, and practice, one or more coping skills to

94
00:04:42.710 --> 00:04:45.000
help you control your angry emotions.

95
00:04:45.110 --> 00:04:48.200
If one coping skill does not work, then move, Another

96
00:04:48.210 --> 00:04:51.500
until you find the combination of coping skills that help

97
00:04:51.510 --> 00:04:53.800
you to feel calm and under control.

98
00:04:53.910 --> 00:04:57.000
It's okay to feel angry, but what's important is that

99
00:04:57.010 --> 00:04:59.500
you find healthy ways to manage your anger.

100
00:04:59.610 --> 00:05:03.200
The next time you feel your angry emotions rising, stop

101
00:05:03.210 --> 00:05:06.400
and remind yourself to practice a coping strategy from one

102
00:05:06.410 --> 00:05:11.900
of the following categories relaxation skills, distraction skills, movement skills,

103
00:05:11.910 --> 00:05:14.800
thinking skills or communication skills.

104
00:05:14.810 --> 00:05:17.600
If you found this video helpful, please like, share and

105
00:05:17.610 --> 00:05:21.500
subscribe. For more social, emotional and mental health resources for

106
00:05:21.510 --> 00:05:23.900
kids and teens, please visit 

107
00:05:23.910 --> 00:05:26.700
www.mentalhealthcenterkids.com.

108
00:05:26.810 --> 00:05:27.700
Thanks for watching.
Simply for <u>everyone</u>''';

  List<Subtitle> _captions = [];
  late SubtitleController _subtitleController;
  Subtitle? activeSubtitle;


  @override
  void initState() {
    _controller = VideoPlayerController.asset('assets/images/anger.mp4');
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
