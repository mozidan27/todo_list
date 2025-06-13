import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_list/core/utils/app_colors.dart';

class ToDoTile extends StatelessWidget {
  const ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    this.onChanged,
    this.onPressed,
  });
  final String taskName;
  final bool taskCompleted;
  final void Function(bool?)? onChanged;
  final void Function(BuildContext)? onPressed;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: StretchMotion(),
        children: [
          SlidableAction(
            onPressed: onPressed,
            icon: Icons.delete,
            backgroundColor: AppColors.red,
          ),
        ],
      ),
      child: Row(
        children: [
          Checkbox(
            side: BorderSide(color: Colors.black, width: 2.5),
            checkColor: AppColors.backGround,
            activeColor: AppColors.mintGreen,
            value: taskCompleted,
            onChanged: onChanged,
          ),
          Expanded(
            child: Text(
              taskName,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                decoration:
                    taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
