import 'package:flutter/material.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        return Card(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        "Title",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(
                          context,
                        ).colorScheme.inversePrimary.withOpacity(.5),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(Icons.delete_outline, color: Colors.red),
                    ),
                  ],
                ),
                Text(
                  "Description",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.inversePrimary.withOpacity(.5),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    "Complete",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
