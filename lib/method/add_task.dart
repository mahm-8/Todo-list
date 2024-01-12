// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:todo/method/supa_method.dart';
import 'package:todo/screen/home_page.dart';
import 'package:todo/widgets/cust_field.dart';

import '../main.dart';

class ShowDialog {
  TextEditingController taskController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final taskKey = GlobalKey<FormState>();
  Future<void> addTasks({required BuildContext context}) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: AlertDialog(
              scrollable: true,
              title: const Text('Add Task'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    CustomField(
                      taskController: taskController,
                      keyForm: taskKey,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please enter your task";
                        }
                        return null;
                      },
                      hintText: 'Add New Task',
                      line: 1,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomField(
                      hintText: 'Description',
                      taskController: descriptionController,
                      line: null,
                    )
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Add'),
                  onPressed: () async {
                    if (taskKey.currentState!.validate()) {
                      SupaNetwork().addTask({
                        "task": taskController.text,
                        "description": descriptionController.text,
                        "user_id": x.auth.currentUser!.id
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ));
                    }
                    taskController.clear();
                    descriptionController.clear();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
