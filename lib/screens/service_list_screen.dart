import 'package:flutter/material.dart';
import 'home_services/home_services_screen.dart';
import 'tutoring_services/tutoring_services_screen.dart';
import 'local_handyman/local_handyman_screen.dart';
import 'pet_services/pet_services_screen.dart';
import 'fitness_training/fitness_training_screen.dart';
import 'laundry_services/laundry_services_screen.dart';
import 'car_wash_services/car_wash_services_screen.dart';
import 'event_planning/event_planning_screen.dart';

class ServiceListScreen extends StatelessWidget {
  final bool isLoggedIn;

  ServiceListScreen({required this.isLoggedIn});

  final List<Map<String, dynamic>> categories = [
    {
      'title': 'Home Services',
      'screen': HomeServicesScreen(),
      'icon': Icons.home,
      'image': 'assets/images/categories/home_services.jpg',
      'color': Colors.deepPurple,
    },
    {
      'title': 'Tutoring Services',
      'screen': TutoringServicesScreen(),
      'icon': Icons.school,
      'image': 'assets/images/categories/tutoring_services.jpg',
      'color': Colors.orange,
    },
    {
      'title': 'Local Handyman',
      'screen': LocalHandymanScreen(),
      'icon': Icons.build,
      'image': 'assets/images/categories/local_handyman.jpg',
      'color': Colors.teal,
    },
    {
      'title': 'Pet Services',
      'screen': PetServicesScreen(),
      'icon': Icons.pets,
      'image': 'assets/images/categories/pet_services.jpg',
      'color': Colors.blue,
    },
    {
      'title': 'Fitness Training',
      'screen': FitnessTrainingScreen(),
      'icon': Icons.fitness_center,
      'image': 'assets/images/categories/fitness_training.jpg',
      'color': Colors.red,
    },
    {
      'title': 'Laundry Services',
      'screen': LaundryServicesScreen(),
      'icon': Icons.local_laundry_service,
      'image': 'assets/images/categories/laundry_services.jpg',
      'color': Colors.pink,
    },
    {
      'title': 'Car Wash Services',
      'screen': CarWashServicesScreen(),
      'icon': Icons.local_car_wash,
      'image': 'assets/images/categories/car_wash_services.jpg',
      'color': Colors.green,
    },
    {
      'title': 'Event Planning',
      'screen': EventPlanningScreen(),
      'icon': Icons.event,
      'image': 'assets/images/categories/event_planning.jpg',
      'color': Colors.deepOrange,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.8,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigate to the selected category screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => categories[index]['screen'],
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ],
                gradient: LinearGradient(
                  colors: [
                    categories[index]['color'].withOpacity(0.7),
                    categories[index]['color'].withOpacity(0.9),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
                image: DecorationImage(
                  image: AssetImage(categories[index]['image']),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      categories[index]['icon'],
                      size: 50,
                      color: Colors.white,
                    ),
                    SizedBox(height: 10),
                    Text(
                      categories[index]['title'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 10,
                            color: Colors.black,
                            offset: Offset(3, 3),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
