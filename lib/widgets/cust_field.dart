import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  const CustomField({super.key,required this.taskController, this.keyForm,  this.validator, required this.hintText});
 final TextEditingController taskController;
 final GlobalKey? keyForm;
  final String? Function(String?)? validator;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: keyForm,
      child: TextFormField(
        validator: validator,
        controller:taskController ,
        decoration: InputDecoration(hintText: hintText,
            suffixIconColor: Colors.grey,
            fillColor:Colors.brown[100] ,
            filled: true,
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),),
    );
  }
}
