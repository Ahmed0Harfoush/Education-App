// import 'package:education_app/pages/wishlist_page.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert';
//
// class CoursesPage extends StatefulWidget {
//   @override
//   _CoursesPageState createState() => _CoursesPageState();
// }
//
// class _CoursesPageState extends State<CoursesPage> {
//   List<String> courses = ['Flutter', 'Java', 'Python', 'C++', 'programming', 'AI']; // Example course list
//   Set<String> wishlist = {}; // To track courses added to the wishlist
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
//     final savedWishlist = prefs.getStringList('wishlist') ?? [];
//     setState(() {
//       wishlist = savedWishlist.toSet();
//     });
//   }
//
//   // Save wishlist to shared preferences
//   Future<void> _saveWishlist() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setStringList('wishlist', wishlist.toList());
//   }
//
//   // Toggle the course in the wishlist
//   void _toggleWishlist(String course) {
//     setState(() {
//       if (wishlist.contains(course)) {
//         wishlist.remove(course);
//       } else {
//         wishlist.add(course);
//       }
//       _saveWishlist(); // Save the updated wishlist
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Courses'),
//         backgroundColor: Color(0xFF674AEF),
//       ),
//       body: ListView.builder(
//         itemCount: courses.length,
//         itemBuilder: (context, index) {
//           String course = courses[index];
//           bool isWishlisted = wishlist.contains(course);
//           return ListTile(
//             title: Text(course),
//             trailing: IconButton(
//               icon: Icon(
//                 isWishlisted ? Icons.favorite : Icons.favorite_border,
//                 color: isWishlisted ? Colors.red : Colors.grey,
//               ),
//               onPressed: () {
//                 _toggleWishlist(course);
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// //
// //
// // import 'package:education_app/pages/wishlist_page.dart';
// // import 'package:flutter/material.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// //
// // class CoursesPage extends StatefulWidget {
// //   final List<String> courses; // Accept courses list
// //
// //   CoursesPage({required this.courses});
// //
// //   @override
// //   _CoursesPageState createState() => _CoursesPageState();
// // }
// //
// // class _CoursesPageState extends State<CoursesPage> {
// //   Set<String> wishlist = {}; // To track courses added to the wishlist
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _loadWishlist();
// //   }
// //
// //   // Load wishlist from shared preferences
// //   Future<void> _loadWishlist() async {
// //     final prefs = await SharedPreferences.getInstance();
// //     final savedWishlist = prefs.getStringList('wishlist') ?? [];
// //     setState(() {
// //       wishlist = savedWishlist.toSet();
// //     });
// //   }
// //
// //   // Save wishlist to shared preferences
// //   Future<void> _saveWishlist() async {
// //     final prefs = await SharedPreferences.getInstance();
// //     await prefs.setStringList('wishlist', wishlist.toList());
// //   }
// //
// //   // Toggle the course in the wishlist
// //   void _toggleWishlist(String course) {
// //     setState(() {
// //       if (wishlist.contains(course)) {
// //         wishlist.remove(course);
// //       } else {
// //         wishlist.add(course);
// //       }
// //       _saveWishlist(); // Save the updated wishlist
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Courses'),
// //         actions: [
// //           IconButton(
// //             icon: Icon(Icons.favorite),
// //             onPressed: () {
// //               Navigator.push(
// //                 context,
// //                 MaterialPageRoute(builder: (context) => WishlistPage()),
// //               );
// //             },
// //           )
// //         ],
// //       ),
// //       body: ListView.builder(
// //         itemCount: widget.courses.length, // Use the passed courses list
// //         itemBuilder: (context, index) {
// //           String course = widget.courses[index];
// //           bool isWishlisted = wishlist.contains(course);
// //           return ListTile(
// //             title: Text(course),
// //             trailing: IconButton(
// //               icon: Icon(
// //                 isWishlisted ? Icons.favorite : Icons.favorite_border,
// //                 color: isWishlisted ? Colors.red : Colors.grey,
// //               ),
// //               onPressed: () {
// //                 _toggleWishlist(course);
// //               },
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }
// //





import 'package:education_app/pages/wishlist_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CoursesPage extends StatefulWidget {
  @override
  _CoursesPageState createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  List<String> courses = ['Flutter', 'Java', 'Python', 'C++', 'Programming', 'AI']; // Example course list
  Set<String> wishlist = {}; // To track courses added to the wishlist

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
    final savedWishlist = prefs.getStringList('wishlist') ?? [];
    setState(() {
      wishlist = savedWishlist.toSet();
    });
  }

  // Save wishlist to shared preferences
  Future<void> _saveWishlist() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('wishlist', wishlist.toList());
  }

  // Toggle the course in the wishlist
  void _toggleWishlist(String course) {
    setState(() {
      if (wishlist.contains(course)) {
        wishlist.remove(course);
      } else {
        wishlist.add(course);
      }
      _saveWishlist(); // Save the updated wishlist
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Courses'),
        backgroundColor: Color(0xFF674AEF),
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          String course = courses[index];
          bool isWishlisted = wishlist.contains(course);
          return ListTile(
            leading: Image.asset(
              courseImages[course] ?? '',
              width: 40,
              height: 40,
            ),
            title: Text(course),
            trailing: IconButton(
              icon: Icon(
                isWishlisted ? Icons.favorite : Icons.favorite_border,
                color: isWishlisted ? Colors.red : Colors.grey,
              ),
              onPressed: () {
                _toggleWishlist(course);
              },
            ),
          );
        },
      ),
    );
  }
}

