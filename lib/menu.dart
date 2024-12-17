import 'package:flutter/material.dart';
import 'package:tounsicare/location.dart';
import 'package:tounsicare/profile.dart';
import 'package:tounsicare/quiz_start.dart';
import 'package:tounsicare/search.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int _selectedIndex = 0;

  void _onNavBarItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        debugPrint("Home tapped");
        break;
      case 1:
        debugPrint("Search tapped");
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const SearchPage(),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        );
        break;
      case 2:
        debugPrint("Location tapped");
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const LocationPage(),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        );
        break;
      case 3:
        debugPrint("Profile tapped");
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const ProfilePage(),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFADCEE5),
                  Color(0xFF5BACAD),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Hello!\nHow are you feeling today?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'images/happy.png',
                          width: 130,
                          height: 130,
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 87, 153, 189),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            minimumSize: const Size(180, 60),
                          ),
                          child: const Text(
                            "Happy",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(238, 255, 255, 255),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'images/sad.png',
                          width: 130,
                          height: 130,
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 87, 153, 189),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            minimumSize: const Size(180, 60),
                          ),
                          child: const Text(
                            "sad",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(238, 255, 255, 255),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                const Text(
                  "Are you in for a quick mood quiz?",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(238, 255, 255, 255),
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const QuizStartPage(),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 183, 79, 197),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        minimumSize: const Size(180, 60),
                      ),
                      child: const Text(
                        "yes",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(238, 255, 255, 255),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 183, 79, 197),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        minimumSize: const Size(180, 60),
                      ),
                      child: const Text(
                        "Not really",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(238, 255, 255, 255),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 87, 153, 189),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    minimumSize: Size(screenWidth * 0.8, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Maybe need to chat with someone?",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(238, 255, 255, 255)),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 87, 153, 189),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavBarItem(Icons.home, 0),
            _buildNavBarItem(Icons.search, 1),
            _buildNavBarItem(Icons.location_pin, 2),
            _buildNavBarItem(Icons.person, 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavBarItem(IconData icon, int index) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onNavBarItemTapped(index),
      child: Container(
        decoration: isSelected
            ? BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              )
            : null,
        padding: const EdgeInsets.all(8),
        child: Icon(
          icon,
          color: isSelected
              ? const Color.fromARGB(255, 183, 79, 197)
              : Colors.white,
        ),
      ),
    );
  }
}
