import 'package:flutter/material.dart';

class TutoringServicesScreen extends StatefulWidget {
  @override
  _TutoringServicesScreenState createState() => _TutoringServicesScreenState();
}

class _TutoringServicesScreenState extends State<TutoringServicesScreen>
    with SingleTickerProviderStateMixin {
  // Variables for filters
  String? selectedArea;
  String? selectedSubject;
  String? selectedNeedType;
  String? selectedUniversity;
  String? selectedGender;
  RangeValues selectedServiceChargeRange = RangeValues(50, 500);

  // Animation controller
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _controller.forward(); // Start the animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xff000000)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Tutoring Services',
          style: TextStyle(
            color: Color(0xff55e2e7),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      extendBodyBehindAppBar:
          true, // Ensures the AppBar is over the gradient background
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffffffff), Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 80), // Space for the AppBar
                Text(
                  'Find Your Tutor',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xfff47a7a),
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                _buildAnimatedCard(
                  index: 0,
                  child: _buildDropdownField(
                    label: 'Select Area',
                    value: selectedArea,
                    items: ['Area 1', 'Area 2', 'Area 3'],
                    onChanged: (value) {
                      setState(() {
                        selectedArea = value;
                      });
                    },
                  ),
                ),
                _buildAnimatedCard(
                  index: 1,
                  child: _buildDropdownField(
                    label: 'Select Subject',
                    value: selectedSubject,
                    items: ['Math', 'Physics', 'English'],
                    onChanged: (value) {
                      setState(() {
                        selectedSubject = value;
                      });
                    },
                  ),
                ),
                _buildAnimatedCard(
                  index: 2,
                  child: _buildDropdownField(
                    label: 'Select Need Type',
                    value: selectedNeedType,
                    items: ['Tutor Need', 'Tuition Need'],
                    onChanged: (value) {
                      setState(() {
                        selectedNeedType = value;
                      });
                    },
                  ),
                ),
                _buildAnimatedCard(
                  index: 0,
                  child: _buildDropdownField(
                    label: 'Select University',
                    value: selectedUniversity,
                    items: ['University A', 'University B', 'University C'],
                    onChanged: (value) {
                      setState(() {
                        selectedUniversity = value;
                      });
                    },
                  ),
                ),
                _buildAnimatedCard(
                  index: 1,
                  child: _buildDropdownField(
                    label: 'Select Gender',
                    value: selectedGender,
                    items: ['Male', 'Female'],
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value;
                      });
                    },
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Select Service Charge Range',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                RangeSlider(
                  values: selectedServiceChargeRange,
                  min: 50,
                  max: 500,
                  divisions: 9,
                  labels: RangeLabels(
                    '\$${selectedServiceChargeRange.start.round()}',
                    '\$${selectedServiceChargeRange.end.round()}',
                  ),
                  onChanged: (RangeValues newRange) {
                    setState(() {
                      selectedServiceChargeRange = newRange;
                    });
                  },
                  activeColor: Colors.purpleAccent,
                  inactiveColor: Colors.white.withOpacity(0.7),
                ),
                SizedBox(height: 16.0),
                Center(
                  child: ElevatedButton(
                    onPressed: _findMatchedClients,
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      backgroundColor: Colors.greenAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 5,
                      shadowColor: Colors.green,
                    ),
                    child: Text(
                      'Find Matched Clients',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                _buildSectionTitle('Top Deals'),
                SizedBox(height: 20.0),
                _buildSectionTitle('Best Services'),
                SizedBox(height: 20.0),
                _buildSectionTitle('Teacher List'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to build dropdown fields with gradient background and animation
  Widget _buildAnimatedCard({required int index, required Widget child}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
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
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        padding: EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }

  // Helper method to build section titles with unique style
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        shadows: [
          Shadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 5,
          ),
        ],
      ),
    );
  }

  // Helper method to build dropdown fields
  Widget _buildDropdownField({
    required String label,
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      dropdownColor: Colors.deepPurpleAccent,
      style: TextStyle(color: Colors.white),
      value: value,
      items: items.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item, style: TextStyle(color: Colors.white)),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }

  void _findMatchedClients() {
    // Implement your logic to find matched clients
    print('Finding matched clients...');
  }
}
