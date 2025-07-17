import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todo_app/models/get_all_todo.dart';
import 'package:todo_app/models/todo_model.dart';

class ApiServices {
  String baseUrl = 'http://10.0.2.2:3000';

  //get all todos
  Future<GetAllTodosModel> GetAllTodos() async {
    var response = await http.get(Uri.parse('$baseUrl/api/todos/'));
    if (response.statusCode == 200) {
      debugPrint(jsonDecode(response.body).toString());
      final data = GetAllTodosModel.fromJson(jsonDecode(response.body));
      return data;
    } else {
      throw Exception('Api Error');
    }
  }

  // post:  add todos
  Future<GetAllTodosModel> add(
    String title,
    String description,
    bool isComplete,
  ) async {
    var response = await http.post(
      Uri.parse('$baseUrl/api/todos/'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "title": title,
        "description": description,
        "is_complete": isComplete,
      }),
    );
    if (response.statusCode == 201) {
      debugPrint(jsonDecode(response.body).toString());
      final data = GetAllTodosModel.fromJson(jsonDecode(response.body));
      return data;
    } else {
      throw Exception('Api Error');
    }
  }

  //put:  update todos
  Future<TodoModel> update(
    String id,
    String title,
    String description,
    bool isComplete,
  ) async {
    var response = await http.put(
      Uri.parse('$baseUrl/api/todos/$id'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "title": title,
        "description": description,
        "is_complete": isComplete,
      }),
    );
    if (response.statusCode == 200) {
      debugPrint(jsonDecode(response.body).toString());
      final data = TodoModel.fromJson(jsonDecode(response.body));
      return data;
    } else {
      throw Exception('Api Error');
    }
  }

  //delete todos
  Future<GetAllTodosModel> deleteTodos(String id) async {
    var response = await http.delete(Uri.parse('$baseUrl/api/todos/$id'));
    if (response.statusCode == 200) {
      debugPrint(jsonDecode(response.body).toString());
      final data = GetAllTodosModel.fromJson(jsonDecode(response.body));
      return data;
    } else {
      throw Exception('Api Error');
    }
  }

  addTodo(String string, String string2, bool isComplete) {}
}
