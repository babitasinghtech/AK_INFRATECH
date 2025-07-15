import 'package:flutter/material.dart';
import 'package:todo_app/models/get_all_todo.dart';
import 'package:todo_app/screen/add_update_todo.dart';
import 'package:todo_app/screen/delete_button.dart';

class TodosScreen extends StatelessWidget {
  final List<Items> todoList;
  const TodosScreen({super.key, required this.todoList});

  @override
  Widget build(BuildContext context) {
    return todoList.isEmpty
        ? Center(child: Text('Todo not found', textScaleFactor: 2))
        : ListView.separated(
          itemCount: todoList.length,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final item = todoList[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddAndUpdateTodo(item: item),
                  ),
                );
              },
              child: Card(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              item.title ?? "",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          DeleteButton(id: item.sId ?? ""),
                        ],
                      ),
                      Text(
                        item.description ?? "",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 5,
                        ),
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).colorScheme.inversePrimary.withOpacity(.5),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          item.isComplete == true ? "Complete" : "Incomplete",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
  }
}
