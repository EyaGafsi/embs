import 'package:flutter/material.dart';
import 'package:tounsicare/location.dart';
import 'package:tounsicare/profile.dart';
import 'package:tounsicare/quiz_results.dart';
import 'package:tounsicare/search.dart';

class FullQuizPage extends StatefulWidget {
  const FullQuizPage({super.key});

  @override
  _FullQuizPageState createState() => _FullQuizPageState();
}

class _FullQuizPageState extends State<FullQuizPage> {
  int _currentPage = 0;
  int _score = 0;
  int _selectedIndex = 0;

  final List<int?> _selectedAnswers = List.filled(4, null);

  final List<String> _questions = [
    "Over the past two weeks, how often have you felt down, depressed, or hopeless?",
    "How often have you had little interest or pleasure in doing things?",
    "How often have you felt tired or had little energy?",
    "How often have you felt bad about yourself or felt like a failure?"
  ];

  final List<List<String>> _options = [
    [
      "Not at all",
      "Several days",
      "More than half the days",
      "Nearly every day"
    ],
    [
      "Not at all",
      "Several days",
      "More than half the days",
      "Nearly every day"
    ],
    [
      "Not at all",
      "Several days",
      "More than half the days",
      "Nearly every day"
    ],
    [
      "Not at all",
      "Several days",
      "More than half the days",
      "Nearly every day"
    ],
  ];

  void _nextPage() {
    if (_selectedAnswers[_currentPage] != null) {
      setState(() {
        _score += _selectedAnswers[_currentPage]!;
        if (_currentPage < _questions.length - 1) {
          _currentPage++;
        } else {
          _showResults();
        }
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select an option to proceed")),
      );
    }
  }

  void _showResults() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuizResultsPage(score: _score)),
    );
  }

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
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 89, 111, 124),
        elevation: 2,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(207, 0, 0, 0),
          ),
          onPressed: () {
            if (_currentPage > 0) {
              setState(() {
                _currentPage--;
              });
            }
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            Text(
              " ${_currentPage + 1}/${_questions.length}",
              style: const TextStyle(
                color: Color.fromARGB(207, 0, 0, 0),
              ),
            ),
          ],
        ),
      ),
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
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                padding: const EdgeInsets.all(16),
                height: 160,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 116, 170, 204),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    _questions[_currentPage],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
              ),
              for (int idx = 0; idx < 4; idx++)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedAnswers[_currentPage] = idx;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    height: 70,
                    decoration: BoxDecoration(
                      color: _selectedAnswers[_currentPage] == idx
                          ? const Color.fromARGB(255, 93, 150, 157)
                          : Color.fromARGB(255, 173, 209, 225),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            _options[_currentPage][idx],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                        Icon(
                          _selectedAnswers[_currentPage] == idx
                              ? Icons.check_circle
                              : Icons.circle_outlined,
                          color: _selectedAnswers[_currentPage] == idx
                              ? const Color.fromARGB(255, 1, 70, 64)
                              : const Color.fromARGB(255, 0, 0, 0),
                          size: 28,
                        ),
                      ],
                    ),
                  ),
                ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                child: ElevatedButton(
                  onPressed: _nextPage,
                  child: const Text(
                    "Next",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(238, 255, 255, 255),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 183, 79, 197),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    minimumSize: const Size(180, 60),
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
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
          ),
        ],
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
