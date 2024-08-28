import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'login_screen.dart';
import 'profile_screen.dart';
import 'service_list_screen.dart';
import 'cart_screen.dart';
import 'chat_screen.dart';
import 'special_offer_screen.dart';
import 'tutoring_services/tutoring_services_screen.dart';

class HomeScreen extends StatefulWidget {
  final bool isLoggedIn;

  HomeScreen({required this.isLoggedIn});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 0;
  final PageController _pageController = PageController();

  List<Widget> _screens = [
    HomeContent(),
    ServiceListScreen(isLoggedIn: true),
    CartScreen(),
    ChatScreen(),
    ProfileScreen(),
    TutoringServicesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.indigo, Colors.blueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Location',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            Row(
              children: [
                Icon(Icons.location_on, size: 16, color: Colors.white70),
                SizedBox(width: 4),
                Text(
                  'New York, USA',
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              // Handle notifications tap
            },
          ),
          IconButton(
            icon: Icon(widget.isLoggedIn ? Icons.logout : Icons.login,
                color: Colors.white),
            onPressed: () {
              // Navigate to profile or login screen
            },
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _pageIndex,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.shopping_cart, size: 30),
          Icon(Icons.chat, size: 30),
          Icon(Icons.person, size: 30),
        ],
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
          _pageController.jumpToPage(index);
        },
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBar(),
            SizedBox(height: 20),
            CategoryGrid(),
            SizedBox(height: 20),
            PopularServicesSection(),
            SizedBox(height: 20),
            SpecialOffersSection(),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.grey),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search',
              ),
            ),
          ),
          Icon(Icons.filter_list, color: Colors.grey),
        ],
      ),
    );
  }
}

class CategoryGrid extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {'icon': 'assets/icons/cleaning.png', 'name': 'Cleaning'},
    {'icon': 'assets/icons/repairing.png', 'name': 'Repairing'},
    {'icon': 'assets/icons/plumbing.png', 'name': 'Plumbing'},
    {'icon': 'assets/icons/shifting.png', 'name': 'Shifting'},
    {'icon': 'assets/icons/electrical.png', 'name': 'Electrical'},
    {'icon': 'assets/icons/gardening.png', 'name': 'Gardening'},
    // Add more categories here if needed
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Services',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {
                // Handle see all services tap
              },
              child: Text('See All', style: TextStyle(color: Colors.blue)),
            ),
          ],
        ),
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.85,
          ),
          itemBuilder: (context, index) {
            return CategoryCard(
              iconPath: categories[index]['icon']!,
              categoryName: categories[index]['name']!,
            );
          },
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String iconPath;
  final String categoryName;

  CategoryCard({required this.iconPath, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle category card tap
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.purpleAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(iconPath),
              backgroundColor: Colors.transparent,
            ),
          ),
          SizedBox(height: 5),
          Text(
            categoryName,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
        ],
      ),
    );
  }
}

class SpecialOffersSection extends StatefulWidget {
  @override
  _SpecialOffersSectionState createState() => _SpecialOffersSectionState();
}

class _SpecialOffersSectionState extends State<SpecialOffersSection> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Special For You',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SpecialOfferScreen()),
                );
              },
              child: Text('See All', style: TextStyle(color: Colors.blue)),
            ),
          ],
        ),
        SizedBox(height: 10),
        Container(
          height: 170, // Increase the height to fix overflow
          child: PageView.builder(
            itemCount: 3,
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return SpecialOfferCard(
                offerTitle: 'Limited time!',
                offerDetails:
                    'Get Special Offer\nUp to 40%\nAll Services Available | T&C Applied',
                gradient: index == 0
                    ? LinearGradient(
                        colors: [Colors.lightBlueAccent, Colors.blue],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                    : index == 1
                        ? LinearGradient(
                            colors: [Colors.greenAccent, Colors.green],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          )
                        : LinearGradient(
                            colors: [Colors.purpleAccent, Colors.deepPurple],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
              );
            },
          ),
        ),
        SizedBox(height: 10),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                width: 12,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index ? Colors.green : Colors.grey,
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  final String offerTitle;
  final String offerDetails;
  final Gradient gradient;

  SpecialOfferCard({
    required this.offerTitle,
    required this.offerDetails,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle special offer card tap
      },
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: gradient,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  offerTitle,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: Text(
                    offerDetails,
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                onPressed: () {
                  // Handle claim button tap
                },
                child: Text('Claim', style: TextStyle(color: Colors.orange)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PopularServicesSection extends StatelessWidget {
  final List<Map<String, dynamic>> services = [
    {
      'image': 'assets/images/cloth_ironing.png',
      'name': 'Cloth\n' 'Ironing',
      'price': '\$120.00',
      'gradient': LinearGradient(
        colors: [Colors.purpleAccent, Colors.deepPurple],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    },
    {
      'image': 'assets/images/home_cleaning.png',
      'name': 'Home\n' 'Cleaning',
      'price': '\$80.00',
      'gradient': LinearGradient(
        colors: [Colors.orangeAccent, Colors.deepOrange],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    },
    {
      'image': 'assets/images/car_washing.png',
      'name': 'Car\n' 'Washing',
      'price': '\$100.00',
      'gradient': LinearGradient(
        colors: [Colors.lightBlueAccent, Colors.blue],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Popular Services',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {
                // Handle see all popular services tap
              },
              child: Text('See All', style: TextStyle(color: Colors.blue)),
            ),
          ],
        ),
        SizedBox(height: 10),
        Container(
          height: 160, // Increase the height to fix overflow
          child: PageView.builder(
            itemCount: services.length,
            controller: PageController(viewportFraction: 0.8),
            itemBuilder: (context, index) {
              return PopularServiceCard(
                imagePath: services[index]['image']!,
                serviceName: services[index]['name']!,
                servicePrice: services[index]['price']!,
                gradient: services[index]['gradient']!,
              );
            },
          ),
        ),
      ],
    );
  }
}

class PopularServiceCard extends StatelessWidget {
  final String imagePath;
  final String serviceName;
  final String servicePrice;
  final Gradient gradient;

  PopularServiceCard({
    required this.imagePath,
    required this.serviceName,
    required this.servicePrice,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle popular service card tap
      },
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: gradient,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(imagePath,
                  width: 110, height: 110, fit: BoxFit.cover),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    serviceName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 16),
                      SizedBox(width: 5),
                      Text(
                        '4.8',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      SizedBox(width: 10),
                      Text(
                        servicePrice,
                        style: TextStyle(fontSize: 14, color: Colors.green),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
