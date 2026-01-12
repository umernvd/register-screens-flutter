import 'package:flutter/material.dart';

class InputLabel extends StatelessWidget {
  final String text;
  final Color? color;

  const InputLabel({
    super.key,
    required this.text,
    this.color, // Nullable to allow defaults
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 6.0),
        child: Text(
          text,
          style: TextStyle(
            color: color ?? const Color(0xFF6C7278), // Default to Design 3 Grey
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}