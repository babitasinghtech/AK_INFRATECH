import 'package:flutter/material.dart';
import 'package:todo_app/api_services/api_service.dart';
import 'package:todo_app/models/get_all_todo.dart';
import 'package:todo_app/screen/add_update_todo.dart';
import 'package:todo_app/screen/todo_screen.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  GetAllTodosModel getAllTodosModel = GetAllTodosModel();

  List<Items> inCompleteTodo = [];
  List<Items> completeTodo = [];
  bool isLoading = false;
  getAllTodos() async {
    setState(() {
      isLoading = true;
    });
    await ApiServices()
        .GetAllTodos()
        .then((value) {
          getAllTodosModel = value;
          for (var todo in value.items!) {
            if (todo.isComplete == true) {
              completeTodo.add(todo);
            } else {
              inCompleteTodo.add(todo);
            }
            isLoading = false;
            setState(() {});
          }
          setState(() {});
        })
        .onError((error, stackTrace) {
          debugPrint(error.toString());
        });
  }

  void initState() {
    getAllTodos();
    super.initState();
  }

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

        body:
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : TabBarView(
                  children: [
                    TodosScreen(todoList: getAllTodosModel.items ?? []),
                    TodosScreen(todoList: inCompleteTodo),
                    TodosScreen(todoList: completeTodo),
                  ],
                ),

        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            bool loading = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddAndUpdateTodo()),
            );
            if (loading == true) {
              getAllTodos();
            }
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
