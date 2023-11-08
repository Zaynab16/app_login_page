import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:url_launcher/url_launcher.dart';
enum SelectedIcon {none, facebook, phone, email}
class contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ClassScreen(),
    );
  }
}
void _launchEmail() async {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'blissfit@gmail.com',
  );

  if (await canLaunch(emailLaunchUri.toString())) {
    await launch(emailLaunchUri.toString());
  } else {
    throw 'Could not launch email app.';
  }
}
void _launchFacebook() async {
  final String facebookUrl = 'https://www.facebook.com';

  if (await canLaunch(facebookUrl)) {
    await launch(facebookUrl);
  } else {
    throw 'Could not launch Facebook app or website.';
  }
}
void _launchPhoneWithNumber() async {
  final String phoneNumber = 'tel:57812492';

  if (await canLaunch(phoneNumber)) {
    await launch(phoneNumber);
  } else {
    throw 'Could not launch the phone app.';
  }
}


class ClassScreen extends StatefulWidget {
  @override
  _ClassScreenState createState() => _ClassScreenState();
}

class _ClassScreenState extends State<ClassScreen> {
  SelectedIcon _selectedIcon = SelectedIcon.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 100),
                child: Image.asset(
                  'assets/images/Contact.png',
                  width: 300,
                  height: 300,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Contact Information',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'In case of emergencies, we strongly encourage you to contact us via email. Email allows us to provide immediate assistance and address your concerns promptly. Our dedicated team is available 24/7 to respond to your emergency emails and provide the support you need. Please send your email to blissfit@gmail.com, and we will prioritize your request.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 11,
                    height: 2,

                  ),
                ),
              ),
              SizedBox(height: 90),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIcon =
                        _selectedIcon == SelectedIcon.facebook
                            ? SelectedIcon.none
                            : SelectedIcon.facebook;
                      });
                      if (_selectedIcon == SelectedIcon.facebook) {
                        _launchFacebook();
                      }
                    },
                    child: Icon(
                      Icons.facebook,
                      color: _selectedIcon == SelectedIcon.facebook
                          ? Colors.blue
                          : Colors.grey,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIcon = _selectedIcon == SelectedIcon.phone
                            ? SelectedIcon.none
                            : SelectedIcon.phone;
                      });
                      if (_selectedIcon == SelectedIcon.phone) {
                        _launchPhoneWithNumber();
                      }
                    },
                    child: Icon(
                      Icons.phone,
                      color: _selectedIcon == SelectedIcon.phone
                          ? Colors.green
                          : Colors.grey,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIcon = _selectedIcon == SelectedIcon.email
                            ? SelectedIcon.none
                            : SelectedIcon.email;
                      });
                      if (_selectedIcon == SelectedIcon.email) {
                        _launchEmail();
                      }
                    },
                    child: Icon(
                      Icons.email,
                      color: _selectedIcon == SelectedIcon.email
                          ? Colors.red
                          : Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        );
    }
}