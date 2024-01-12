import 'package:supabase_flutter/supabase_flutter.dart';
import '../main.dart';
import '../model/todo_model.dart';
class SupaNetwork{
 Future<List<TodoModel>> getTodo()async{
   final supabase= Supabase.instance.client.auth.currentUser!.id;

    final data = await x.from('todo').select('*').eq('user_id', supabase);
    List<TodoModel> todoList=[];
    for(var element in data){
      todoList.add(TodoModel.fromJson(element));
    }
     return todoList;
  }
 addTask(Map body) async {
   await x.from('todo').insert(body);
 }
 updateTask(bool state,int id) async {
   await x.from('todo').update({'state':state}).eq('id', id);
 }
 deleteTask(int id) async {
   await x.from('todo').delete().eq('id', id);
 }
}