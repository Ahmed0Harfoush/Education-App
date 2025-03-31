// import 'package:flutter/material.dart';
// import 'package:education_app/ToDo/screens/add_task_screen.dart';
// import '../models/task_data.dart';
// import '../widgets/tasks_list.dart';
// import 'package:provider/provider.dart';
//
// class TasksScreen extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: SizedBox(
//         height: 70,
//         width: 70,
//         child: FloatingActionButton(
//           onPressed: (){
//             showModalBottomSheet(
//               isScrollControlled: true,
//               context: context,
//               builder: (context) => SingleChildScrollView(
//                 child: Container(
//                   padding: EdgeInsets.only(
//                       bottom: MediaQuery.of(context).viewInsets.bottom
//                   ),
//                   child: AddTaskScreen((newTaskTitle){
//                   }),
//                 ),
//               ),
//             );
//           },
//           backgroundColor: Colors.indigo[400],
//           elevation: 8,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: Icon(
//             Icons.add,
//             size: 35,
//           ),
//         ),
//       ),
//       backgroundColor: Colors.teal,
//       body: Container(
//         padding: const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 80),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 //Icon(Icons.playlist_add_check, size: 40, color: Colors.white),
//                 IconButton(
//                   icon: Icon(Icons.playlist_add_check, color: Colors.white),
//                   iconSize: 40,
//                   color: Colors.white,
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                 ),
//                 SizedBox(width: 20),
//                 Text(
//                   "ToDayDo",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 40,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//             Text(
//               '${Provider.of<TaskData>(context).tasks.length} Tasks',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 18,
//               ),
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.all(Radius.circular(20)),
//                 ),
//                 child: TasksList(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }












import 'package:flutter/material.dart';
import 'package:education_app/ToDo/screens/add_task_screen.dart';
import '../models/task_data.dart';
import '../widgets/tasks_list.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: AddTaskScreen(),
                ),
              ),
            );
          },
          backgroundColor: Colors.indigo[400],
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(
            color: Colors.white,
            Icons.add,
            size: 35,
          ),
        ),
      ),
      //backgroundColor: Colors.teal,
      backgroundColor: Color(0xFF5C6BC0),
      body: Container(
        padding: const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.playlist_add_check, color: Colors.white),
                  iconSize: 40,
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context); // Adjusted this to ensure proper navigation.
                  },
                ),
                SizedBox(width: 20),
                Text(
                  "ToDayDo",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              '${Provider.of<TaskData>(context).tasks.length} Tasks',  // {Provider.of<TaskData>(context).tasks.length}
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: TasksList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
