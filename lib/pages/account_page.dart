import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _cardController;
  late TextEditingController _ageController;

  File? _avatarImage;
  final ImagePicker _picker = ImagePicker();
  bool _isDataVisible = false; // To control visibility of data vs form

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _cardController = TextEditingController();
    _ageController = TextEditingController();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _nameController.text = prefs.getString('name') ?? '';
      _emailController.text = prefs.getString('email') ?? '';
      _phoneController.text = prefs.getString('phone') ?? '';
      _cardController.text = prefs.getString('card') ?? '';
      _ageController.text = prefs.getString('age') ?? '';
      _isDataVisible = prefs.getBool('isDataVisible') ?? false; // Load visibility state
    });
  }

  Future<void> _saveUserData() async {
    if (_formKey.currentState!.validate()) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('name', _nameController.text);
      await prefs.setString('email', _emailController.text);
      await prefs.setString('phone', _phoneController.text);
      await prefs.setString('card', _cardController.text);
      await prefs.setString('age', _ageController.text);
      await prefs.setBool('isDataVisible', true); // Save visibility state

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User information saved')));

      setState(() {
        _isDataVisible = true; // Show the data instead of the form
      });
    }
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _avatarImage = File(image.path);
      });
    }
  }

  void _showImageDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Action'),
          content: Text('Do you want to choose a new avatar?'),
          actions: [
            TextButton(
              onPressed: () {
                _pickImage();
                Navigator.of(context).pop();
              },
              child: Text('Insert Image'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Information'),
        backgroundColor: Color(0xFF674AEF),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: _isDataVisible ? _buildUserData() : _buildUserForm(),
      ),
    );
  }

  Widget _buildUserForm() {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          Center(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: _avatarImage != null
                      ? FileImage(_avatarImage!)
                      : AssetImage('images/character/images1.png') as ImageProvider,
                ),
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.white),
                  onPressed: _showImageDialog,
                  iconSize: 24.0,
                  color: Colors.blueAccent,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(labelText: 'Name'),
            validator: (value) => value!.isEmpty ? 'Please enter your name' : null,
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'Email'),
            keyboardType: TextInputType.emailAddress,
            validator: (value) => value!.isEmpty ? 'Please enter your email' : null,
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: _phoneController,
            decoration: InputDecoration(labelText: 'Phone Number'),
            keyboardType: TextInputType.phone,
            validator: (value) => value!.isEmpty ? 'Please enter your phone number' : null,
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: _cardController,
            decoration: InputDecoration(labelText: 'Card Number'),
            keyboardType: TextInputType.number,
            validator: (value) => value!.isEmpty ? 'Please enter your card number' : null,
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: _ageController,
            decoration: InputDecoration(labelText: 'Age'),
            keyboardType: TextInputType.number,
            validator: (value) => value!.isEmpty ? 'Please enter your age' : null,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _saveUserData,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF674AEF),
            ),
            child: Text('Save Information',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserData() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0), // Uniform padding around content
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Distribute content evenly vertically
        crossAxisAlignment: CrossAxisAlignment.center, // Center content horizontally
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: _avatarImage != null
                ? FileImage(_avatarImage!)
                : AssetImage('images/character/images1.png') as ImageProvider,
          ),
          SizedBox(height: 30),
          Text('Name: ${_nameController.text}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text('Email: ${_emailController.text}', style: TextStyle(fontSize: 18)),
          SizedBox(height: 10),
          Text('Phone: ${_phoneController.text}', style: TextStyle(fontSize: 18)),
          SizedBox(height: 10),
          Text('Card Number: ${_cardController.text}', style: TextStyle(fontSize: 18)),
          SizedBox(height: 10),
          Text('Age: ${_ageController.text}', style: TextStyle(fontSize: 18)),
          SizedBox(height: 30),
          Align(
            alignment: Alignment.bottomLeft,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _isDataVisible = false; // Show the form again
                  SharedPreferences.getInstance().then((prefs) {
                    prefs.setBool('isDataVisible', false); // Save the updated visibility state
                  });
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF674AEF),
              ),
              child: Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _cardController.dispose();
    _ageController.dispose();
    super.dispose();
  }
}













