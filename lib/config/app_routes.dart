import 'package:menuapp/pages/home_page.dart';
import 'package:menuapp/pages/login_page.dart';
import 'package:menuapp/pages/onboarding_page.dart';
import 'package:menuapp/pages/root_screen.dart';
import 'package:menuapp/pages/signup_page.dart';
import 'package:menuapp/pages/splash_screen_page.dart';

class AppRoutes {
  static const root = '/';
  static const login = '/login';
  static const signup = '/signup';
  static const home = '/home';
  static const onboarding = '/onboarding';
  static const splashScreen = '/splashscreen';

  static final pages = {
    AppRoutes.root: (context) => RootScreen(),
    AppRoutes.login: (context) => LoginPage(),
    AppRoutes.signup: (context) => SignupPage(),
    AppRoutes.home: (context) => HomePage(),
    AppRoutes.onboarding: (context) => OnboardingPage(),
    AppRoutes.splashScreen: (context) => SplashScreenPage(),
  };
}
