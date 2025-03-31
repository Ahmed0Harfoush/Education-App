import 'package:education_app/screens/home_screen.dart';
import 'package:education_app/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  final List<String> items = [
    'Flutter Development',
    'Java Programming',
    'Python for Data Science',
    'C++ Basics',
    'Programming',
    'AI',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF674AEF),
        title: Text(
          "Category",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Details about Category',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Text(
              'Available Courses:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    color: Color(0xFF674AEF),
                    child: ListTile(
                      title: Text(items[index],
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Text('Learn more about ${items[index]}',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.arrow_forward, color: Colors.white,),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(), // Replace 'YourCategory' with the appropriate category
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
