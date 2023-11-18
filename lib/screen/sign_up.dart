// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo/extension/ext_string.dart';
import 'package:todo/screen/verification.dart';
import 'package:todo/widgets/button_widget.dart';
import 'package:todo/widgets/cust_field.dart';

import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailKey=GlobalKey<FormState>();
  final userKey=GlobalKey<FormState>();
  final passKey=GlobalKey<FormState>();
  final userController=TextEditingController();
  final emailController=TextEditingController();
  final passController=TextEditingController();
  bool display=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child:
    Column( mainAxisAlignment: MainAxisAlignment.center,
      children: [
      const Text('data'),
      const SizedBox(height: 20,),
      CustomField(taskController: userController, hintText: 'User name',keyForm: userKey, validator: (val){ if(val!.isEmpty){ return 'enter name please';} return null;} ),
      CustomField(taskController: emailController, hintText: 'email',keyForm: emailKey,validator: (val){ if(val!.isEmpty){ return 'enter email please';}if(!val.isValidEmail){return 'email contain @ and .';} return null;}),
      CustomField(taskController: passController, hintText: 'password',
          keyForm: passKey,display: display,
        pass: true,
        validator:
              (val){
        if(val!.isEmpty){ return 'enter password please';}
        if(!val.isValidPassword){return 'upperCase ,lowerCase,number,(!@#*\$)';}
        return null;}
        ,onTap: () {
          display=!display;
          setState(() {

          });
        },),
        ButtonWidget(text: 'Sign Up',onPressed: ()async{
          List<bool> isValid=[];
          isValid.add(validtion(formKey: userKey));
          isValid.add(validtion(formKey: emailKey));
          isValid.add(validtion(formKey: passKey));
          if(!isValid.contains(false)) {
            final supabase = Supabase.instance.client;
            supabase.auth.signUp(
                password: passController.text.trim(),
                email: emailController.text.trim());
            Navigator.push(context, MaterialPageRoute(builder: (context) => OtpScreen(email: emailController.text.trim())));
          }
        },), TextButton(onPressed: (){Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LogIn(),), (route) => false);}, child: const Text('Login'))
    ],)),);
  }
  validtion({required GlobalKey<FormState> formKey}){
    if(formKey.currentState!.validate()){
      return true;
    }
    return false;
  }
}
