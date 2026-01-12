import 'package:flutter/material.dart';
import 'package:my_app/widgets/inputs.dart';
import 'package:my_app/widgets/labels.dart';
import 'package:my_app/widgets/buttons.dart';
import 'signup_screen.dart';

class LoginPage1 extends StatelessWidget {
  const LoginPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 20.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Image.asset('assets/logo.png', height: 24),
                    const SizedBox(height: 40),
                    const Text(
                      "Sign in to your Account",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A1C1E),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Enter your email and password to log in",
                      style: TextStyle(
                        color: Color(0xFF6C7278),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 32),

                    // --- Form Section ---
                    const InputLabel(text: "Email"),
                    const SizedBox(height: 8),
                    const StandardTextField(hint: "email@domain.com"),

                    const SizedBox(height: 16),

                    const InputLabel(text: "Password"),
                    const SizedBox(height: 8),
                    const PasswordField(useShadowStyle: false),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Color(0xFF4D81E7),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    PrimaryButton(text: "Log In", onPressed: () {}),

                    const SizedBox(height: 32),

                    Row(
                      children: [
                        const Expanded(
                          child: Divider(color: Color(0xFFEDF1F3)),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            "Or",
                            style: TextStyle(
                              color: Color(0xFF6C7278),
                              fontSize: 12,
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Divider(color: Color(0xFFEDF1F3)),
                        ),
                      ],
                    ),

                    const SizedBox(height: 32),

                    // Uses the shared SocialButtonOutlined from widgets/buttons.dart
                    const SocialButtonOutlined(
                      text: "Continue with Google",
                      imagePath: "assets/google.png",
                    ),

                    const SizedBox(height: 16),

                    const SocialButtonOutlined(
                      text: "Continue with Facebook",
                      icon: Icons.facebook, // Uses the built-in Icon
                      iconColor: Color(0xFF1877F2), // Standard Facebook Blue
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),

            // Footer
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0, top: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      color: Color(0xFF6C7278),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Color(0xFF4D81E7),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
