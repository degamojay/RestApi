import 'package:flutter/material.dart';

class UserDetailsPage extends StatelessWidget {
  final dynamic user;

  const UserDetailsPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> address = user['address'];
    String street = address['street'];
    String suite = address['suite'];
    String city = address['city'];
    String zipcode = address['zipcode'];

    Map<String, dynamic> geo = address['geo'];
    String lat = geo['lat'];
    String lng = geo['lng'];

    Map<String, dynamic> company = user['company'];
    String name = company['name'];
    String catchPhrase = company['catchPhrase'];
    String bs = company['bs'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Test User Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${user['name']}',
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text('Username: ${user['username']}'),
            const SizedBox(height: 8.0),
            Text('Email: ${user['email']}'),
            const SizedBox(height: 8.0),
            const Text('Address:'),
            Text('Street: $street'),
            Text('Suite: $suite'),
            Text('City: $city'),
            Text('Zipcode: $zipcode'),
            const SizedBox(height: 8.0),
            const Text('Geographics: '),
            Text('Latitude: $lat'),
            Text('Longitude: $lng'),
            const SizedBox(height: 8.0),
            Text('Phone: ${user['phone']}'),
            const SizedBox(height: 8.0),
            Text('Website: ${user['website']}'),
            const SizedBox(height: 8.0),
            const Text('Company:'),
            Text('Name: $name'),
            Text('Catch phrase: $catchPhrase'),
            Text('BS: $bs'),
          ],
        ),
      ),
    );
  }
}
