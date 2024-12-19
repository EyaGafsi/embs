import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tounsicare/menu.dart';
import 'package:tounsicare/profile.dart';
import 'package:tounsicare/search.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  int _selectedIndex = 2;
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> _doctorsList = [];
  List<Map<String, String>> _filteredDoctors = [];

  @override
  void initState() {
    super.initState();
    _initializeDoctors();
    _filteredDoctors = List.from(_doctorsList);
  }

  void _initializeDoctors() {
    _doctorsList = [
      {
        "name": "Dr. Bouchoucha Farah",
        "location": "Tunis",
        "image": "images/doctor1.jpg",
        "info": "Spécialiste en bien-être mental.",
        "phone": "+216 20 123 456",
      },
      {
        "name": "Dr. Ben Ali Amira",
        "location": "Sfax",
        "image": "images/doctor2.jpg",
        "info": "Focus sur l'anxiété et le stress.",
        "phone": "+216 52 654 789",
      },
      {
        "name": "Dr. Mebarki Khaled",
        "location": "La Marsa",
        "image": "images/doctor3.jpg",
        "info": "Experte en récupération post-traumatique.",
        "phone": "+216 98 321 123",
      },
      {
        "name": "Dr. Trabelsi Hana",
        "location": "Sousse",
        "image": "images/doctor4.jpg",
        "info": "Spécialiste des troubles de l'humeur.",
        "phone": "+216 50 789 456",
      },
      {
        "name": "Dr. Ali Mohamed",
        "location": "Sokra",
        "image": "images/doctor5.jpg",
        "info": "Specialist in mental wellness.",
        "phone": "+216 71 569 854",
      },
      {
        "name": "Dr. Zbidi Nabil",
        "location": "Centre ville",
        "image": "images/doctor6.jpg",
        "info": "Focuses on anxiety and stress.",
        "phone": "+216 26 543 210",
      },
      {
        "name": "Dr. Gharbi Aisha",
        "location": "Manouba",
        "image": "images/doctor7.jpg",
        "info": "Expert in trauma recovery.",
        "phone": "+216 90 123 894",
      },
    ];

    _doctorsList.shuffle(Random());
  }

  void _filterDoctors(String query) {
    setState(() {
      _filteredDoctors = _doctorsList
          .where((doctor) =>
              doctor["name"]!.toLowerCase().contains(query.toLowerCase()) ||
              doctor["location"]!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

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

  void _showDoctorDetails(Map<String, String> doctor) {
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
            height: 370,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Center(
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage:
                        AssetImage(doctor["image"] ?? "images/fallback.jpg"),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  doctor["name"]!,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  doctor["info"]!,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Text("Location: ${doctor["location"]}",
                    style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 10),
                Text("Phone: ${doctor["phone"]}",
                    style: const TextStyle(fontSize: 16)),
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFADCEE5),
              Color(0xFF5BACAD),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      onChanged: (value) {
                        setState(() {});
                        _filterDoctors(value);
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 133, 178, 211),
                        hintText: "Find a Licensed Therapist Near You..",
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
                      });
                      _filterDoctors("");
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredDoctors.length,
                itemBuilder: (context, index) {
                  final doctor = _filteredDoctors[index];
                  return GestureDetector(
                    onTap: () {
                      _showDoctorDetails(doctor);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF79AECD),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                              ),
                              image: DecorationImage(
                                image: AssetImage(
                                    doctor["image"] ?? "images/fallback.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    doctor["name"]!,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(doctor["info"]!,
                                      style: const TextStyle(
                                          color: Colors.white70)),
                                  Text("Location: ${doctor["location"]}",
                                      style: const TextStyle(
                                          color: Colors.white70)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
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
