// import 'package:flutter/material.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
//
// class DatabaseHelper {
//   static Future<Database> initializeDB() async {
//     String path = await getDatabasesPath();
//     return openDatabase(
//       join(path, 'app_data.db'),
//       onCreate: (database, version) async {
//         await database.execute(
//           'CREATE TABLE data(id INTEGER PRIMARY KEY AUTOINCREMENT, content TEXT NOT NULL)',
//         );
//       },
//       version: 1,
//     );
//   }
//
//   static Future<int> saveData(String content) async {
//     final db = await DatabaseHelper.initializeDB();
//     return await db.insert('data', {'content': content});
//   }
//
//   static Future<List<Map<String, dynamic>>> retrieveData() async {
//     final db = await DatabaseHelper.initializeDB();
//     return await db.query('data');
//   }
// }
//
// class SqflitePage extends StatefulWidget {
//   @override
//   _SqflitePageState createState() => _SqflitePageState();
// }
//
// class _SqflitePageState extends State<SqflitePage> {
//   List<Map<String, dynamic>> _savedData = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _loadData();
//   }
//
//   Future<void> _loadData() async {
//     final data = await DatabaseHelper.retrieveData();
//     setState(() {
//       _savedData = data;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController _controller = TextEditingController();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('SQLite Example'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _controller,
//               decoration: InputDecoration(labelText: 'Enter data to save'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () async {
//                 String inputData = _controller.text;
//                 await DatabaseHelper.saveData(inputData);
//                 _loadData();
//               },
//               child: Text('Save Data'),
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _savedData.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(_savedData[index]['content']),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



















import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'app_data.db'),
      onCreate: (database, version) async {
        await database.execute(
          'CREATE TABLE data(id INTEGER PRIMARY KEY AUTOINCREMENT, content TEXT NOT NULL)',
        );
      },
      version: 1,
    );
  }

  static Future<int> saveData(String content) async {
    final db = await DatabaseHelper.initializeDB();
    return await db.insert('data', {'content': content});
  }

  static Future<List<Map<String, dynamic>>> retrieveData() async {
    final db = await DatabaseHelper.initializeDB();
    return await db.query('data');
  }

  static Future<void> deleteData(int id) async {
    final db = await DatabaseHelper.initializeDB();
    await db.delete('data', where: 'id = ?', whereArgs: [id]);
  }
}

class SqflitePage extends StatefulWidget {
  @override
  _SqflitePageState createState() => _SqflitePageState();
}

class _SqflitePageState extends State<SqflitePage> {
  List<Map<String, dynamic>> _savedData = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final data = await DatabaseHelper.retrieveData();
    setState(() {
      _savedData = data;
    });
  }

  Future<void> _saveData() async {
    String inputData = _controller.text;
    if (inputData.isNotEmpty) {
      await DatabaseHelper.saveData(inputData);
      _controller.clear(); // Clear TextField after saving
      _loadData(); // Reload data to refresh the list
    } else {
      ScaffoldMessenger.of(context as BuildContext).showSnackBar(
        SnackBar(content: Text('Please enter some data')),
      );
    }
  }

  Future<void> _deleteData(int id) async {
    await DatabaseHelper.deleteData(id);
    _loadData(); // Refresh the list after deletion
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Enter data to save'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveData,
              child: Text('Save Data'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _savedData.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_savedData[index]['content']),
                    onLongPress: () => _deleteData(_savedData[index]['id']),
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
