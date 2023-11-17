import 'dart:developer';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../model/todo_model.dart';
class SupaNetwork{
 Future<List<TodoModel>> getTodo()async{
    final List data= await Supabase.instance.client.from('todo').select('*');
    log(data.toString());
    List<TodoModel> todoList=[];
    for(var element in data){
      todoList.add(TodoModel.fromJson(element));
    }
     return todoList;
  }
 addTask(Map body) async {
   final supabase = Supabase.instance.client;
   await supabase.from('todo').insert(body);
 }
 updateTask(bool state,int id) async {
   final supabase = Supabase.instance.client;
   await supabase.from('todo').update({'state':state}).eq('id', id);
 }
 deleteTask(int id) async {
   final supabase = Supabase.instance.client;
   await supabase.from('todo').delete().eq('id', id);
 }
}