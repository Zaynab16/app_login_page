import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';

class MoodSwingsPage extends StatefulWidget {
  final List<bool> showPlusIcon;
  final Function(int) updatePlusIconVisibility;
  final int index;
  final Function(int,int) addCircle;

  MoodSwingsPage({
    required this.showPlusIcon,
    required this.updatePlusIconVisibility,
    required this.index,
    required this.addCircle,
  });

  @override
  _MoodSwingsPageState createState() => _MoodSwingsPageState();
}

class _MoodSwingsPageState extends State<MoodSwingsPage> {
  int _selectedMoodIndex = -1;
  bool _showButtons=false;

  @override
  Widget build(BuildContext context) {
    DateTime currentTime = DateTime.now();

    // Check if it's evening (past 6 p.m.)
    bool isEvening = currentTime.hour < 18;
    // Define the colors
    Color NewColor = isEvening ? Color(0xFF181939) : Color(0xFF020A48);
    Color DarkBlue = isEvening ? Color(0xFF3D3463) : Color(0xFF163EB9);
    Color bgColor;
    switch (_selectedMoodIndex) {
      case 0:
        bgColor = Colors.yellow;
        break;
      case 1:
        bgColor = Colors.greenAccent;
        break;
      case 2:
        bgColor = Colors.deepPurpleAccent;
        break;
      case 3:
        bgColor = Colors.grey;
        break;
      case 4:
        bgColor = Colors.black54;
        break;
      default:
        bgColor = DarkBlue;
    }

    return Scaffold(
      body: Container(
        color: bgColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSmile(),
              SizedBox(height: 30),
              Text(
                'How are you feeling today?',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildMoodButton(0, '😁'),
                  _buildMoodButton(1, '😊'),
                  _buildMoodButton(2, '😐'),
                  _buildMoodButton(3, '😔'),
                  _buildMoodButton(4, '😞'),
                ],
              ),
              SizedBox(height: 30),
              if (_showButtons) _buildButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSmile() {
    IconData iconData;
    Color color;
    DateTime currentTime = DateTime.now();

    // Check if it's evening (past 6 p.m.)
    bool isEvening = currentTime.hour < 18;
    // Define the colors
    Color NewColor = isEvening ? Color(0xFF181939) : Color(0xFF020A48);
    Color DarkBlue = isEvening ? Color(0xFF3D3463) : Color(0xFF163EB9);

    switch (_selectedMoodIndex) {
      case 0:
        iconData = FontAwesomeIcons.solidLaughBeam;
        color = Colors.yellow;
        break;
      case 1:
        iconData = FontAwesomeIcons.solidSmile;
        color = Colors.greenAccent;
        break;
      case 2:
        iconData = FontAwesomeIcons.solidMeh;
        color = Colors.deepPurpleAccent;
        break;
      case 3:
        iconData = FontAwesomeIcons.solidFrown;
        color = Colors.grey;
        break;
      case 4:
        iconData = FontAwesomeIcons.solidTired;
        color = Color(0xFF0000008A);
        break;
      default:
        iconData = CupertinoIcons.heart_fill;
        color = DarkBlue;
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      margin: EdgeInsets.only(top: 20.0),
      child: Align(
        alignment: Alignment.center,
        child: FaIcon(
          iconData,
          size: 90,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildButtons() {
    return Container(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            onPressed: () {
              widget.updatePlusIconVisibility(widget.index);
              widget.addCircle(widget.index,_selectedMoodIndex);
              Navigator.pop(context);

            },
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: Colors.white,
                  width: 1.5,
                ),
              ),
            ),
            child: Text('Save'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: Colors.white,
                  width: 1.5,
                ),
              ),
            ),
            child: Text('Discard'),
          ),
        ],
      ),
    );
  }



  Widget _buildMoodButton(int index, String moodEmoji) {
    final isSelected = _selectedMoodIndex == index;

    Color moodColor;
    switch (index) {
      case 0:
        moodColor = Colors.red;
        break;
      case 1:
        moodColor = Colors.orange;
        break;
      case 2:
        moodColor = Colors.yellow;
        break;
      case 3:
        moodColor = Colors.lightGreen;
        break;
      case 4:
        moodColor = Colors.green;
        break;
      default:
        moodColor = Colors.amber;
    }

    return GestureDetector(
      onTap: () => setState(() {
        _selectedMoodIndex = index;
        _showButtons = true;
      }),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.white  : Colors.grey[300],
        ),
        child: Center(
          child: Text(
              moodEmoji,
              style: TextStyle(fontSize: 30),
        ),
      ),
    ),
    );
  }
}