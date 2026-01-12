import 'package:flutter/material.dart';
import 'signup_screen.dart';
import '../widgets/inputs.dart';
import '../widgets/buttons.dart';

class LoginPage2 extends StatefulWidget {
  const LoginPage2({super.key});

  @override
  State<LoginPage2> createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Blue Background (Top Half)
          Container(
            height: size.height * 0.5,
            color: const Color(0xFF2567E8),
          ),

          // Main Content
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    const Icon(Icons.security, color: Colors.white, size: 40),
                    const SizedBox(height: 20),
                    const Text(
                      "Sign in to your\nAccount",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Enter your email and password to log in",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    const SizedBox(height: 30),

                    // Login Card
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          // Google Login (Shared Widget)
                          const SocialButtonOutlined(
                            text: "Continue with Google",
                            imagePath: "assets/google.png",
                          ),

                          const SizedBox(height: 24),

                          // Divider
                          Row(
                            children: [
                              Expanded(child: Divider(color: Colors.grey.shade200)),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  "Or login with", 
                                  style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                                ),
                              ),
                              Expanded(child: Divider(color: Colors.grey.shade200)),
                            ],
                          ),

                          const SizedBox(height: 24),

                          // Email
                          const StandardTextField(hint: "email@domain.com"),

                          const SizedBox(height: 16),

                          // Password
                          const PasswordField(useShadowStyle: false),

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
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                      onChanged: (val) => setState(() => rememberMe = val!),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  const Text("Remember me", style: TextStyle(color: Colors.grey, fontSize: 12)),
                                ],
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Forgot Password?",
                                  style: TextStyle(color: Color(0xFF1D61E7), fontWeight: FontWeight.w600, fontSize: 12),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 24),

                          // Login Button (Shared Widget)
                          PrimaryButton(
                            text: "Log In",
                            onPressed: () {
                              // Login Logic
                            },
                          ),

                          const SizedBox(height: 20),

                          // Sign Up Link
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Don't have an account? ", style: TextStyle(color: Colors.grey, fontSize: 12)),
                              GestureDetector(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const SignupScreen2()),
                                ),
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(color: Color(0xFF1D61E7), fontWeight: FontWeight.bold, fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}