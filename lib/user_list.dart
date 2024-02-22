import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  final List<dynamic> users;
  final Function(dynamic) onUserTap;

  const UserList({super.key, required this.users, required this.onUserTap});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(
            users[index]['name'],
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            onUserTap(users[index]);
          },
        );
      },
    );
  }
}