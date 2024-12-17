import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tounsicare/sign_in.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  String _errorMessage = "";
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  void _signUp() async {
    final String name = _nameController.text;
    final String email = _emailController.text;
    final String password = _passwordController.text;
    final String confirmPassword = _confirmPasswordController.text;

    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      setState(() {
        _errorMessage = "Please fill out all fields.";
      });
    } else if (!_isValidEmail(email)) {
      setState(() {
        _errorMessage = "Invalid E-mail format.";
      });
    } else if (password != confirmPassword) {
      setState(() {
        _errorMessage = "Passwords do not match.";
      });
    } else {
      setState(() {
        _errorMessage = ""; // Clear previous errors
      });

      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("User created successfully!"),
            duration: Duration(seconds: 2),
          ),
        );

        // Navigate to the SignInPage
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SignInPage(),
          ),
        );
      } on FirebaseAuthException catch (e) {
        print("Error Code: ${e.code}");
        print("Error Message: ${e.message}");
        setState(() {
          _errorMessage = e.message ?? 'An error occurred.';
        });
      } catch (e) {
        print(e);
        setState(() {
          _errorMessage = 'An unexpected error occurred. Please try again.';
        });
      }

      print("Sign up successful with Name: $name, Email: $email");
    }
  }

  bool _isValidEmail(String email) {
    return email.contains('@') && email.contains('.');
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Opacity(
                  opacity: 0.5,
                  child: Image.asset(
                    'images/TounsiCareLogo.png',
                    height: 250,
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(237, 0, 0, 0),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SizedBox(
                    width: screenWidth * 0.8,
                    child: Column(
                      children: [
                        _buildTextField(
                          controller: _nameController,
                          labelText: 'Name or Pseudo',
                          icon: Icons.person,
                        ),
                        const SizedBox(height: 10),
                        _buildTextField(
                          controller: _emailController,
                          labelText: 'E-mail',
                          icon: Icons.email,
                        ),
                        const SizedBox(height: 10),
                        _buildTextField(
                          controller: _passwordController,
                          labelText: 'Password',
                          icon: Icons.lock,
                          obscureText: _obscurePassword,
                          toggleObscure: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                        const SizedBox(height: 10),
                        _buildTextField(
                          controller: _confirmPasswordController,
                          labelText: 'Confirm Password',
                          icon: Icons.lock,
                          obscureText: _obscureConfirmPassword,
                          toggleObscure: () {
                            setState(() {
                              _obscureConfirmPassword =
                                  !_obscureConfirmPassword;
                            });
                          },
                        ),
                        const SizedBox(height: 20),
                        if (_errorMessage.isNotEmpty)
                          Text(
                            _errorMessage,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 211, 49, 38),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _signUp,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 183, 79, 197),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            minimumSize: Size(screenWidth * 0.8, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Already have an account?',
                              style: TextStyle(
                                fontSize: 17,
                                color: Color(0xFF56899F),
                              ),
                            ),
                            GestureDetector(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation,
                                                secondaryAnimation) =>
                                            const SignInPage(),
                                        transitionDuration: Duration.zero,
                                        reverseTransitionDuration:
                                            Duration.zero,
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Sign in',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildTextField({
  required TextEditingController controller,
  required String labelText,
  required IconData icon,
  bool obscureText = false,
  VoidCallback? toggleObscure,
}) {
  return TextField(
    controller: controller,
    obscureText: obscureText,
    decoration: InputDecoration(
      labelText: labelText,
      labelStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      filled: true,
      fillColor: const Color(0xFF79AECD),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
      prefixIcon: Icon(
        icon,
        color: Colors.white,
      ),
      suffixIcon: toggleObscure != null
          ? IconButton(
              icon: Icon(
                obscureText ? Icons.visibility_off : Icons.visibility,
                color: Colors.white,
              ),
              onPressed: toggleObscure,
            )
          : null,
    ),
    style: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  );
}
