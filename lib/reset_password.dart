import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tounsicare/sign_in.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  String _errorMessage = "";
  String _successMessage = "";
  bool _obscurePassword = true;

  Future<void> _resetPassword() async {
    final String email = _emailController.text.trim();

    if (email.isEmpty) {
      setState(() {
        _errorMessage = "Please enter your email.";
        _successMessage = "";
      });
      return;
    }

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      setState(() {
        _successMessage =
            "A password reset email has been sent. Please check your inbox.";
        _errorMessage = "";
      });
    } on FirebaseAuthException catch (e) {
      String errorMessage = "Failed to reset password. Please try again.";
      if (e.code == 'user-not-found') {
        errorMessage = "No user found with this email.";
      }
      setState(() {
        _errorMessage = errorMessage;
        _successMessage = "";
      });
    } catch (e) {
      setState(() {
        _errorMessage = "An unexpected error occurred. Please try again.";
        _successMessage = "";
      });
    }
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
                Stack(
                  children: [
                    Center(
                      child: Opacity(
                        opacity: 0.5,
                        child: Image.asset(
                          'images/TounsiCareLogo.png',
                          height: 250,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          icon:
                              const Icon(Icons.arrow_back, color: Colors.black),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignInPage()),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                const Text(
                  'Reset Password',
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
                          controller: _emailController,
                          labelText: 'E-mail',
                          icon: Icons.email,
                        ),
                        const SizedBox(height: 10),
                        _buildTextField(
                          controller: _passwordController,
                          labelText: 'New Password',
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
                          obscureText: _obscurePassword,
                          toggleObscure: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                        const SizedBox(height: 20),
                        if (_errorMessage.isNotEmpty)
                          Text(
                            _errorMessage,
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        if (_successMessage.isNotEmpty)
                          Text(
                            _successMessage,
                            style: const TextStyle(
                              color: Colors.green,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _resetPassword,
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
                            'Confirm',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
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
