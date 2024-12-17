import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tounsicare/firebase_options.dart';
import 'package:tounsicare/sign_in.dart';

void main() {
  InitFirebase();
  runApp(const MyApp());
}

InitFirebase() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TounsiCare',
      home: const WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Image.asset(
                'images/TounsiCareLogo.png',
                height: 100,
              ),
              const SizedBox(height: 20),
              Material(
                elevation: 8,
                shadowColor: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: const Color(0xFF399495),
                  height: 325,
                  width: screenWidth,
                  child: Center(
                    child: Image.asset(
                      'images/meditation.png',
                      height: 300,
                      width: 350,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Column(
                children: [
                  Text(
                    'Welcome !',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(238, 255, 255, 255),
                    ),
                  ),
                  Text(
                    '! عسلامة',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(238, 255, 255, 255),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const SignInPage(),
                        transitionDuration: Duration.zero,
                        reverseTransitionDuration: Duration.zero,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 87, 153, 189),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    minimumSize: Size(screenWidth * 0.8, 70),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Get started',
                    style: TextStyle(
                      fontSize: 25,
                      color: Color.fromARGB(238, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
