import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ToDoCon extends StatelessWidget {
  final String taskname;
  final bool taskcomplete;
  Function(BuildContext)? deletefun;
  // function(bool?)? onChanged;
  // Function(bool?)? onchnaged;
  ToDoCon(
      {super.key,
      required this.taskname,
      required this.taskcomplete,
      required this.deletefun});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deletefun,
              icon: FontAwesomeIcons.deleteLeft,
            ),
            // SlidableAction(
            //   onPressed: donefun,
            //   icon: Icons.done,
            // ),
            // SlidableAction(
            //   onPressed: editfunc,
            //   icon: Icons.edit,
            // )
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
          child: Column(
            children: [
              Text(taskname),
              //  DatePicker()
            ],
          ),
        ),
      ),
    );
  }
}
