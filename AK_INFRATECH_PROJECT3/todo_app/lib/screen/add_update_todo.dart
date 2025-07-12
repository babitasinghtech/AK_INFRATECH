import 'package:flutter/material.dart';

class Add_and_Update_todo extends StatefulWidget {
  const Add_and_Update_todo({super.key});

  @override
  State<Add_and_Update_todo> createState() => _Add_and_Update_todoState();
}

class _Add_and_Update_todoState extends State<Add_and_Update_todo> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  bool isComplete = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 76, 139, 156),
        title: Text(
          "Add ToDo",
          style: TextStyle(
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
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              decoration: InputDecoration(
                hintText: 'Title',
                border: InputBorder.none,
              ),
            ),
            TextFormField(
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              decoration: InputDecoration(
                hintText: 'Description',
                border: InputBorder.none,
              ),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Complete",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                ),
                Switch(
                  // This bool value toggles the switch.
                  value: isComplete,
                  activeColor: Color.fromARGB(255, 76, 139, 156),
                  onChanged: (bool value) {
                    // This is called when the user toggles the switch.
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
        onPressed: () {},
        child: Icon(Icons.done),
      ),
    );
  }
}
