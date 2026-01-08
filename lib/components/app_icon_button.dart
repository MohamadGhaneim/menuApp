import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  final VoidCallback onPress;
  final IconData icon;
  final Color? btnColor;
  final String? text;
  const AppIconButton({
    super.key,
    required this.onPress,
    required this.icon,
    this.btnColor = Colors.white,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: btnColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.black, size: 30),
            Text(text as String, style: TextStyle(color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
