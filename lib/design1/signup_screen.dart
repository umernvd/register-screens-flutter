import 'package:flutter/material.dart';
import '../widgets/inputs.dart';
import '../widgets/labels.dart';
import '../widgets/buttons.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back button
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.arrow_back, size: 24),
                ),

                const SizedBox(height: 32),

                const Text(
                  "Sign up",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1C1E),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Create an account to continue!",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF6C7278),
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 32),

                // Form Fields
                const InputLabel(text: "Full Name"),
                const SizedBox(height: 8),
                const StandardTextField(hint: "Lois Becket"),

                const SizedBox(height: 16),

                const InputLabel(text: "Email"),
                const SizedBox(height: 8),
                const StandardTextField(hint: "Loisbecket@gmail.com"),

                const SizedBox(height: 16),

                const InputLabel(text: "Date of Birth"),
                const SizedBox(height: 8),
                // Shared DatePicker widget (flat style)
                const DatePickerField(hint: "18/03/2024", useShadowStyle: false),

                const SizedBox(height: 16),

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
                          Icon(
                            Icons.flag_circle,
                            color: Colors.redAccent, // Changed to match previous design consistency
                            size: 20,
                          ),
                          SizedBox(width: 4),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.grey,
                            size: 16,
                          ),
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

                const InputLabel(text: "Set Password"),
                const SizedBox(height: 8),
                // Shared Password widget (flat style)
                const PasswordField(useShadowStyle: false),

                const SizedBox(height: 32),

                // Register Button
                PrimaryButton(
                  text: "Register",
                  onPressed: () {
                    // Registration logic
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
                        color: Color(0xFF6C7278),
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
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}