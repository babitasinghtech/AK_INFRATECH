import 'package:flutter/material.dart';
import 'package:todo_app/api_services/api_service.dart';
import 'package:todo_app/screen/add_update_todo.dart';
import 'package:todo_app/screen/todo_list_screen.dart';
import 'package:todo_app/utils/common_toast.dart';

class DeleteButton extends StatefulWidget {
  final String id;
  const DeleteButton({super.key, required this.id});

  @override
  State<DeleteButton> createState() => _DeleteButtonState();
}

class _DeleteButtonState extends State<DeleteButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isLoading = true;
        });
        ApiServices()
            .deleteTodos(widget.id)
            .then((value) {
              commonToast(context, 'Delete Successfully');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => TodoListScreen()),
              );
              setState(() {
                isLoading = false;
              });
            })
            .onError((error, stackTrace) {
              debugPrint(error.toString());
              setState(() {
                isLoading = false;
              });
              commonToast(context, 'Something Went Wrong');
            });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.inversePrimary.withOpacity(.5),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Icon(Icons.delete_outline, color: Colors.red),
      ),
    );
  }
}
