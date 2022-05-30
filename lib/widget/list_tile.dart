import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final Function()? onLongPressCallBack;
  final ValueChanged<bool?>? checkBoxCallBack;
  final String taskTittle;

  const TaskTile(
      {Key? key,
      this.checkBoxCallBack,
      required this.taskTittle,
      required this.isChecked,
      this.onLongPressCallBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongPressCallBack,
      title: Text(
        taskTittle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Checkbox(
        onChanged: checkBoxCallBack,
        value: isChecked,
        activeColor: Colors.lightBlueAccent,
      ),
    );
  }
}
