// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../models/task_data.dart';
//
// class AddTaskScreen extends StatelessWidget {
//
//   final Function addTaskCallback;
//
//   AddTaskScreen(this.addTaskCallback);
//
//   @override
//   Widget build(BuildContext context) {
//     String? newTaskTitle;
//     return Container(
//       padding: EdgeInsets.all(30),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Text("Add Task",
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 30,
//               color: Colors.indigo[400],
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           TextField(
//             autofocus: true,
//             textAlign: TextAlign.center,
//             onChanged: (newTasks){
//               newTaskTitle = newTasks;
//             },
//           ),
//
//           SizedBox(height: 20,),
//
//           TextButton(
//               onPressed: (){
//                 Provider.of<TaskData>(context, listen: false).addTask(newTaskTitle!);
//                 Navigator.pop(context);
//               },
//               child: Text("Add"),
//             style: TextButton.styleFrom(
//               foregroundColor: Colors.white, backgroundColor: Colors.teal[400],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }























import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Add Task",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: Colors.indigo[400],
              fontWeight: FontWeight.bold,
            ),
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (newTasks) {
              newTaskTitle = newTasks;
            },
          ),
          SizedBox(height: 20),
          TextButton(
            onPressed: () {
              if (newTaskTitle != null && newTaskTitle!.isNotEmpty) {
                Provider.of<TaskData>(context, listen: false)
                    .addTask(newTaskTitle!);
                Navigator.pop(context);
              }
            },
            child: Text("Add"),
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.teal[400],
            ),
          ),
        ],
      ),
    );
  }
}
