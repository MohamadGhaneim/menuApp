import 'package:flutter/material.dart';
//import 'package:transportation/styles/app_colors.dart';

class AppTextField extends StatelessWidget {
  final String hint;
  final Icon icon;
  final bool obscureText;
  final void Function(String)? onChanged;
  final TextEditingController controller;
  const AppTextField({
    super.key,
    required this.hint,
    required this.icon,
    required this.controller,
    this.obscureText = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        // suffix: TextButton(
        //   child: Text('data', style: TextStyle(color: Colors.black)),
        //   onPressed: () => {},
        // ),
        prefixIcon: icon,
        hintText: hint,
        //labelText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
