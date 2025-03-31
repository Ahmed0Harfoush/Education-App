// import 'package:flutter/material.dart';
//
// class CategoryDetailPage extends StatelessWidget {
//   final String categoryName;
//
//   const CategoryDetailPage({Key? key, required this.categoryName}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(categoryName,
//         style: TextStyle(
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//         backgroundColor: Color(0xFF674AEF),),
//       body: Center(
//         child: Text(
//           'Welcome to $categoryName',
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }
















import 'package:flutter/material.dart';

class CategoryDetailPage extends StatelessWidget {
  final String categoryName;
  final String content;

  const CategoryDetailPage({Key? key, required this.categoryName, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFF674AEF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            content,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}