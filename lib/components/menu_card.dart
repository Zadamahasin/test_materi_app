import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final String imagePath;
  final String title;

  MenuCard({required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(imagePath, width: 64, height: 64), // Adjusted size for better visual appeal
          SizedBox(height: 8),
          Text(title, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
