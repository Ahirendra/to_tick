import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatefulWidget {

      final String taskName;
      final bool taskCompleted;
      Function(bool?)? onChanged;
      Function(BuildContext)? deleteFunction;


      ToDoTile({
        super.key,
        required this.taskName,
        required this.taskCompleted,
        required this.onChanged,
        required this.deleteFunction,
      });

      @override
      State<ToDoTile> createState() => _ToDoTileState();

}
class _ToDoTileState extends State<ToDoTile> {
      @override
      Widget build(BuildContext context) {

        return Padding(
          padding: const EdgeInsets.only(left: 25.0,right: 25,top: 25),

          child: Slidable(
            endActionPane: ActionPane(
                motion: const  StretchMotion(),
                children: [
                  SlidableAction(
                      onPressed: widget. deleteFunction,
                      icon: Icons.delete,
                      backgroundColor: Colors.red.shade300,
                      borderRadius: BorderRadius.circular(12),
                  )
                ]
            ),

            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.pink[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  // checkbox
                  Checkbox(
                    value: widget.taskCompleted,
                    onChanged: widget.onChanged,
                    activeColor: Colors.black,
                  ),

                  // task name
                  Text(
                    widget.taskName,
                    style: TextStyle(
                      decoration: widget.taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
}