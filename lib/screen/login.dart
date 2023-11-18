// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo/extension/ext_string.dart';
import 'package:todo/screen/home_page.dart';
import '../widgets/button_widget.dart';
import '../widgets/cust_field.dart';
class LogIn extends StatefulWidget {
  const LogIn({super.key});
  @override
  State<LogIn> createState() => _LogInState();
}
class _LogInState extends State<LogIn> {
  final emailController=TextEditingController();
  final passController=TextEditingController();
  final emailKey=GlobalKey<FormState>();
  final passKey=GlobalKey<FormState>();
  bool display=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Column( mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('data'),
        const SizedBox(height: 20,),
        CustomField(taskController: emailController, hintText: 'email',keyForm: emailKey,validator: (val){ if(val!.isEmpty){ return 'enter email please';}if(!val.isValidEmail){return 'email contain @ and .';} return null;}),
        CustomField(pass: true,display: display,onTap: () {
          display=!display;
          setState(() {});
        },
            taskController: passController, hintText: 'password',keyForm: passKey,validator: (val){ if(val!.isEmpty){ return 'enter password please';}if(!val.isValidPassword){return 'upperCase ,lowerCase,number,(!@#*\$)';} return null;}),
        ButtonWidget(text: 'Sign Up',onPressed: ()async{
          List<bool> isValid=[];
          isValid.add(validtion(formKey: emailKey));
          isValid.add(validtion(formKey: passKey));
          if(!isValid.contains(false)) {
            final supabase =await Supabase.instance.client;

            final user=await supabase.auth.signInWithPassword(password: passController.text.trim(),email: emailController.text.trim());
            if (user.session?.accessToken!=null) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            }else{
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text('Wrong email or password')));
            }
          }
        },),
      ],)),);
  }
  validtion({required GlobalKey<FormState> formKey}){
    if(formKey.currentState!.validate()){
      return true;
    }
    return false;
  }

}
