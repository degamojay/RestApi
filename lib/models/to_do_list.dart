import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ToDoListPage extends StatefulWidget {
  const ToDoListPage({Key? key}) : super(key: key);

  @override
  _ToDoListPageState createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  List<ToDoItem> _toDoItems = [];
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchToDoItems();
  }

  Future<void> _fetchToDoItems() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.1.135:3001/toDo'));
      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        if (responseBody is Map<String, dynamic> && responseBody['tasks'] is List) {
          // Adjusted to match your JSON structure with a "tasks" field
          final List<dynamic> toDoItemsJson = responseBody['tasks'];
          setState(() {
            _toDoItems = toDoItemsJson.map((jsonItem) => ToDoItem.fromJson(jsonItem)).toList();
            _isLoading = false;
          });
        } else {
          setState(() {
            _isLoading = false;
            _errorMessage = 'Invalid response: Expected a list in \'tasks\'';
          });
        }
      } else {
        setState(() {
          _isLoading = false;
          _errorMessage = 'Server error: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Error fetching to-do items: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(title: const Text('To Do List')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (_errorMessage.isNotEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('To Do List')),
        body: Center(child: Text(_errorMessage)),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
      ),
      body: ListView.builder(
        itemCount: _toDoItems.length,
        itemBuilder: (context, index) {
          final item = _toDoItems[index];
          return ListTile(
            leading: Checkbox(
              value: item.isCompleted,
              onChanged: null, // Makes the checkbox visually reflect the state without being interactive
            ),
            title: Text(item.title),
          );
        },
      ),
    );
  }
}

class ToDoItem {
  final String id; // Changed to String to accommodate UUIDs
  final String title;
  bool isCompleted;

  ToDoItem({required this.id, required this.title, this.isCompleted = false});

  factory ToDoItem.fromJson(Map<String, dynamic> json) {
    return ToDoItem(
      id: json['id'], // Directly use the string ID
      title: json['title'],
      isCompleted: json['completed'] ?? false,
    );
  }
}
