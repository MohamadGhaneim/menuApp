import 'package:flutter/material.dart';
import 'package:menuapp/components/app_elevated_button.dart';
import 'package:menuapp/config/app_routes.dart';
import 'package:menuapp/pages/onboarding_content_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int index = 0;
  List<Widget> pages = [
    OnboardingContentPage(
      title: 'Berwerd for you',
      description: 'Fresh coffee , Bold & Rich in flavor evry time',
      image: 'assets/images/chef.png',
    ),
    Center(child: Text('Page 2')),
    Center(child: Text('Page 3')),
  ];
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.7,
                  child: PageView(
                    //  controller: PageController(initialPage: index),
                    children: [pages[index]],
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    SizedBox(height: 20),
                    AppElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (index < 2) {
                            index++;
                          } else {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              AppRoutes.root,
                              (route) => false,
                            );
                          }
                        });
                      },
                      text: index == 2 ? 'Get Started' : 'Next',
                      bgColor: Colors.blue,
                    ),
                    SizedBox(height: 20),
                    AppElevatedButton(
                      textColor: Colors.blue,
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          AppRoutes.login,
                          (route) => false,
                        );
                      },
                      text: 'Skip',
                      bgColor: Colors.white,
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                        (i) => Container(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          width: index == i ? 20 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: index == i ? Colors.blue : Colors.grey,
                            borderRadius: BorderRadius.circular(4),
                          ),
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
    );
  }
}
