// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo/screen/home_page.dart';
import 'package:todo/widgets/gradient_text.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.email});
  final String email;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector( onTap:(){FocusScope.of(context).unfocus();},
      child: Scaffold(body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50,),
              Center(child: Image.asset("assets/mail (1).png",height: 200,)),
              const SizedBox(height: 30),
              const GradientText(text: "Enter the verification code",),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Pinput(autofocus: true,length: 6,onCompleted: (pin) async{
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
              ),
            ],),
        ),
      ),),
    );
  }
}
