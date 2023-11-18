// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo/screen/home_page.dart';
import 'package:todo/screen/login.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});
  @override
  State<LoadingPage> createState() => _LoadingPageState();
}
class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3),() {
     checkToken();
    },);

  }
  checkToken() async {
    final check=await Supabase.instance.client;
    if(check.auth.currentSession?.accessToken!=null){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomePage(),), (route) => false);
    }else{Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LogIn(),), (route) => false);}
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: Center(child: Image.asset("assets/todo.png",height: 300,)),);
  }
}
