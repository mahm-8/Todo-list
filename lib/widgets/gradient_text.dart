
import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  const GradientText({super.key, required this.text});
final String text;
  @override
  Widget build(BuildContext context) {
    return   Text(text,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, foreground: Paint()..shader =  const LinearGradient(
      colors: <Color>[
        Color(0xffceb69c),
        Color(0xffe7d2bd),
        Color(0xff80471c)
      ],
    ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 100.0))),);
  }
}
