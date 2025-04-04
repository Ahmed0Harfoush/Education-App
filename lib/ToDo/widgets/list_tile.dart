// import 'package:flutter/material.dart';
//
// class TaskTile extends StatelessWidget {
//
//   final bool isChecked;
//   final String taskTitle;
//   final Function(bool?) checkboxChange;
//   final Function() listTileDelete;
//
//   TaskTile({required this.isChecked, required this.taskTitle, required this.checkboxChange, required this.listTileDelete});
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(taskTitle,
//         style: TextStyle(decoration: isChecked? TextDecoration.lineThrough : null),
//       ),
//       trailing: Checkbox(
//         activeColor: Colors.teal[400],
//         value: isChecked,
//         onChanged: checkboxChange,
//         ),
//       onLongPress: listTileDelete,
//     );
//   }
// }
//
//
//


















import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function(bool?) checkboxChange;
  final Function() listTileDelete;

  TaskTile({
    required this.isChecked,
    required this.taskTitle,
    required this.checkboxChange,
    required this.listTileDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.teal[400],
        value: isChecked,
        onChanged: checkboxChange,
      ),
      onLongPress: listTileDelete,
    );
  }
}
