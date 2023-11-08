import 'package:bubble/bubble.dart';
import 'package:dialogflow_flutter/googleAuth.dart';
import 'package:dialogflow_flutter/language.dart';
import 'package:flutter/material.dart';
import 'package:dialogflow_flutter/dialogflowFlutter.dart';
//import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:intl/intl.dart';


class Chatbot extends StatefulWidget {


  @override
  _ChatbotState createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot> {
  void response(query) async {
    AuthGoogle authGoogle = await AuthGoogle(
        fileJson: "assets/images/allCredentials.json")
        .build();
    DialogFlow dialogflow =
    DialogFlow(authGoogle: authGoogle, language: Language.english);
    AIResponse aiResponse = await dialogflow.detectIntent(query);
    setState(() {
      messsages.insert(0, {
        "data": 0,
        "message": aiResponse.getListMessage()![0]["text"]["text"][0].toString()
      });
    });


    print(aiResponse.getListMessage()![0]["text"]["text"][0].toString());
  }

  final messageInsert = TextEditingController();
  List<Map> messsages = [];

  @override
  Widget build(BuildContext context) {
    DateTime currentTime = DateTime.now();

    // Check if it's evening (past 6 p.m.)
    bool isEvening = currentTime.hour >= 18 && currentTime.hour < 24;
    // Define the colors
    Color NewColor = isEvening ?  Color(0xFF020A48):Color(0xFF181939) ;
    Color DarkBlue = isEvening ?  Color(0xFF163EB9): Color(0xFF3D3463) ;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "LET'\S TALK",
        ),
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
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 15, bottom: 10),
              child: Text("Today, ${DateFormat("Hm").format(DateTime.now())}", style: TextStyle(
                  fontSize: 20
              ),),
            ),
            Flexible(
                child: ListView.builder(
                    reverse: true,
                    itemCount: messsages.length,
                    itemBuilder: (context, index) => chat(
                        messsages[index]["message"].toString(),
                        messsages[index]["data"]))),
            SizedBox(
              height: 20,
            ),

            Divider(
              height: 5.0,
              color: DarkBlue,
            ),
            Container(


              child: ListTile(

                title: Container(
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(
                        15)),
                    color: Color.fromRGBO(220, 220, 220, 1),
                  ),
                  padding: EdgeInsets.only(left: 15),
                  child: TextFormField(
                    controller: messageInsert,
                    decoration: InputDecoration(
                      hintText: "Enter a Message...",
                      hintStyle: TextStyle(
                          color: Colors.black26
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),

                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black
                    ),
                    onChanged: (value) {

                    },
                  ),
                ),

                trailing: IconButton(

                    icon: Icon(

                      Icons.send,
                      size: 30.0,
                      color: DarkBlue,
                    ),
                    onPressed: () {

                      if (messageInsert.text.isEmpty) {
                        print("empty message");
                      } else {
                        setState(() {
                          messsages.insert(0,
                              {"data": 1, "message": messageInsert.text});
                        });
                        response(messageInsert.text);
                        messageInsert.clear();
                      }
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                    }),

              ),

            ),

            SizedBox(
              height: 15.0,
            )
          ],
        ),
      ),
    );
  }
  Widget chat(String message, int data) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),

      child: Row(
        mainAxisAlignment: data == 1 ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [

          data == 0 ? Container(
            height: 60,
            width: 60,
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/dawn.jpg"),
            ),
          ) : Container(),

          Padding(
            padding: EdgeInsets.all(10.0),
            child: Bubble(
                radius: Radius.circular(15.0),
                color: data == 0 ? Color.fromRGBO(23, 157, 139, 1) : Colors.orangeAccent,
                elevation: 0.0,

                child: Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[

                      SizedBox(
                        width: 10.0,
                      ),
                      Flexible(
                          child: Container(
                            constraints: BoxConstraints( maxWidth: 200),
                            child: Text(
                              message,
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ))
                    ],
                  ),
                )),
          ),
          data == 1? Container(
            height: 60,
            width: 60,
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/anger.jpg"),
            ),
          ) : Container(),
        ],
      ),
    );
  }
}
