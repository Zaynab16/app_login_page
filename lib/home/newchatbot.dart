import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter_tts/flutter_tts.dart';
import 'newchat.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({Key? key}) : super(key: key);

  @override
  _ChatbotScreenState createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();
  late stt.SpeechToText _speech;
  late FlutterTts _tts;

  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    _speech = stt.SpeechToText();
    _tts = FlutterTts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime currentTime = DateTime.now();
    bool isEvening = currentTime.hour < 18;
    // Define the colors
    Color newColor = isEvening ? Color(0xFFE3849E) : Color(0xFF05C0BF);
    Color darkBlue = isEvening ? Color(0xFF3D3463) : Color(0xFF163EB9);
    Color darkBlue1 = isEvening ? Color(0xFF544594) : Color(0xFF163EB9);

    return Scaffold(
      appBar: AppBar(
        title: Text('Let\'s talk'),
        backgroundColor: darkBlue1,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 15, bottom: 10),
              child: Text(
                "Today, ${DateFormat("Hm").format(DateTime.now())}",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Expanded(child: MessagesScreen(messages: messages)),
            Divider(
              height: 5.0,
              color: darkBlue,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(220, 220, 220, 1),
                      ),
                      child: TextField(
                        controller: _controller,
                        style: TextStyle(color: Color(0xFF000000)),
                        decoration: InputDecoration(
                          hintText: "Enter a message...",
                          hintStyle: TextStyle(
                            color: Color(0xFF545454),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 16),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      sendMessage(_controller.text);
                      _controller.clear();
                    },
                    icon: Icon(Icons.send),
                    color: darkBlue,
                  ),
                  IconButton(
                    onPressed: () {
                      startListening();
                    },
                    icon: Icon(Icons.mic),
                    color: darkBlue,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> startListening() async {
    if (!_speech.isListening) {
      bool available = await _speech.initialize(
        onError: (error) {
          print('Error starting speech recognition: $error');
        },
      );
      if (available) {
        _speech.listen(
          onResult: (result) {
            if (result.finalResult) {
              sendMessage(result.recognizedWords);
            }
          },
        );
      } else {
        print('Speech recognition not available');
      }
    } else {
      _speech.stop();
    }
  }

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) {
      print('Message is empty');
    } else {
      setState(() {
        addMessage(Message(text: DialogText(text: [text])), true);
      });

      DetectIntentResponse response = await dialogFlowtter.detectIntent(
        queryInput: QueryInput(text: TextInput(text: text)),
      );
      if (response.message == null) return;
      setState(() {
        addMessage(response.message!);
      });
    }
  }

  Future<void> addMessage(Message message, [bool isUserMessage = false]) async {
    messages.add({'message': message, 'isUserMessage': isUserMessage});

    if (!isUserMessage) {
      await _tts.speak(message.text?.text?.join(' ') ?? '');
    }
  }
}
