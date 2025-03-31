// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class WishlistPage extends StatefulWidget {
//   @override
//   _WishlistPageState createState() => _WishlistPageState();
// }
//
// class _WishlistPageState extends State<WishlistPage> {
//   List<String> wishlist = [];
//
//   // Map course names to their respective image paths
//   final Map<String, String> courseImages = {
//     'Flutter': 'images/Flutter.png',
//     'Java': 'images/Java.png',
//     'Python': 'images/Python.png',
//     'C++': 'images/C++.png',
//     'Programming': 'images/programming.png',
//     'AI': 'images/AI.png',
//   };
//
//   @override
//   void initState() {
//     super.initState();
//     _loadWishlist();
//   }
//
//   // Load wishlist from shared preferences
//   Future<void> _loadWishlist() async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       wishlist = prefs.getStringList('wishlist') ?? [];
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Wishlist'),
//         backgroundColor: Color(0xFF674AEF),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 10),
//         child: wishlist.isEmpty
//             ? Center(child: Text('No courses in wishlist'))
//             : ListView.builder(
//           itemCount: wishlist.length,
//           itemBuilder: (context, index) {
//             String course = wishlist[index];
//             return Container(
//               margin: const EdgeInsets.symmetric(vertical: 5), // Space between each course
//               child: ListTile(
//                 leading: Image.asset(
//                   courseImages[course] ?? '',
//                   width: 50,
//                   height: 50,
//                 ),
//                 title: Text(course),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
//

























import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WishlistPage extends StatefulWidget {
  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  List<String> wishlist = [];

  // Map course names to their respective image paths
  final Map<String, String> courseImages = {
    'Flutter': 'images/language/Flutter.png',
    'Java': 'images/language/Java.png',
    'Python': 'images/language/Python.png',
    'C++': 'images/language/C++.png',
    'Programming': 'images/language/programming.png',
    'AI': 'images/language/AI.png',
  };

  @override
  void initState() {
    super.initState();
    _loadWishlist();
  }

  // Load wishlist from shared preferences
  Future<void> _loadWishlist() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      wishlist = prefs.getStringList('wishlist') ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
        backgroundColor: Color(0xFF674AEF),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: wishlist.isEmpty
            ? Center(child: Text('No courses in wishlist'))
            : ListView.builder(
          itemCount: wishlist.length,
          itemBuilder: (context, index) {
            String course = wishlist[index];
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 10), // Increased space between each course
              child: ListTile(
                leading: Image.asset(
                  courseImages[course] ?? '',
                  width: 50,
                  height: 50,
                ),
                title: Text(course),
              ),
            );
          },
        ),
      ),
    );
  }
}

