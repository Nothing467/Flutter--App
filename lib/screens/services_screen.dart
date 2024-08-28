import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'cart_screen.dart';
import 'chat_screen.dart';
import 'profile_screen.dart';

class ServicesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Services'),
      ),
      body: Center(
        child: Text('Services Screen'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        currentIndex: 1, // Set the current index to Services
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Category'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          Widget targetPage;
          switch (index) {
            case 0:
              targetPage = HomeScreen(isLoggedIn: true);
              break;
            case 1:
              targetPage = ServicesScreen();
              break;
            case 2:
              targetPage = CartScreen();
              break;
            case 3:
              targetPage = ChatScreen();
              break;
            case 4:
              targetPage = ProfileScreen();
              break;
            default:
              targetPage = HomeScreen(isLoggedIn: true);
          }
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => targetPage),
          );
        },
      ),
    );
  }
}
