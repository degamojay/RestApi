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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          title: const Text('Test User Details'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_rounded),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name: ${user['name']}',
                style: const TextStyle(fontSize: 18.0),
              ),
              const SizedBox(height: 8.0),
              Text('Username: ${user['username']}',
                  style: const TextStyle(fontSize: 18.0)),
              const SizedBox(height: 8.0),
              Text('Email: ${user['email']}',
                  style: const TextStyle(fontSize: 18.0)),
              const SizedBox(height: 8.0),
              const Text('Address:', style: TextStyle(fontSize: 18.0)),
              Text('Street: $street', style: const TextStyle(fontSize: 18.0)),
              Text('Suite: $suite', style: const TextStyle(fontSize: 18.0)),
              Text('City: $city', style: const TextStyle(fontSize: 18.0)),
              Text('Zipcode: $zipcode', style: const TextStyle(fontSize: 18.0)),
              const SizedBox(height: 8.0),
              const Text('Geographics: ', style: TextStyle(fontSize: 18.0)),
              Text('Latitude: $lat', style: const TextStyle(fontSize: 18.0)),
              Text('Longitude: $lng', style: const TextStyle(fontSize: 18.0)),
              const SizedBox(height: 8.0),
              Text('Phone: ${user['phone']}',
                  style: const TextStyle(fontSize: 18.0)),
              const SizedBox(height: 8.0),
              Text('Website: ${user['website']}',
                  style: const TextStyle(fontSize: 18.0)),
              const SizedBox(height: 8.0),
              const Text('Company:', style: TextStyle(fontSize: 18.0)),
              Text('Name: $name', style: const TextStyle(fontSize: 18.0)),
              Text('Catch phrase: $catchPhrase',
                  style: const TextStyle(fontSize: 18.0)),
              Text('BS: $bs', style: const TextStyle(fontSize: 18.0)),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
