import 'package:flutter/material.dart';

class SpecialOfferScreen extends StatelessWidget {
  final List<Map<String, dynamic>> specialOffers = [
    {
      'title': 'Summer Sale',
      'description': 'Get 50% off on all services.',
      'image': 'assets/images/summer_sale.png',
    },
    {
      'title': 'New User Offer',
      'description': 'Flat 30% discount for new users.',
      'image': 'assets/images/new_user.png',
    },
    {
      'title': 'Holiday Special',
      'description': 'Enjoy up to 70% off during the holidays.',
      'image': 'assets/images/holiday_special.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Special Offers'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: specialOffers.length,
        itemBuilder: (context, index) {
          return SpecialOfferCard(
            title: specialOffers[index]['title'],
            description: specialOffers[index]['description'],
            image: specialOffers[index]['image'],
          );
        },
      ),
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  SpecialOfferCard({
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [Colors.tealAccent, Colors.deepPurple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  image,
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 10,
                            color: Colors.black,
                            offset: Offset(3, 3),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      description,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () {
                        // Handle claim button tap
                      },
                      child: Text('Claim',
                          style: TextStyle(color: Colors.tealAccent)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
