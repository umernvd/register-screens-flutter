import 'package:flutter/material.dart';
import 'signup_screen.dart';
import '../widgets/inputs.dart';
import '../widgets/labels.dart';
import '../widgets/buttons.dart';

class LoginPage3 extends StatefulWidget {
  const LoginPage3({super.key});

  @override
  State<LoginPage3> createState() => _LoginPage3State();
}

class _LoginPage3State extends State<LoginPage3> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D1B),
      body: Column(
        children: [
          // --- 1. Fixed Header Section ---
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
            width: double.infinity,
            color: const Color(0xFF0D0D1B),
            child: SafeArea(
              bottom: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Image.asset('assets/logo2.png', height: 22),
                  const SizedBox(height: 44),
                  const Text(
                    "Sign in to your\nAccount",
                    style: TextStyle(
                      color: Color(0xFFEEEEEE),
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Text(
                        "Don't have an account? ",
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignupScreen3(),
                            ),
                          );
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Color(0xFF4D81E7),
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),

          // --- 2. Scrollable Form Section ---
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFFF9FAFB),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Email
                      const InputLabel(text: "Email"),
                      const SizedBox(height: 8),
                      const ShadowInput(hint: "Loisbecket@gmail.com"),

                      const SizedBox(height: 16),

                      // Password
                      const InputLabel(text: "Password"),
                      const SizedBox(height: 8),
                      const PasswordField(useShadowStyle: true), // Updated to use shared widget

                      const SizedBox(height: 12),

                      // Remember Me & Forgot Password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 24,
                                width: 24,
                                child: Checkbox(
                                  value: rememberMe,
                                  activeColor: const Color(0xFF1D61E7),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  onChanged: (val) => setState(() => rememberMe = val!),
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Text("Remember me", style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(color: Color(0xFF4D81E7)),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // Login Button
                      PrimaryButton(
                        text: "Log In",
                        onPressed: () {
                          // Login logic here
                        },
                      ),

                      const SizedBox(height: 24),

                      // Divider
                      Row(
                        children: [
                          Expanded(child: Divider(color: Colors.grey.shade300)),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "Or login with",
                              style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                            ),
                          ),
                          Expanded(child: Divider(color: Colors.grey.shade300)),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // Social Buttons
                      const Row(
                        children: [
                          Expanded(
                            child: SocialButtonShadow(
                              text: "Google",
                              imagePath: "assets/google.png",
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: SocialButtonShadow(
                              text: "Facebook",
                              icon: Icons.facebook,
                              iconColor: Color(0xFF1877F2),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 40),

                      // Footer
                      const Center(
                        child: Text.rich(
                          TextSpan(
                            text: "By signing up, you agree to the ",
                            style: TextStyle(color: Color(0xFF6C7278), fontSize: 11, height: 1.5),
                            children: [
                              TextSpan(
                                text: "Terms of Service\n",
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: "and ",
                                style: TextStyle(fontWeight: FontWeight.normal),
                              ),
                              TextSpan(
                                text: "Data Processing Agreement",
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}