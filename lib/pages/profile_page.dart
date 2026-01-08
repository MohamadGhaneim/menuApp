import 'package:flutter/material.dart';
import 'package:menuapp/components/app_elevated_button.dart';
import 'package:menuapp/config/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: AppElevatedButton(
          onPressed: () async {
            final confirm = await showDialog<bool>(
              context: context,
              builder:
                  (context) => AlertDialog(
                    icon: Icon(Icons.warning, color: Colors.amber),
                    title: Text("Confirm Logout"),
                    content: Text("Are you sure you want to logout?"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: Text("No"),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: Text("Yes"),
                      ),
                    ],
                  ),
            );
            if (confirm == true) {
              final prefs = await SharedPreferences.getInstance();
              await prefs.clear();
              if (context.mounted) {
                Navigator.pushNamed(context, AppRoutes.login);
              }
            }
          },
          text: 'Log out',
        ),
      ),
    );
  }
}
