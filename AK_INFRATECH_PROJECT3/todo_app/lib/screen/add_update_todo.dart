import 'package:flutter/material.dart';
import 'package:todo_app/api_services/api_service.dart';
import 'package:todo_app/screen/todo_list_screen.dart';
import 'package:todo_app/utils/common_toast.dart';
import 'package:todo_app/models/get_all_todo.dart';

class AddAndUpdateTodo extends StatefulWidget {
  final Items? item;
  const AddAndUpdateTodo({super.key, this.item});

  @override
  State<AddAndUpdateTodo> createState() => _AddAndUpdateTodoState();
}

class _AddAndUpdateTodoState extends State<AddAndUpdateTodo> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  bool isComplete = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.item != null) {
      title.text = widget.item?.title ?? "";
      description.text = widget.item?.description ?? "";
      isComplete = widget.item?.isComplete ?? false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 76, 139, 156),
        title: Text(
          widget.item == null ? "Add ToDo" : "Update Todo",
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextFormField(
              controller: title,
              autofocus: widget.item == null,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              decoration: const InputDecoration(
                hintText: 'Title',
                border: InputBorder.none,
              ),
            ),
            TextFormField(
              controller: description,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              decoration: const InputDecoration(
                hintText: 'Description',
                border: InputBorder.none,
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Complete",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                ),
                Switch(
                  value: isComplete,
                  activeColor: const Color.fromARGB(255, 76, 139, 156),
                  onChanged: (bool value) {
                    setState(() {
                      isComplete = value;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (title.text.isEmpty) {
            commonToast(context, 'Please enter title');
          } else if (description.text.isEmpty) {
            commonToast(context, "Please enter description");
          } else {
            setState(() {
              isLoading = true;
            });
            if (widget.item == null) {
              // Add new todo
              ApiServices()
                  .addTodo(
                    title.text.trim(),
                    description.text.trim(),
                    isComplete,
                  )
                  .then((value) {
                    setState(() {
                      isLoading = true;
                    });
                    Navigator.pop(context, true);
                  })
                  .onError((error, stackTrace) {
                    debugPrint(error.toString());
                  });
            } else {
              // Update existing todo
              ApiServices()
                  .update(
                    widget.item!.sId!,
                    title.text.toString(),
                    description.text.toString(),
                    isComplete,
                  )
                  .then((value) {
                    setState(() {
                      isLoading = true;
                    });
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => TodoListScreen()),
                    );
                  })
                  .onError((error, stackTrace) {
                    debugPrint(error.toString());
                  });
            }
          }
        },
        child: isLoading ? CircularProgressIndicator() : Icon(Icons.done),
      ),
    );
  }
}