//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:io';
// import 'dart:math';
// import 'package:mailer/mailer.dart';
// import 'package:mailer/smtp_server.dart';
//
// class AccountPage extends StatefulWidget {
//   @override
//   _AccountPageState createState() => _AccountPageState();
// }
//
// class _AccountPageState extends State<AccountPage> {
//   final _formKey = GlobalKey<FormState>();
//   late TextEditingController _nameController;
//   late TextEditingController _emailController;
//   late TextEditingController _phoneController;
//   late TextEditingController _cardController;
//   late TextEditingController _ageController;
//
//   File? _avatarImage;
//   final ImagePicker _picker = ImagePicker();
//   bool _isDataVisible = false; // To control visibility of data vs form
//
//   @override
//   void initState() {
//     super.initState();
//     _nameController = TextEditingController();
//     _emailController = TextEditingController();
//     _phoneController = TextEditingController();
//     _cardController = TextEditingController();
//     _ageController = TextEditingController();
//     _loadUserData();
//   }
//
//   Future<void> _loadUserData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _nameController.text = prefs.getString('name') ?? '';
//       _emailController.text = prefs.getString('email') ?? '';
//       _phoneController.text = prefs.getString('phone') ?? '';
//       _cardController.text = prefs.getString('card') ?? '';
//       _ageController.text = prefs.getString('age') ?? '';
//       _isDataVisible = prefs.getBool('isDataVisible') ?? false; // Load visibility state
//     });
//   }
//
//   Future<void> _saveUserData() async {
//     if (_formKey.currentState!.validate()) {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       await prefs.setString('name', _nameController.text);
//       await prefs.setString('email', _emailController.text);
//       await prefs.setString('phone', _phoneController.text);
//       await prefs.setString('card', _cardController.text);
//       await prefs.setString('age', _ageController.text);
//       await prefs.setBool('isDataVisible', true); // Save visibility state
//
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User information saved')));
//
//       setState(() {
//         _isDataVisible = true; // Show the data instead of the form
//       });
//     }
//   }
//
//   Future<void> _pickImage() async {
//     final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       setState(() {
//         _avatarImage = File(image.path);
//       });
//     }
//   }
//
//   void _showImageDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Select Action'),
//           content: Text('Do you want to choose a new avatar?'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 _pickImage();
//                 Navigator.of(context).pop();
//               },
//               child: Text('Insert Image'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Close'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   // Function to generate a 4-digit random verification code
//   String _generateVerificationCode() {
//     var rng = Random();
//     return (1000 + rng.nextInt(9000)).toString(); // Generates a random 4-digit code
//   }
//
//   // Function to send verification email
//   Future<void> _sendVerificationEmail(String email, String code) async {
//     String username = 'your_email@example.com';  // Replace with your email
//     String password = 'your_password';          // Replace with your email password
//
//     final smtpServer = gmail(username, password); // Using Gmail SMTP server
//
//     final message = Message()
//       ..from = Address(username, 'Your App Name')
//       ..recipients.add(email)
//       ..subject = 'Your Verification Code'
//       ..text = 'Your verification code is: $code';
//
//     try {
//       final sendReport = await send(message, smtpServer);
//       print('Message sent: ' + sendReport.toString());
//     } catch (e) {
//       print('Message not sent: ' + e.toString());
//     }
//   }
//
//   // Function to verify email by sending a verification code
//   Future<void> _verifyEmail() async {
//     String email = _emailController.text;
//     if (email.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please enter your email')));
//       return;
//     }
//
//     String code = _generateVerificationCode();
//     await _sendVerificationEmail(email, code);
//
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (context) => VerificationScreen(email: email, generatedCode: code),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Account Information'),
//         backgroundColor: Color(0xFF674AEF),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: _isDataVisible ? _buildUserData() : _buildUserForm(),
//       ),
//     );
//   }
//
//   Widget _buildUserForm() {
//     return Form(
//       key: _formKey,
//       child: ListView(
//         children: [
//           Center(
//             child: Stack(
//               alignment: Alignment.bottomRight,
//               children: [
//                 CircleAvatar(
//                   radius: 50,
//                   backgroundImage: _avatarImage != null
//                       ? FileImage(_avatarImage!)
//                       : AssetImage('assets/default_avatar.png') as ImageProvider,
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.edit, color: Colors.white),
//                   onPressed: _showImageDialog,
//                   iconSize: 24.0,
//                   color: Colors.blueAccent,
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 20),
//           TextFormField(
//             controller: _nameController,
//             decoration: InputDecoration(labelText: 'Name'),
//             validator: (value) => value!.isEmpty ? 'Please enter your name' : null,
//           ),
//           SizedBox(height: 10),
//           TextFormField(
//             controller: _emailController,
//             decoration: InputDecoration(labelText: 'Email'),
//             keyboardType: TextInputType.emailAddress,
//             validator: (value) => value!.isEmpty ? 'Please enter your email' : null,
//           ),
//           SizedBox(height: 10),
//           ElevatedButton(
//             onPressed: _verifyEmail, // Verify email on click
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Color(0xFF674AEF),
//             ),
//             child: Text('Verify Email', style: TextStyle(color: Colors.white),),
//           ),
//           SizedBox(height: 10),
//           TextFormField(
//             controller: _phoneController,
//             decoration: InputDecoration(labelText: 'Phone Number'),
//             keyboardType: TextInputType.phone,
//             validator: (value) => value!.isEmpty ? 'Please enter your phone number' : null,
//           ),
//           SizedBox(height: 10),
//           TextFormField(
//             controller: _cardController,
//             decoration: InputDecoration(labelText: 'Card Number'),
//             keyboardType: TextInputType.number,
//             validator: (value) => value!.isEmpty ? 'Please enter your card number' : null,
//           ),
//           SizedBox(height: 10),
//           TextFormField(
//             controller: _ageController,
//             decoration: InputDecoration(labelText: 'Age'),
//             keyboardType: TextInputType.number,
//             validator: (value) => value!.isEmpty ? 'Please enter your age' : null,
//           ),
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: _saveUserData,
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Color(0xFF674AEF),
//             ),
//             child: Text('Save Information',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 15,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildUserData() {
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey, width: 1),
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           CircleAvatar(
//             radius: 60,
//             backgroundImage: _avatarImage != null
//                 ? FileImage(_avatarImage!)
//                 : AssetImage('assets/default_avatar.png') as ImageProvider,
//           ),
//           SizedBox(height: 30),
//           Text('Name: ${_nameController.text}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//           SizedBox(height: 10),
//           Text('Email: ${_emailController.text}', style: TextStyle(fontSize: 18)),
//           SizedBox(height: 10),
//           Text('Phone: ${_phoneController.text}', style: TextStyle(fontSize: 18)),
//           SizedBox(height: 10),
//           Text('Card Number: ${_cardController.text}', style: TextStyle(fontSize: 18)),
//           SizedBox(height: 10),
//           Text('Age: ${_ageController.text}', style: TextStyle(fontSize: 18)),
//           SizedBox(height: 30),
//           ElevatedButton(
//             onPressed: () {
//               setState(() {
//                 _isDataVisible = false;
//               });
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Color(0xFF674AEF),
//             ),
//             child: Text('Edit Information'),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class VerificationScreen extends StatefulWidget {
//   final String email;
//   final String generatedCode;
//
//   VerificationScreen({required this.email, required this.generatedCode});
//
//   @override
//   _VerificationScreenState createState() => _VerificationScreenState();
// }
//
// class _VerificationScreenState extends State<VerificationScreen> {
//   final TextEditingController _codeController = TextEditingController();
//   String? _errorText;
//
//   void _verifyCode() {
//     if (_codeController.text == widget.generatedCode) {
//       // Verification successful
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Email verified successfully!')),
//       );
//       Navigator.of(context).pop(true); // Return success
//     } else {
//       setState(() {
//         _errorText = 'Invalid code. Please try again.';
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Verify Your Email'),
//         backgroundColor: Color(0xFF674AEF),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Text('A verification code has been sent to ${widget.email}'),
//             TextField(
//               controller: _codeController,
//               decoration: InputDecoration(
//                 labelText: 'Enter verification code',
//                 errorText: _errorText,
//               ),
//               keyboardType: TextInputType.number,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _verifyCode,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Color(0xFF674AEF),
//               ),
//               child: Text('Verify', style: TextStyle(color: Colors.white),),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
