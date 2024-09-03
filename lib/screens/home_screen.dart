import 'package:flutter/material.dart';

import '../components/menu_card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Hii, Liza 👋 Welcome Back',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: 'Find Your Course..',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Choose Your Course', style: TextStyle(fontSize: 18)),
                TextButton(
                  onPressed: () {
                    // More button action
                  },
                  child: Text('More >>'),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: <Widget>[
                  MenuCard(imagePath: 'assets/Light.png', title: 'Materi'),
                  MenuCard(imagePath: 'assets/Computer.png', title: 'Quiz'),
                  MenuCard(imagePath: 'assets/Empty-Files.png', title: 'Lembar Kerja'),
                  MenuCard(imagePath: 'assets/Gear.png', title: 'Video Referensi'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
