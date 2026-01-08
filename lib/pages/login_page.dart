import 'package:flutter/material.dart';
import 'package:menuapp/components/app_elevated_button.dart';
import 'package:menuapp/components/app_text_field.dart';
import 'package:menuapp/config/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    TextEditingController emailControl = TextEditingController();
    TextEditingController passwordControl = TextEditingController();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 86, 179, 255),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Let's sign your in",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "welcome back, you've been missed!",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  SizedBox(height: 20),
                  AppTextField(
                    icon: Icon(Icons.email),
                    hint: 'Email',
                    controller: emailControl,
                  ),
                  SizedBox(height: 20),
                  AppTextField(
                    icon: Icon(Icons.remove_red_eye_outlined),
                    hint: 'Password',
                    controller: passwordControl,
                  ),
                  SizedBox(height: 20),
                  AppElevatedButton(
                    onPressed: () async {
                      if (emailControl.text.isEmpty ||
                          passwordControl.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please fill in all fields')),
                        );
                        return;
                      }
                      final prefs = await SharedPreferences.getInstance();
                      if (passwordControl.text != prefs.getString('password') ||
                          emailControl.text != prefs.getString('email')) {
                        return;
                      }
                      await prefs.setBool('isLoggedIn', true);
                      if (context.mounted) {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          AppRoutes.root,
                          (route) => false,
                        );
                      }
                    },
                    text: 'Log In',
                  ),
                  SizedBox(height: 20),
                  AppElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        AppRoutes.root,
                        (route) => false,
                      );
                    },
                    text: 'Guest',
                    bgColor: const Color.fromARGB(255, 141, 204, 255),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Or',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/google.png',
                            width: screenWidth * 0.08,
                          ),
                          Text(
                            '  Sign in with Google',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed:
                            () => {
                              Navigator.of(context).pushNamed(AppRoutes.signup),
                            },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
