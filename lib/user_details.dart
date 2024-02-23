import 'package:flutter/material.dart';
import 'models/user_models.dart';

class UserDetailsPage extends StatelessWidget {
  final UserModel user;

  const UserDetailsPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${user.name}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Username: ${user.username}'),
            const SizedBox(height: 8),
            Text('Email: ${user.email}'),
            const SizedBox(height: 8),
            Text('Phone: ${user.phone}'),
            const SizedBox(height: 8),
            Text('Website: ${user.website}'),
            const SizedBox(height: 8),
            const Text(
              'Address:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('${user.address.street}, ${user.address.suite}'),
            Text('${user.address.city}, ${user.address.zipcode}'),
            const SizedBox(height: 8),
            const Text(
              'Company:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(user.company.name),
            Text(user.company.catchPhrase),
            Text(user.company.bs),
          ],
        ),
      ),
    );
  }
}
