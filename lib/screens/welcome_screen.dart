import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'home_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool showContactInfo = false; // Flag to control the visibility of icons

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.6,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.6,
                  decoration: BoxDecoration(
                    color: Color(0xFF674AFF),
                    borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(70)),
                  ),
                  child: Center(
                    child: Image.asset(
                      "images/cover/logo-RST-01.png",
                      scale: 0.8,
                    ),
                  ),
                ),
                // Positioned helper button and optional contact information
                Positioned(
                  top: 40,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Helper button
                      IconButton(
                        icon: Icon(Icons.help_outline,
                            color: Colors.white, size: 30),
                        onPressed: () {
                          setState(() {
                            showContactInfo = !showContactInfo; // Toggle visibility
                          });
                        },
                      ),
                      if (showContactInfo)
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Email
                              Row(
                                children: [
                                  Icon(Icons.email, color: Colors.black, size: 24),
                                  SizedBox(width: 10),
                                  Text(
                                    "ahmdtlt972@gmail.com", // Replace with your email
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              // LinkedIn
                              Row(
                                children: [
                                  IconButton(
                                    icon: FaIcon(FontAwesomeIcons.linkedin,
                                        color: Colors.black, size: 24),
                                    onPressed: () {
                                      _launchURL(
                                          'https://www.linkedin.com/in/ahmed-harfoush-7b623a28b?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app'); // Replace with your LinkedIn URL
                                    },
                                  ),
                                  Text(
                                    "LinkedIn",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              // GitHub
                              Row(
                                children: [
                                  IconButton(
                                    icon: FaIcon(FontAwesomeIcons.github,
                                        color: Colors.black, size: 24),
                                    onPressed: () {
                                      _launchURL('https://github.com/Ahmed0Harfoush'); // Replace with your GitHub URL
                                    },
                                  ),
                                  Text(
                                    "GitHub",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              // GitHub
                              Row(
                                children: [
                                  IconButton(
                                    icon: FaIcon(FontAwesomeIcons.kaggle,
                                        color: Colors.black, size: 24),
                                    onPressed: () {
                                      _launchURL('https://www.kaggle.com/ahmed1harfoush/code'); // Replace with your GitHub URL
                                    },
                                  ),
                                  Text(
                                    "kaggle",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              // GitHub
                              Row(
                                children: [
                                  IconButton(
                                    icon: FaIcon(FontAwesomeIcons.youtube,
                                        color: Colors.black, size: 24),
                                    onPressed: () {
                                      _launchURL('https://www.youtube.com/channel/UCYmjjaNCDfJIWQOfC3pC7Qg'); // Replace with your GitHub URL
                                    },
                                  ),
                                  Text(
                                    "Youtube",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.666,
                decoration: BoxDecoration(
                  color: Color(0xFF674AEF),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.666,
                padding: EdgeInsets.only(top: 40, bottom: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(70)),
                ),
                child: Column(
                  children: [
                    Text(
                      "Learning is Everything",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                        wordSpacing: 2,
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        "Learning with Pleasure with Dear Programmer, Wherever you are.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    Material(
                      color: Color(0xFF674AEF),
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 80),
                          child: Text(
                            "Get Start",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
