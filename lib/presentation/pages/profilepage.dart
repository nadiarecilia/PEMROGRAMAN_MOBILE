import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  // URL for the profile image
  final String imageUrl =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeqIWad5s_BDWzfsrP6wnAADN_bOjRqrbxsw&s'; // Replace with your actual URL

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        // Uncomment to set the color: backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Profile image from a network URL
            CircleAvatar(
              radius: 80, // Sets the size of the profile image
              backgroundImage: NetworkImage(imageUrl),
            ),
            SizedBox(height: 20), // Space between image and name
            // Display the user name
            Text(
              'Jefry Sunupurwa Asri',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10), // Space between name and email
            // Display the user email
            Text(
              'jefry.sunupurwa@esaunggul.ac.id',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
