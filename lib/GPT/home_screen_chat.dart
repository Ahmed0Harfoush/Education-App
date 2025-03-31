import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:education_app/GPT/suggetion_box.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'chat_screen.dart';

class HomeScreenChat extends StatefulWidget {
  static const String routeName = 'home';
  const HomeScreenChat({super.key});


  @override
  State<HomeScreenChat> createState() => _HomeScreenChatState();
}

class _HomeScreenChatState extends State<HomeScreenChat> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.black,
            Colors.blue,
          ], // Set your gradient colors here
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 40,
            ),
          ),
          title: const Text(
            "Bixby",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "Cera Pro",
              fontSize: 32,
            ),
          ),
          centerTitle: true,
          actions: [
            Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.menu),
                  iconSize: 30.0,
                  onPressed: () {
                    Scaffold.of(context).openDrawer(); // Opens the drawer
                  },
                );
              },
            ),
          ],
        ),
        drawer: Drawer(
          child: FutureBuilder(
            future: SharedPreferences.getInstance(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error loading user data'));
              } else {
                SharedPreferences prefs = snapshot.data as SharedPreferences;
                String accountName = prefs.getString('name') ?? 'Your Name';
                String accountEmail = prefs.getString('email') ?? 'YourEmail@gmail.com';
                String phoneNumber = prefs.getString('phone') ?? '+20 0000000000';
                String cardNumber = prefs.getString('card') ?? '0000 0000 0000 0000';
                String age = prefs.getString('age') ?? 'N/A';

                return ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    UserAccountsDrawerHeader(
                      accountName: Text(accountName),
                      accountEmail: Text(accountEmail),
                      currentAccountPicture: CircleAvatar(
                        backgroundImage: AssetImage('images/User.jpeg'),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text('Phone Number'),
                      subtitle: Text(phoneNumber),
                    ),
                    ListTile(
                      leading: Icon(Icons.credit_card),
                      title: Text('Card Number'),
                      subtitle: Text(cardNumber),
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Age'),
                      subtitle: Text(age),
                    ),
                    ListTile(
                      leading: Icon(Icons.logout),
                      title: Text('Logout'),
                      onTap: () {
                        Navigator.pop(context); // Add your logout logic here
                      },
                    ),
                  ],
                );
              }
            },
          ),
        ),

        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 150,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      'images/chat/bot.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(0),
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  child: AnimatedTextKit(
                      displayFullTextOnTap: true,
                      isRepeatingAnimation: false,
                      repeatForever: false,
                      animatedTexts: [
                        TyperAnimatedText(
                          "Hello, What can I do for you?",
                          speed: const Duration(milliseconds: 50),
                          textStyle: const TextStyle(
                              fontFamily: "Cera Pro",
                              fontSize: 24,
                              color: Colors.white),
                        )
                      ]),
                ),
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Here are some features",
                    style: TextStyle(
                        fontFamily: "Cera Pro",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                const SuggetionBox(
                    header: "Ask For Information",
                    body: "Feel free to ask whatever goes in your mind",
                    color: Colors.deepOrange),
                const SuggetionBox(
                    header: "Powerful AI",
                    body:
                    "Giving facts and up-to-date information with a trained AI bot",
                    color: Colors.deepPurple),
                const SuggetionBox(
                    header: "Fast and Accurate",
                    body:
                    "Our model is trained to be as fast and accurate as possible",
                    color: Colors.greenAccent),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    return ChatScreen();
                  }));
            },
            elevation: 10,
            backgroundColor: Colors.white,
            tooltip: "Chat with Broxi",
            child: Image.asset(
              "images/chat/gpt.png",
              width: 33,
            )),
      ),
    );
  }
}













