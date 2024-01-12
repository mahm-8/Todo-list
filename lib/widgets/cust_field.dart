import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  const CustomField(
      {super.key,
      required this.taskController,
      this.keyForm,
      this.validator,
      required this.hintText,
      this.display = false,
      this.onTap,
      this.pass = false, required this.line});
  final TextEditingController taskController;
  final GlobalKey? keyForm;
  final String? Function(String?)? validator;
  final String hintText;
  final bool display;
  final Function()? onTap;
  final bool pass;
  final int? line;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Form(
        key: keyForm,
        child: TextFormField(
          maxLines: line,
          obscureText: !pass ? false : !display,
          validator: validator,
          controller: taskController,
          decoration: InputDecoration(
              hintText: hintText,
              fillColor: Colors.brown[100],
              filled: true,
              suffixIcon: !pass
                  ? null
                  : InkWell(
                      onTap: onTap,
                      child: Icon(display
                          ? Icons.remove_red_eye_outlined
                          : Icons.visibility_off_outlined)),
              errorBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              focusedErrorBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
        ),
      ),
    );
  }
}
