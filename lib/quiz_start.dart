import 'package:flutter/material.dart';
import 'package:tounsicare/full_quiz.dart';
import 'package:tounsicare/location.dart';
import 'package:tounsicare/profile.dart';
import 'package:tounsicare/search.dart';

class QuizStartPage extends StatefulWidget {
  const QuizStartPage({super.key});

  @override
  _QuizStartPageState createState() => _QuizStartPageState();
}

class _QuizStartPageState extends State<QuizStartPage> {
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
          Column(
            children: [
              const SizedBox(height: 40),
              const Text(
                "Quiz time!",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Material(
                elevation: 8,
                shadowColor: Colors.black.withOpacity(0.7),
                child: Container(
                  height: 500,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: AssetImage('images/quizimage.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Container(
                      width: 300,
                      height: 410,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(184, 255, 255, 255),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Discover more about yourself and unlock personalized insights for a healthier mind.",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Start your personality quiz now!",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const FullQuizPage(),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 183, 79, 197),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  minimumSize: const Size(180, 60),
                ),
                child: const Text(
                  "Start",
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
          color: isSelected ? Color.fromARGB(255, 183, 79, 197) : Colors.white,
        ),
      ),
    );
  }
}