//
//
//
//
//
// import 'dart:io';
// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:flutter/material.dart';
// import '../pages/account_page.dart';
// import 'chat_screen.dart';
// import 'package:education_app/GPT/suggetion_box.dart';
// import 'package:shared_preferences/shared_preferences.dart'; // Import for SharedPreferences
//
// class HomeScreenChat extends StatefulWidget {
//   static const String routeName = 'home';
//   const HomeScreenChat({super.key});
//
//   @override
//   State<HomeScreenChat> createState() => _HomeScreenChatState();
// }
//
// class _HomeScreenChatState extends State<HomeScreenChat> {
//   late TextEditingController _nameController;
//   late TextEditingController _emailController;
//   late TextEditingController _phoneController;
//   late TextEditingController _cardController;
//   late TextEditingController _ageController;
//   File? _avatarImage;
//
//   @override
//   void initState() {
//     super.initState();
//     _nameController = TextEditingController();
//     _emailController = TextEditingController();
//     _phoneController = TextEditingController();
//     _cardController = TextEditingController();
//     _ageController = TextEditingController();
//     _loadDrawerData(); // Load data when the widget is initialized
//   }
//
//   Future<void> _loadDrawerData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _nameController.text = prefs.getString('name') ?? '';
//       _emailController.text = prefs.getString('email') ?? '';
//       _phoneController.text = prefs.getString('phone') ?? '';
//       _cardController.text = prefs.getString('card') ?? '';
//       _ageController.text = prefs.getString('age') ?? '';
//       // Load the avatar image if you save it in SharedPreferences
//       String? avatarPath = prefs.getString('avatar');
//       if (avatarPath != null) {
//         _avatarImage = File(avatarPath);
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.bottomCenter,
//           end: Alignment.topCenter,
//           colors: [
//             Colors.black,
//             Colors.blue,
//           ],
//         ),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: const Icon(
//               Icons.arrow_back,
//               size: 40,
//             ),
//           ),
//           title: const Text(
//             "Bixby",
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontFamily: "Cera Pro",
//               fontSize: 32,
//             ),
//           ),
//           centerTitle: true,
//           actions: [
//             Builder(
//               builder: (BuildContext context) {
//                 return IconButton(
//                   icon: const Icon(Icons.menu),
//                   iconSize: 30.0,
//                   onPressed: () {
//                     Scaffold.of(context).openDrawer(); // Opens the drawer
//                   },
//                 );
//               },
//             ),
//           ],
//         ),
//         drawer: Drawer(
//           child: FutureBuilder(
//             future: _loadDrawerData(), // Load the data for the drawer
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Center(child: CircularProgressIndicator());
//               } else if (snapshot.hasError) {
//                 return Center(child: Text('Error loading data'));
//               } else {
//                 return ListView(
//                   padding: EdgeInsets.zero,
//                   children: <Widget>[
//                     UserAccountsDrawerHeader(
//                       accountName: Text(_nameController.text.isNotEmpty ? _nameController.text : 'No Name'),
//                       accountEmail: Text(_emailController.text.isNotEmpty ? _emailController.text : 'No Email'),
//                       currentAccountPicture: CircleAvatar(
//                         backgroundImage: _avatarImage != null
//                             ? FileImage(_avatarImage!)
//                             : const AssetImage('images/User.jpeg'), // Replace with your default avatar image path
//                       ),
//                     ),
//                     ListTile(
//                       leading: Icon(Icons.phone),
//                       title: Text('Phone Number'),
//                       subtitle: Text(_phoneController.text.isNotEmpty ? _phoneController.text : 'No Phone Number'),
//                     ),
//                     ListTile(
//                       leading: Icon(Icons.credit_card),
//                       title: Text('Card Number'),
//                       subtitle: Text(_cardController.text.isNotEmpty ? _cardController.text : 'No Card Number'),
//                     ),
//                     ListTile(
//                       leading: Icon(Icons.person),
//                       title: Text('Age'),
//                       subtitle: Text(_ageController.text.isNotEmpty ? _ageController.text : 'No Age'),
//                     ),
//                     ListTile(
//                       leading: Icon(Icons.account_circle),
//                       title: Text('Account Page'),
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => AccountPage()),
//                         );
//                       },
//                     ),
//                     ListTile(
//                       leading: Icon(Icons.logout),
//                       title: Text('Logout'),
//                       onTap: () {
//                         Navigator.pop(context); // Add your logout logic here
//                       },
//                     ),
//                   ],
//                 );
//               }
//             },
//           ),
//         ),
//
//         body: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 const SizedBox(height: 20),
//                 SizedBox(
//                   width: double.infinity,
//                   height: 150,
//                   child: CircleAvatar(
//                     backgroundColor: Colors.white,
//                     child: Image.asset(
//                       'images/chat/bot.png',
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(0),
//                   margin: const EdgeInsets.symmetric(vertical: 30),
//                   child: AnimatedTextKit(
//                     displayFullTextOnTap: true,
//                     isRepeatingAnimation: false,
//                     repeatForever: false,
//                     animatedTexts: [
//                       TyperAnimatedText(
//                         "Hello, What can I do for you?",
//                         speed: const Duration(milliseconds: 50),
//                         textStyle: const TextStyle(
//                           fontFamily: "Cera Pro",
//                           fontSize: 24,
//                           color: Colors.white,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   width: double.infinity,
//                   child: Text(
//                     "Here are some features",
//                     style: TextStyle(
//                       fontFamily: "Cera Pro",
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//                 const SuggetionBox(
//                     header: "Ask For Information",
//                     body: "Feel free to ask whatever goes in your mind",
//                     color: Colors.deepOrange),
//                 const SuggetionBox(
//                     header: "Powerful AI",
//                     body: "Giving facts and up-to-date information with a trained AI bot",
//                     color: Colors.deepPurple),
//                 const SuggetionBox(
//                     header: "Fast and Accurate",
//                     body: "Our model is trained to be as fast and accurate as possible",
//                     color: Colors.greenAccent),
//               ],
//             ),
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () async {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) {
//                 return ChatScreen();
//               }),
//             );
//           },
//           elevation: 10,
//           backgroundColor: Colors.white,
//           tooltip: "Chat with Broxi",
//           child: Image.asset(
//             "images/chat/gpt.png",
//             width: 33,
//           ),
//         ),
//       ),
//     );
//   }
// }
