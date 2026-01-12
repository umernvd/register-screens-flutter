import 'package:flutter/material.dart';

/// --- Design 2: Simple Outlined Social Button ---
class SocialButtonOutlined extends StatelessWidget {
  final String text;
  final String? imagePath; // Made nullable
  final IconData? icon;    // Added icon support
  final Color? iconColor;  // Added color support for the icon

  const SocialButtonOutlined({
    super.key,
    required this.text,
    this.imagePath,
    this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {},
      // Logic: If imagePath exists, show Image; otherwise, show Icon
      icon: imagePath != null
          ? Image.asset(imagePath!, height: 24)
          : Icon(icon, color: iconColor ?? Colors.black, size: 24),
      label: Text(text, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 48),
        side: BorderSide(color: Colors.grey.shade300),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
    );
  }
}
// --- Design 3: White Button with Shadow (Google/Facebook) ---
class SocialButtonShadow extends StatelessWidget {
  final String text;
  final String? imagePath;
  final IconData? icon;
  final Color? iconColor;

  const SocialButtonShadow({
    super.key,
    required this.text,
    this.imagePath,
    this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFEDF1F3)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1D61E7).withOpacity(0.08),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: MaterialButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imagePath != null)
              Image.asset(imagePath!, height: 20)
            else if (icon != null)
              Icon(icon, color: iconColor, size: 22),
            const SizedBox(width: 8),
            Text(text, style: const TextStyle(color: Color(0xFF1A1C1E), fontWeight: FontWeight.w600, fontSize: 14)),
          ],
        ),
      ),
    );
  }
}

// --- Common: Standard Blue Primary Button ---
class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const PrimaryButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48, // Standard height for all primary buttons
      child: ElevatedButton(
        onPressed: onPressed ?? () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1D61E7), // Standard Blue
          foregroundColor: Colors.white,
          elevation: 0, // Flat look like Design 2
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}