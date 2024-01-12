import 'package:flutter/material.dart';
import 'package:todo/method/add_task.dart';
import 'package:todo/widgets/get_task.dart';
import '../method/supa_method.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool update=true;
  @override
  void initState() {

    super.initState();
    SupaNetwork().getTodo();
    Future.delayed(const Duration(seconds: 2),(){
      update=false;
      setState(() {

      });
    });

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body:SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(children: [
              const SizedBox(height: 20),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Image.asset("assets/todoHome (1).png",height: 50,)
                    ,IconButton(onPressed: (){
                    ShowDialog().addTasks(context: context);
                    setState(() {});
                    }, icon: const Icon(Icons.upload))],),
               ),
              const SizedBox(height: 20,) ,
              const Divider(color: Colors.black,),
              if(update==true)
                const Center(child: CircularProgressIndicator.adaptive()),
              if(update==false)
              const GetTask(),

            ],),
          ),
        ),
      ),
    );
  }

}
