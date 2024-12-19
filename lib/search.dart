import 'package:flutter/material.dart';
import 'package:tounsicare/location.dart';
import 'package:tounsicare/menu.dart';
import 'package:tounsicare/profile.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _selectedIndex = 1;
  final TextEditingController _searchController = TextEditingController();
  final List<String> _searchHistory = [
    "Self Esteem",
    "Confidence",
    "Wellness Pack",
    "Mindfulness",
    "Overcome Fear",
    "Trauma",
    "Sleep Habits",
    "Manage Anxiety",
    "Beat Stress",
    "Overcome Grief",
  ];
  String _searchText = "";

  void _onNavBarItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        debugPrint("Menu tapped");
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const MenuPage(),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        );
        break;
      case 1:
        debugPrint("Search tapped");
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

  void _showDefinition(String term) {
    final Map<String, String> advice = {
      "Self Esteem":
          "Building self-esteem involves recognizing your unique strengths and accomplishments. Practice self-compassion by being kind to yourself when you face challenges. Surround yourself with supportive people, and set small, achievable goals to experience success and growth. Accept compliments graciously and challenge negative thoughts about yourself. Your worth is not defined by others but by your unique qualities and efforts.",
      "Confidence":
          "To boost confidence, focus on your skills and abilities. Start with small wins, and gradually take on more challenging tasks. Remember that mistakes are part of learning, and every step forward adds to your confidence. Surround yourself with people who encourage you, practice speaking assertively, and set clear goals. Confidence grows when you take action and step outside your comfort zone.",
      "Wellness Pack":
          "A wellness pack is a toolkit for your mental and physical health. Include activities like regular exercise, a balanced diet, sufficient sleep, and hobbies that bring you joy. Incorporate mindfulness practices to connect with yourself and recharge. Don't forget to prioritize your mental health, talk about your feelings, and dedicate time for activities that make you feel fulfilled and energized.",
      "Mindfulness":
          "Mindfulness helps you live in the moment. Start with simple breathing exercises, notice your surroundings, and focus on your senses. Journaling or guided meditation can also help build awareness and reduce stress. When you feel overwhelmed, pause, take deep breaths, and acknowledge your thoughts without judgment. Practicing mindfulness daily helps improve focus and reduce anxiety.",
      "Overcome Fear":
          "Overcoming fear starts with identifying its root cause. Break the fear into smaller, manageable parts, and gradually face them with positive affirmations and support. Celebrate every step you take toward conquering your fear. Seek guidance when needed, and remember that courage is not the absence of fear but taking action despite it. You are stronger than you think.",
      "Trauma":
          "Healing from trauma requires patience and self-care. Seek professional help, talk to trusted friends, and practice grounding techniques like deep breathing or journaling. Allow yourself to process your emotions instead of suppressing them. Remember, it's okay to ask for support on your healing journey, and healing doesn’t mean forgetting but learning to live with resilience.",
      "Sleep Habits":
          "Better sleep habits can transform your life. Establish a consistent bedtime, avoid screens before bed, and create a relaxing nighttime routine. Keep your sleeping environment cool, dark, and quiet to promote restful sleep. Avoid caffeine and heavy meals close to bedtime, and try calming activities like reading or gentle stretching to unwind before sleep.",
      "Manage Anxiety":
          "To manage anxiety, focus on calming activities like deep breathing or progressive muscle relaxation. Regular exercise, healthy eating, and talking about your feelings with a trusted person can also help reduce anxiety over time. Identify triggers that cause anxiety, and address them one step at a time. Practice gratitude and mindfulness to stay grounded and calm.",
      "Beat Stress":
          "Beating stress requires a balance of work and relaxation. Set realistic goals, prioritize tasks, and take breaks to recharge. Engage in activities you enjoy, and practice gratitude to shift your focus to the positives in your life. Learn to delegate tasks, say no to unnecessary commitments, and spend time with loved ones to maintain emotional balance.",
      "Overcome Grief":
          "Overcoming grief takes time and patience. Allow yourself to feel your emotions, and don't suppress them. Share your feelings with loved ones or a counselor, and find ways to remember and honor what you've lost. Creating a routine, journaling, or finding creative outlets like art and music can help you express and heal your emotions."
    };

    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.8),
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            height: 350,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  term,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 1,
                  height: 20,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      advice[term] ?? "",
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        onChanged: (value) {
                          setState(() {
                            _searchText = value;
                          });
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(255, 133, 178, 211),
                          hintText: "Search...",
                          hintStyle: const TextStyle(color: Colors.black),
                          prefixIcon:
                              const Icon(Icons.search, color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.black),
                      onPressed: () {
                        setState(() {
                          _searchController.clear();
                          _searchText = "";
                        });
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: _searchHistory
                      .where((item) => item
                          .toLowerCase()
                          .contains(_searchText.toLowerCase()))
                      .map(
                        (item) => ListTile(
                          title: Text(item,
                              style: const TextStyle(
                                  color: Color.fromARGB(212, 0, 0, 0))),
                          onTap: () => _showDefinition(item),
                        ),
                      )
                      .toList(),
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
            ? const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              )
            : null,
        padding: const EdgeInsets.all(8),
        child: Icon(
          icon,
          color: isSelected
              ? const Color.fromARGB(255, 174, 78, 198)
              : Colors.white,
        ),
      ),
    );
  }
}
