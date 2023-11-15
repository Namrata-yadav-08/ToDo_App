import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ToDoCon extends StatefulWidget {
  final String taskname;
  final bool taskcomplete;
  Function(BuildContext)? deletefun;
  Function(BuildContext)? editfunc;

  Function(bool?)? onchanged;
  // Function(bool?)? onchnaged;
  ToDoCon(
      {super.key,
      required this.taskname,
      required this.taskcomplete,
      required this.onchanged,
      required this.deletefun,
      required this.editfunc});

  @override
  State<ToDoCon> createState() => _ToDoConState();
}

class _ToDoConState extends State<ToDoCon> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: widget.deletefun,
              icon: FontAwesomeIcons.deleteLeft,
            ),
            // SlidableAction(
            //   onPressed: donefun,
            //   icon: Icons.done,
            // ),
            SlidableAction(
              onPressed: widget.editfunc,
              icon: Icons.edit,
            )
          ],
        ),
        child: Container(
          width: 700,
          height: 100,
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: AlignmentDirectional.bottomCenter,
                  colors: [
                    Color.fromRGBO(254, 162, 146, 1),
                    Color.fromRGBO(255, 100, 125, 1)
                  ]),
              borderRadius: BorderRadius.circular(13)),
          child: Row(
            children: [
              Text(widget.taskname),
              // Checkbox(value: taskcomplete, onChanged:onchanged )
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';

// class ToDoTile extends StatelessWidget {
//   final String taskName;
//   final bool taskCompleted;
//   Function(bool?)? onChanged;
//   Function(BuildContext)? deleteFunction;

//   ToDoTile({
//     super.key,
//     required this.taskName,
//     required this.taskCompleted,
//     required this.onChanged,
//     required this.deleteFunction,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
//       child: Slidable(
//         endActionPane: ActionPane(
//           motion: StretchMotion(),
//           children: [
//             SlidableAction(
//               onPressed: deleteFunction,
//               icon: Icons.delete,
//               backgroundColor: Colors.red.shade300,
//               borderRadius: BorderRadius.circular(12),
//             )
//           ],
//         ),
//         child: Container(
//           padding: EdgeInsets.all(24),
//           decoration: BoxDecoration(
//             color: Colors.yellow,
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Row(
//             children: [
//               // checkbox
//               Checkbox(
//                 value: taskCompleted,
//                 onChanged: (value) {
//                   onChanged?.call(value);
//                 },
//                 activeColor: Colors.black,
//               ),

//               // task name
//               Text(
//                 taskName,
//                 style: TextStyle(
//                   decoration: taskCompleted
//                       ? TextDecoration.lineThrough
//                       : TextDecoration.none,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
