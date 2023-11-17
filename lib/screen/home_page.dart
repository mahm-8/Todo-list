import 'package:flutter/material.dart';
import 'package:todo/method/supa_method.dart';
import 'package:todo/model/todo_model.dart';
import 'package:todo/widgets/card_todo.dart';
import 'package:todo/widgets/cust_field.dart';
enum ExerciseFilter { walking, running, cycling, hiking }
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController taskController=TextEditingController();
  bool isSelected=false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(children: [
              const Row(children: [Text('Task',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),)],)
            ,CustomField(taskController: taskController,onPressed: (){
              SupaNetwork().addTask( {
                "task": taskController.text,
                "description": "do ",

              });
              setState(() {

              });
              },)
              ,const SizedBox(height: 20,) ,
              const Divider(color: Colors.black,),
            FutureBuilder(future: SupaNetwork().getTodo(),
              builder: (context, snapshot) {
              if(snapshot.hasData){
                final List<TodoModel>? todoList =snapshot.data;
                return SizedBox(height: MediaQuery.of(context).size.height/1.32,width: MediaQuery.of(context).size.width,
                  child: ListView.builder(itemCount: todoList?.length,
                    itemBuilder: (context, index) {
                    return CardTodo(todoList: todoList![index],deletePressed:() {setState(() {
                      print(todoList[index].state.runtimeType);
                    SupaNetwork().deleteTask(todoList[index].id!);


                    });},);
                  },),
                );
              }
              else{
            return const CircularProgressIndicator();
              }
            },)

            ],),
          ),
        ),
      ),
    );
  }
}
