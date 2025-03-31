import 'package:flutter/material.dart';

class BookStorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF674AEF),
          title: Text("BookStore",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
      ),
      body: Center(
        child: Text(
          'Details about the BookStore',
          style: TextStyle(fontSize: 24,),
        ),
      ),
    );
  }
}

