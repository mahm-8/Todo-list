import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, this.onPressed, required this.text});
 final Function()? onPressed;
 final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed,style: ElevatedButton.styleFrom(foregroundColor: Colors.black,minimumSize:const Size(200, 50) ), child: Text(text,style: const TextStyle(fontSize: 16),) ,);
  }
}
