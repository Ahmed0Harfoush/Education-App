// import 'package:flutter/material.dart';
//
//
// class DescriptionScreen extends StatelessWidget {
//   const DescriptionScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text("""
//         Flutter is an open-source UI software development kit (SDK) created by Google, primarily used for building natively compiled applications for mobile (Android and iOS), web, and desktop from a single codebase. Key features of Flutter include:
//
// 1. **Single Codebase**: With Flutter, developers write one codebase that works across multiple platforms, allowing for more efficient development and maintenance.
//
// 2. **Dart Language**: Flutter apps are written in Dart, a client-optimized programming language. Dart is designed for fast development and offers both ahead-of-time (AOT) and just-in-time (JIT) compilation, enhancing both development speed and app performance.
//
// 3. **Widgets**: Flutter uses a rich set of customizable widgets to create complex, flexible user interfaces. Every element, from buttons to layouts, is a widget, which can be composed and nested to build an app's UI.
//
// 4. **Hot Reload**: One of the standout features of Flutter is its "hot reload" functionality, which allows developers to see the effects of code changes almost instantly without restarting the entire application.
//
// 5. **Native Performance**: Flutter's rendering engine is based on Skia, a high-performance graphics library that provides pixel-perfect rendering on both iOS and Android. This results in fast performance and fluid animations.
//
// 6. **Extensive Libraries**: The ecosystem around Flutter includes thousands of packages and plugins, allowing developers to quickly add features like Firebase integration, authentication, and more.
//
// 7. **Cross-Platform Development**: In addition to mobile development, Flutter also supports building apps for web, Windows, macOS, and Linux, making it a versatile solution for cross-platform development.
//
// 8. **Customizable**: Flutter allows for full control over every pixel on the screen, enabling developers to create custom UIs, animations, and transitions. It’s widely used for creating visually appealing, high-performance apps.
//
// Flutter's community and Google’s continuous updates make it a robust choice for developers aiming to create applications efficiently across different platforms.
//         """,
//           style: TextStyle(
//             fontSize: 18,
//             color: Colors.black,
//           ),
//           textAlign: TextAlign.justify,
//         ),
//         SizedBox(height: 20,),
//         Row(
//           children: [
//             Text("Course Length: ",
//               style: TextStyle(
//                 fontSize: 19,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//
//             Icon(Icons.timer,
//               color: Color(0xFF674AEF),
//             ),
//             SizedBox(width: 5,),
//             Text("26 Hours",
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ],
//         ),
//         Row(
//           children: [
//             Text("Rating: ",
//               style: TextStyle(
//                 fontSize: 19,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//
//             Icon(Icons.star,
//               color: Colors.amber,
//             ),
//             SizedBox(width: 5,),
//             Text("4.5",
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }



























import 'package:flutter/material.dart';

class DescriptionScreen extends StatelessWidget {
  final Map<String, dynamic> courseDetails;

  DescriptionScreen({required this.courseDetails});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            courseDetails['description'],
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Text(
                "Course Length: ",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(
                Icons.timer,
                color: Color(0xFF674AEF),
              ),
              SizedBox(width: 5),
              Text(
                courseDetails['length'],
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text(
                "Rating: ",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(
                Icons.star,
                color: Colors.amber,
              ),
              SizedBox(width: 5),
              Text(
                courseDetails['rating'].toString(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
