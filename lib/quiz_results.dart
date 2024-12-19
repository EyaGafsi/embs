import 'package:flutter/material.dart';
import 'package:tounsicare/chatbot.dart';
import 'package:tounsicare/location.dart';
import 'package:tounsicare/profile.dart';
import 'package:tounsicare/search.dart';

class QuizResultsPage extends StatefulWidget {
  final int score;

  const QuizResultsPage({super.key, required this.score});

  @override
  _QuizResultsPageState createState() => _QuizResultsPageState();
}

class _QuizResultsPageState extends State<QuizResultsPage> {
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
    bool isSad = widget.score > 6;
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
                  'Quiz results!',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(238, 255, 255, 255),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  padding: const EdgeInsets.all(16),
                  height: 300,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 175, 211, 225),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        isSad ? 'images/sad.png' : 'images/happy.png',
                        width: 150,
                        height: 150,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "${(widget.score / 12 * 100).round()}% ",
                        style: const TextStyle(
                            fontSize: 40,
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${isSad ? "Feeling blue today" : "Feeling great today!"}",
                        style: const TextStyle(
                            fontSize: 22,
                            color: Color.fromARGB(78, 0, 0, 0),
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                    ],
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
                                    const LocationPage(),
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
                        "See an expert?",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(238, 255, 255, 255),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const ChatbotPage(),
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
                        "Chatbot",
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
