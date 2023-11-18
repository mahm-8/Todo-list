// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo/screen/home_page.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.email});
  final String email;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Pinput(autofocus: true,length: 6,onCompleted: (pin) async{
          try {
            final supabase = Supabase.instance.client;
           final verification =await supabase.auth.verifyOTP(token: pin, type: OtpType.signup,email:widget.email );
           if(verification.session?.accessToken!=null) {
             Navigator.pushAndRemoveUntil(context,
                 MaterialPageRoute(builder: (context) => const HomePage(),), (
                     route) => false);
           }
          }catch(error) { ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Center(child: Text('Wrong OTP'))));}
        },),
      ],),);
  }
}
