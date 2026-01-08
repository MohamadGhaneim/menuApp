import 'package:flutter/material.dart';
import 'package:menuapp/components/app_button.dart';
import 'package:menuapp/components/app_elevated_button.dart';
import 'package:menuapp/components/app_text_field.dart';
import 'package:menuapp/config/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController phoneNumberControl = TextEditingController();
  final TextEditingController nameControl = TextEditingController();
  final TextEditingController emailControl = TextEditingController();
  final TextEditingController passwordControl = TextEditingController();
  final TextEditingController confirmPasswordControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
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
                    "sign up",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "create your account now!",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  SizedBox(height: 20),

                  //phone number
                  AppButton(
                    imagePath: 'assets/images/lebanon-flag.png',
                    hint: 'Phone Number',
                    label: '+961',
                    controller: phoneNumberControl,
                  ),
                  SizedBox(height: 25),
                  AppTextField(
                    icon: Icon(Icons.email),
                    hint: 'name',
                    controller: nameControl,
                  ),
                  SizedBox(height: 25),
                  AppTextField(
                    icon: Icon(Icons.email),
                    hint: 'Email',
                    controller: emailControl,
                  ),
                  SizedBox(height: 25),
                  AppTextField(
                    icon: Icon(Icons.remove_red_eye_outlined),
                    hint: 'Password',
                    controller: passwordControl,
                  ),
                  SizedBox(height: 25),
                  AppTextField(
                    icon: Icon(Icons.remove_red_eye_outlined),
                    hint: 'Confirm Password',
                    controller: confirmPasswordControl,
                  ),
                  ///////////////////////////////
                  SizedBox(height: 25),
                  AppElevatedButton(
                    onPressed: () async {
                      if (phoneNumberControl.text.isEmpty ||
                          nameControl.text.trim().isEmpty ||
                          emailControl.text.trim().isEmpty ||
                          passwordControl.text.trim().isEmpty ||
                          passwordControl.text.trim().isEmpty) {
                        //show error
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please fill all fields')),
                        );
                        return;
                      }
                      if (passwordControl.text != confirmPasswordControl.text) {
                        //show error
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Passwords do not match')),
                        );
                        return;
                      }
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setBool('isLoggedIn', true);
                      await prefs.setString(
                        'phoneNumber',
                        phoneNumberControl.text,
                      );
                      await prefs.setString('name', nameControl.text);
                      await prefs.setString('email', emailControl.text);
                      await prefs.setString('password', passwordControl.text);
                      // got to root page
                      if (context.mounted) {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          AppRoutes.root,
                          (route) => false,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.green,
                            content: Text('sucsess'),
                          ),
                        );
                      }
                    },
                    text: 'Sign Up',
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 50,
                    ),
                    child: Row(
                      children: [
                        Expanded(child: Divider()),
                        SizedBox(width: screenWidth * 0.02),
                        Text(
                          'Or',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.02),
                        Expanded(child: Divider()),
                      ],
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
