import 'package:flutter/material.dart';

class HomeServiceDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Service Name',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text('Service Description'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Implement booking logic
              },
              child: Text('Book Now'),
            ),
          ],
        ),
      ),
    );
  }
}
