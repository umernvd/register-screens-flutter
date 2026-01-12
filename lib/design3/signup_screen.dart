import 'package:flutter/material.dart';

class SignupScreen3 extends StatefulWidget {
  const SignupScreen3({super.key});

  @override
  State<SignupScreen3> createState() => _SignupScreen3State();
}

class _SignupScreen3State extends State<SignupScreen3> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromARGB(255, 22, 22, 46),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
            color:const Color.fromARGB(255, 22, 22, 46),
            child: SafeArea(
              bottom: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    padding: EdgeInsets.zero,
                    alignment: Alignment.centerLeft,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Register",
                    style: TextStyle(
                      color: Color(0xFFEEEEEE),
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Text(
                        "Already have an account? ",
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Text(
                          "Log In",
                          style: TextStyle(
                            color: Color(0xFF4D81E7),
                            fontWeight: FontWeight.bold,
                            fontSize: 14,

                            decorationColor: Color(0xFF4D81E7),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(color: Color(0xFFF9FAFB)),
              child: ClipRRect(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 32,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const InputLabel(text: "Full Name"),
                      const SizedBox(height: 8),
                      const ShadowInput(hint: "Lois Becket"),
                      const SizedBox(height: 16),
                      const InputLabel(text: "Email"),
                      const SizedBox(height: 8),
                      const ShadowInput(hint: "Loisbecket@gmail.com"),
                      const SizedBox(height: 16),
                      const InputLabel(text: "Birth of date"),
                      const SizedBox(height: 8),
                      ShadowInput(
                        hint: "18/03/2024",
                        suffixIcon: const Icon(
                          Icons.calendar_today_outlined,
                          color: Color(0xFF6C7278),
                          size: 20,
                        ),
                        readOnly: true,
                        onTap: () {
                          // Date picker logic
                        },
                      ),
                      const SizedBox(height: 16),
                      const InputLabel(text: "Phone Number"),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            height: 48,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: const Color(0xFFEDF1F3),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(
                                    0xFFE4E5E7,
                                  ).withOpacity(0.24),
                                  blurRadius: 2,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.flag_circle,
                                  color: Colors.redAccent,
                                  size: 20,
                                ),
                                SizedBox(width: 4),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Color(0xFF6C7278),
                                  size: 16,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: ShadowInput(hint: "(454) 726-0592"),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const InputLabel(text: "Set Password"),
                      const SizedBox(height: 8),
                      ShadowInput(
                        hint: "*******",
                        obscureText: !isPasswordVisible,
                        suffixIcon: IconButton(
                          icon: Icon(
                            isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: const Color(0xFF9CA3AF),
                          ),
                          onPressed: () => setState(
                            () => isPasswordVisible = !isPasswordVisible,
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      const GradientButton(text: "Register"),
                      const SizedBox(height: 40),
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

class InputLabel extends StatelessWidget {
  final String text;
  const InputLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFF6C7278),
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class ShadowInput extends StatelessWidget {
  final String hint;
  final bool obscureText;
  final Widget? suffixIcon;
  final bool readOnly;
  final VoidCallback? onTap;

  const ShadowInput({
    super.key,
    required this.hint,
    this.obscureText = false,
    this.suffixIcon,
    this.readOnly = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFEDF1F3)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFE4E5E7).withOpacity(0.24),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: TextField(
        obscureText: obscureText,
        readOnly: readOnly,
        onTap: onTap,
        style: const TextStyle(
          color: Color(0xFF1A1C1E),
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Color(0xFF1A1C1E)),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}

class GradientButton extends StatelessWidget {
  final String text;
  const GradientButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFF1D61E7),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF375DFB).withOpacity(0.48),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
