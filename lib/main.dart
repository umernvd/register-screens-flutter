import 'package:flutter/material.dart';
import 'design1/login_screen.dart';
import 'design2/login_screen.dart';
import 'design3/login_screen.dart'; 

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MenuScreen(),
  ));
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Login Designs")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _navButton(context, "Design 1", const LoginPage1()),
            _navButton(context, "Design 2", const LoginPage2()),
            _navButton(context, "Design 3", const LoginPage3()),
          ],
        ),
      ),
    );
  }

  Widget _navButton(BuildContext context, String text, Widget screen) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => screen)),
        child: Text(text),
      ),
    );
  }
}