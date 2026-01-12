import 'package:flutter/material.dart';
import 'signup_screen.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginPage1(),
  ));
}

class LoginPage1 extends StatelessWidget {
  const LoginPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // Keeps the UI from hitting the notch or status bar
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, 
              children: [
                const SizedBox(height: 20),
                
                // Logo Image
                Image.asset('assets/logo.png', height: 24), 
                
                const SizedBox(height: 40),
                
                // Welcome Text
                const Text(
                  "Sign in to your Account",
                  style: TextStyle(
                    fontSize: 32, 
                    fontWeight: FontWeight.bold, 
                    color: Color(0xFF1A1C1E)
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Enter your email and password to log in",
                  style: TextStyle(
                    color: Color(0xFF6C7278), 
                    fontSize: 14, 
                    fontWeight: FontWeight.w500
                  ),
                ),

                const SizedBox(height: 32),

                // Form Section
                const Text("Email", style: TextStyle(fontWeight: FontWeight.w500)),
                const SizedBox(height: 8),
                const TextField(
                  decoration: InputDecoration(
                    hintText: "email@domain.com",
                    hintStyle: TextStyle(color: Color(0xFFA1A8B0)),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Color(0xFFEDF1F3)),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                const Text("Password", style: TextStyle(fontWeight: FontWeight.w500)),
                const SizedBox(height: 8),
                
                // Password logic is handled in its own widget to prevent full rebuilds
                const PasswordField(), 

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(color: Color(0xFF4D81E7), fontWeight: FontWeight.w600),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Main Action Button
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1D61E7),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      elevation: 0,
                    ),
                    child: const Text(
                      "Log In",
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                // Divider Row
                Row(
                  children: [
                    const Expanded(child: Divider(color: Color(0xFFEDF1F3))),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text("Or", style: TextStyle(color: Color(0xFF6C7278), fontSize: 12)),
                    ),
                    const Expanded(child: Divider(color: Color(0xFFEDF1F3))),
                  ],
                ),

                const SizedBox(height: 32),

                // Social Logins
                SocialLoginButton(
                  text: "Continue with Google",
                  icon: Image.asset('assets/google.png', height: 24, width: 24),
                  onPressed: () {},
                ),
                
                const SizedBox(height: 16),

                SocialLoginButton(
                  text: "Continue with Facebook",
                  icon: const Icon(Icons.facebook, color: Color(0xFF1877F2), size: 24),
                  onPressed: () {},
                ),
                
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),

      // Footer - Pinned to the bottom so it's always accessible
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 24.0, top: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Don't have an account? ",
              style: TextStyle(color: Color(0xFF6C7278), fontSize: 12, fontWeight: FontWeight.w500),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignupScreen()),
                );
              },
              child: const Text(
                "Sign Up",
                style: TextStyle(color: Color(0xFF4D81E7), fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- Custom Widgets ---

class SocialLoginButton extends StatelessWidget {
  final String text;
  final Widget icon;
  final VoidCallback onPressed;

  const SocialLoginButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          side: const BorderSide(color: Color(0xFFEDF1F3)),
          backgroundColor: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(color: Color(0xFF1A1C1E), fontWeight: FontWeight.w600, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  const PasswordField({super.key});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: !isPasswordVisible,
      decoration: InputDecoration(
        hintText: "••••••••",
        hintStyle: const TextStyle(color: Color(0xFFA1A8B0)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Color(0xFFEDF1F3)),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: const Color(0xFF9CA3AF),
          ),
          onPressed: () {
            setState(() {
              isPasswordVisible = !isPasswordVisible;
            });
          },
        ),
      ),
    );
  }
}