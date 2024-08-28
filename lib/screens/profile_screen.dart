import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import 'login_screen.dart';
import 'home_screen.dart';
import 'services_screen.dart';
import 'cart_screen.dart';
import 'chat_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 4; // Default index for Profile

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(isLoggedIn: true),
    ServicesScreen(),
    CartScreen(),
    ChatScreen(),
    ProfileScreen(), // This will create a loop, you may want a different approach
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => _widgetOptions[index]),
    );
  }

  void _logout() async {
    await Provider.of<AuthProvider>(context, listen: false).logout();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xffdf9419), Color(0xFF007EA7)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.settings, color: Colors.white),
                      Text(
                        'Profile',
                        style: theme.textTheme.headline5?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.edit, color: Colors.white),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                      'assets/avatar.png'), // Replace with user's profile image
                ),
                SizedBox(height: 10),
                Text(
                  'John Doe',
                  style: theme.textTheme.headline6?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'johndoe@example.com',
                  style: theme.textTheme.subtitle1?.copyWith(
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                    ),
                    child: ListView(
                      padding: const EdgeInsets.all(16.0),
                      children: [
                        ListTile(
                          leading: Icon(Icons.account_circle),
                          title: Text('Account Information'),
                          trailing: Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            // Handle tap
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.notifications),
                          title: Text('Notifications'),
                          trailing: Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            // Handle tap
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.security),
                          title: Text('Privacy Settings'),
                          trailing: Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            // Handle tap
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.help),
                          title: Text('Help & Support'),
                          trailing: Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            // Handle tap
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.logout),
                          title: Text('Logout'),
                          trailing: Icon(Icons.arrow_forward_ios),
                          onTap: _logout,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
