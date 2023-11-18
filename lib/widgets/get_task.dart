import 'package:flutter/material.dart';
import 'package:todo/method/supa_method.dart';
import 'package:todo/model/todo_model.dart';
import 'package:todo/widgets/card_todo.dart';

class GetTask extends StatefulWidget {
  const GetTask({super.key});

  @override
  State<GetTask> createState() => _GetTaskState();
}
class _GetTaskState extends State<GetTask> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: SupaNetwork().getTodo(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          final List<TodoModel>? todoList =snapshot.data;
          return SizedBox(height: MediaQuery.of(context).size.height/1.32,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(itemCount: todoList?.length,
              itemBuilder: (context, index) {
                return CardTodo(todoList: todoList![index],
                  deletePressed:() {
                  SupaNetwork().deleteTask(todoList[index].id!);
                  setState(() { });},);
              },),
          );
        }
        return const Center(child: CircularProgressIndicator.adaptive());
      },);
  }
}
