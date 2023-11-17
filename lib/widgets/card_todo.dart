import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo/method/supa_method.dart';
import 'package:todo/model/todo_model.dart';

class CardTodo extends StatefulWidget {
  const CardTodo({super.key, required this.todoList, this.deletePressed});
  final TodoModel todoList;
  final Function()? deletePressed;

  @override
  State<CardTodo> createState() => _CardTodoState();
}

bool isSelected=false;
class _CardTodoState extends State<CardTodo> {

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(

        leading: Checkbox(
          activeColor: Colors.teal,
          value: widget.todoList.state, onChanged: (value) {
            if(widget.todoList.state ==false){

              SupaNetwork().updateTask(true, widget.todoList.id!);


            }else{

              SupaNetwork().updateTask(false, widget.todoList.id!);
            }
            log(widget.todoList.state.toString());
            widget.todoList.state=value!;
          setState(() {

          });
        },),
        title:  Text("${widget.todoList.task}"),
        subtitle:  Text('${widget.todoList.description}'),
        trailing: IconButton(onPressed:widget.deletePressed, icon: const Icon(Icons.delete,color: Colors.red,)),
      ),
    );
  }
}
