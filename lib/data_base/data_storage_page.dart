// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class DataStoragePage extends StatefulWidget {
//   @override
//   _DataStoragePageState createState() => _DataStoragePageState();
// }
//
// class _DataStoragePageState extends State<DataStoragePage> {
//   String? _savedData = '';
//
//   // Save data to device using SharedPreferences
//   Future<void> _saveData(String data) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('processedData', data);
//   }
//
//   // Load data from device using SharedPreferences
//   Future<void> _loadData() async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _savedData = prefs.getString('processedData') ?? 'No Data Saved';
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _loadData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController _controller = TextEditingController();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Save Data Example'),
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
//               onPressed: () {
//                 String inputData = _controller.text;
//                 _saveData(inputData);
//               },
//               child: Text('Save Data'),
//             ),
//             SizedBox(height: 20),
//             Text('Saved Data: $_savedData'),
//           ],
//         ),
//       ),
//     );
//   }
// }






















import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataStoragePage extends StatefulWidget {
  @override
  _DataStoragePageState createState() => _DataStoragePageState();
}

class _DataStoragePageState extends State<DataStoragePage> {
  String? _savedData = '';

  // Save data to device using SharedPreferences
  Future<void> _saveData(String data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('processedData', data);
    _loadData(); // Reload saved data
  }

  // Load data from device using SharedPreferences
  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedData = prefs.getString('processedData') ?? 'No Data Saved';
    });
  }

  // Delete saved data from device
  Future<void> _deleteData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('processedData');
    _loadData(); // Reload to show no data message
  }

  @override
  void initState() {
    super.initState();
    _loadData(); // Load data when the widget is initialized
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Save Data Example'),
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
              onPressed: () {
                String inputData = _controller.text;
                if (inputData.isNotEmpty) {
                  _saveData(inputData); // Save input data
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Data Saved Successfully!')),
                  );
                  _controller.clear();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter some data')),
                  );
                }
              },
              child: Text('Save Data'),
            ),
            SizedBox(height: 20),
            Text('Saved Data: $_savedData',
                style: TextStyle(fontSize: 16, color: Colors.black87)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _deleteData, // Delete saved data
              child: Text('Clear Saved Data'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
