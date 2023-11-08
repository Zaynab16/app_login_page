import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

Image logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 320,
    height: 220,
    //color: Colors.white,
  );
}

Container reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return Container(

    height: 65,
    child: TextField(
      controller: controller,
      obscureText: isPasswordType,
      enableSuggestions: !isPasswordType,
      autocorrect: !isPasswordType,
      cursorColor: Colors.black38,
      style: TextStyle(color: Colors.black.withOpacity(0.9)),
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.black38,
        ),
        suffix:
        IconButton(
          icon: Icon(Icons.volume_up,
            color: Colors.black12,),
          onPressed: () {
            textToSpeech('Enter your email address and password');
          },
          iconSize: 22.0,
        ),

        labelText: text,
        labelStyle: TextStyle(color: Colors.black38.withOpacity(0.9)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.white.withOpacity(0.3),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(width: 0, color: Colors.black26,
              style: BorderStyle.solid,)),
      ),
      keyboardType: isPasswordType
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
    ),);
}
FlutterTts flutterTts = FlutterTts();
void textToSpeech(String text) async {
  await flutterTts.setLanguage("en-US");
  await flutterTts.setVolume(5);
  await flutterTts.setSpeechRate(0.4);
  await flutterTts.setPitch(4);
  await flutterTts.speak(text);
}

Container signInSignUpButton(
    BuildContext context, bool isLogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        isLogin ? 'LOG IN' : 'SIGN UP',
        style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black26;
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
    ),
  );
}
