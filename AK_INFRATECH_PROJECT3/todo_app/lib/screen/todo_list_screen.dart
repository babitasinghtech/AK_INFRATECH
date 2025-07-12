import 'package:flutter/material.dart';
import 'package:todo_app/screen/add_update_todo.dart';
import 'package:todo_app/screen/todo_screen.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 76, 139, 156),
          title: Center(
            child: Text(
              "TODO LIST",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          bottom: TabBar(
            labelPadding: EdgeInsets.symmetric(vertical: 10),
            labelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20,
              color: Colors.black87,
            ),
            tabs: [Text("All"), Text("Incomplete"), Text("Complete")],
          ),
        ),

        body: TabBarView(children: [TodoScreen(), TodoScreen(), TodoScreen()]),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Add_and_Update_todo()),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
