import 'package:flutter/material.dart';

// --- Design 2: Standard Bordered Input ---
class StandardTextField extends StatelessWidget {
  final String hint;
  final Widget? suffixIcon;

  const StandardTextField({super.key, required this.hint, this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFEDF1F3)),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}

// --- Design 3: White Box with Shadow Input ---
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
        style: const TextStyle(color: Color(0xFF1A1C1E), fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Color(0xFF1A1C1E)),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}

// --- Common: Password Field with Toggle (Stateful) ---
class PasswordField extends StatefulWidget {
  final bool useShadowStyle; // Toggle between Design 2 & 3 styles
  
  const PasswordField({super.key, this.useShadowStyle = false});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    final suffix = IconButton(
      icon: Icon(
        isVisible ? Icons.visibility : Icons.visibility_off,
        color: Colors.grey,
      ),
      onPressed: () => setState(() => isVisible = !isVisible),
    );

    if (widget.useShadowStyle) {
      return ShadowInput(
        hint: "*******",
        obscureText: !isVisible,
        suffixIcon: suffix,
      );
    }

    return StandardTextField(
      hint: "*******",
      suffixIcon: suffix,
    );
  }
}

// --- Common: Date Picker Field ---
class DatePickerField extends StatefulWidget {
  final String hint;
  final bool useShadowStyle;

  const DatePickerField({
    super.key, 
    required this.hint, 
    this.useShadowStyle = false
  });

  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  final TextEditingController _controller = TextEditingController();

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF1D61E7),
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _controller.text = "${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final suffix = IconButton(
      icon: const Icon(Icons.calendar_today_outlined, color: Colors.grey, size: 20),
      onPressed: _selectDate,
    );

    if (widget.useShadowStyle) {
      // For Design 3, we usually just use the ShadowInput, but binding the controller 
      // requires a bit more logic. For now, we reuse the styles:
      return GestureDetector(
        onTap: _selectDate,
        child: AbsorbPointer(
           child: ShadowInput(hint: widget.hint, suffixIcon: suffix),
        ),
      );
    }
    
    return TextField(
      controller: _controller,
      readOnly: true,
      onTap: _selectDate,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: const TextStyle(color: Colors.grey),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFEDF1F3)),
        ),
        suffixIcon: suffix,
      ),
    );
  }
}