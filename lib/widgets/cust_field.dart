import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  const CustomField({super.key,required this.taskController, this.onPressed});
 final TextEditingController taskController;
 final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller:taskController ,
      decoration: InputDecoration(hintText: 'Add New Task',
          suffixIconColor: Colors.grey,
          fillColor:Colors.brown[100] ,
          filled: true,
          suffixIcon: IconButton(onPressed: onPressed, icon: const Icon(Icons.add)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),);
  }
}
