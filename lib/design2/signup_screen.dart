import 'package:flutter/material.dart';
import '../widgets/inputs.dart';
import '../widgets/labels.dart';
import '../widgets/buttons.dart';

class SignupScreen2 extends StatefulWidget {
  const SignupScreen2({super.key});

  @override
  State<SignupScreen2> createState() => _SignupScreen2State();
}

class _SignupScreen2State extends State<SignupScreen2> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Blue Background (Top Half)
          Container(height: size.height * 0.5, color: const Color(0xFF2567E8)),

          // Main Content
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back, color: Colors.white),
                        ),
                      ),
                    ),

                    const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Create an account to continue",
                      style: TextStyle(
                        color: Color.fromARGB(179, 255, 255, 255),
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 30),

                    // White Card
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      padding: const EdgeInsets.all(24),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Full Name
                          const InputLabel(text: "Full Name"),
                          const SizedBox(height: 8),
                          const StandardTextField(hint: "Lois Becket"),

                          const SizedBox(height: 16),

                          // Email
                          const InputLabel(text: "Email"),
                          const SizedBox(height: 8),
                          const StandardTextField(hint: "Loisbecket@gmail.com"),

                          const SizedBox(height: 16),

                          // Date of Birth
                          const InputLabel(text: "Birth of date"),
                          const SizedBox(height: 8),
                          // Use shared widget
                          const DatePickerField(hint: "18/03/2024", useShadowStyle: false),

                          const SizedBox(height: 16),

                          // Phone Number
                          const InputLabel(text: "Phone Number"),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              // Country Code selector
                              Container(
                                height: 48,
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                decoration: BoxDecoration(
                                  border: Border.all(color: const Color(0xFFEDF1F3)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: const [
                                    Icon(Icons.flag_circle, color: Colors.redAccent, size: 20),
                                    SizedBox(width: 4),
                                    Icon(Icons.keyboard_arrow_down, color: Colors.grey, size: 16),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Expanded(
                                child: StandardTextField(hint: "(454) 726-0592"),
                              ),
                            ],
                          ),

                          const SizedBox(height: 16),

                          // Password
                          const InputLabel(text: "Set Password"),
                          const SizedBox(height: 8),
                          // Use shared widget
                          const PasswordField(useShadowStyle: false),

                          const SizedBox(height: 32),

                          // Register Button
                          PrimaryButton(
                            text: "Register",
                            onPressed: () {
                              // TODO: Add registration logic
                            },
                          ),

                          const SizedBox(height: 24),

                          // Footer
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Already have an account? ",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 72, 76, 80),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Color(0xFF4D81E7),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
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