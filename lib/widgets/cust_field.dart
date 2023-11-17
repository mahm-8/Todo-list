import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  const CustomField({super.key,required this.taskController, this.onPressed, required this.keyForm, this.icon, this.validator});
 final TextEditingController taskController;
 final Function()? onPressed;
 final GlobalKey keyForm;
 final IconData? icon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: keyForm,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        controller:taskController ,
        decoration: InputDecoration(hintText: 'Add New Task',
            suffixIconColor: Colors.grey,
            fillColor:Colors.brown[100] ,
            filled: true,
            suffixIcon: IconButton(onPressed: onPressed, icon:  Icon(icon)),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),),
    );
  }
}
